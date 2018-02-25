

local Animation = require "animation"
local AC = require "animationCollection"

local SM = require "statemachine.statemachine"


enemy = {
  timer = Timer.new(),  

  offsetPos = {x = 0, y = 0},


  guardDuration = 1.25,

  shakeDuration = 0.1,
  shakeIntensity = 10,

  knockbackDuration = 0.2,
  knockbackDist = 100, -- (pixels)


  windupWaitTime = 2,
  timingWindowTime = 1,
  timingWindowDuration = 0.5,

  hurtDuration = 1,
}
--



function enemy:initialize()
  self.maxhealth = 10
  self.health = self.maxhealth


  self.ac = AC:new()
  self.ac.name = "enemy"

  do -- Import animations
    local anim

    anim = Animation:new()
--  print(Animation, getmetatable(anim))
    self.ac:addAnimation("attack_windup", anim)

    anim:importFrame{
      image = love.graphics.newImage("assets/enemy_attack-windup_0001.png"),
      duration = 0.2,
    }
    anim:importFrame{
      image = love.graphics.newImage("assets/enemy_attack-windup_0002.png"),
      duration = 0.2,
    }


    anim = Animation:new()
    self.ac:addAnimation("attack", anim)

    anim:importFrame{
      image = love.graphics.newImage("assets/enemy_attack_0001.png"),
      duration = 0.4,
    }
    anim:importFrame{
      image = love.graphics.newImage("assets/enemy_attack_0002.png"),
      duration = 0.4,
    }


    anim = Animation:new()
    self.ac:addAnimation("guard", anim)

    anim:importFrame{
      image = love.graphics.newImage("assets/enemy_guard_0001.png"),
      duration = 0.4,
    }
    anim:importFrame{
      image = love.graphics.newImage("assets/enemy_guard_0002.png"),
      duration = 0.4,
    }
    anim:importFrame{
      image = love.graphics.newImage("assets/enemy_guard_0003.png"),
      duration = 0.4,
    }


    anim = Animation:new()
    self.ac:addAnimation("idle", anim)

    anim:importFrame{
      image = love.graphics.newImage("assets/enemy_idle_0001.png"),
      duration = 0.4,
    }
    anim:importFrame{
      image = love.graphics.newImage("assets/enemy_idle_0002.png"),
      duration = 0.4,
    }
  end
  --

  self.ac:overrideDoEvent(function(self, event, ...) 
      local eventName = self.name .. "_" .. event
--      print(eventName)
      Signal.emit(eventName, ...) 
    end)







  self.sm = SM.create{
    initial = "idle",
    events = {
      { name = "doidle", from = "*", to = "idle" },
      { name = "doguard", from = {"idle", "guard"}, to = "guard" },
      { name = "dowindup", from = {"idle", "hurt"}, to = "attack_windup"},
      { name = "doattack", from = {"attack_windup"}, to = "attack"},
      { name = "dohurt", from = {"attack_windup"}, to = "hurt"}
    },
    callbacks = {
      onstatechange = function(self, event, from, to, ...) if self.owner.ac:has(to) then self.owner.ac:setAnimation(to) end end,
    },
  }

  function self.sm:onidle(event, from, to, ...)
    enemy.timer:clear() -- THIS MIGHT BE BROKEN
    enemy:setResetWindupWait()
  end

  function self.sm:onguard(event, from, to, ...)
    enemy:setResetGuardTimer()

    if from ~= "guard" then
      enemy.timer:tween(enemy.knockbackDuration, enemy, {offsetPos = {x = enemy.knockbackDist, y = 0}}, "out-expo")

      enemy.timer:during(enemy.shakeDuration, function()
          enemy.offsetPos.x = enemy.offsetPos.x + math.random(-enemy.shakeIntensity, enemy.shakeIntensity)
          enemy.offsetPos.y = enemy.offsetPos.y + math.random(-enemy.shakeIntensity, enemy.shakeIntensity)
        end)
    end
  end
  function self.sm:onleaveguard(event, from, to)
    if to ~= "guard" then
      enemy.offsetPos.x, enemy.offsetPos.y = 0, 0 -- This looks wierd, probably needs animation and/or tween, needs looking at
    end
  end



  function self.sm:onattack_windup()
    enemy.timer:after(enemy.timingWindowTime, enemy.signalGoodTiming)
    enemy.timer:after(enemy.timingWindowTime + enemy.timingWindowDuration, function() enemy.sm:doattack() end)
  end
  function self.sm:onleaveattack_windup(event, from, to)
    if to == "hurt" then return end
    enemy.goodTiming = false
  end

  function self.sm:onattack()
    player:receiveAttack()
  end

  Signal.register("enemy_attack_looped", function() enemy.sm:doidle() end)


  function self.sm:onhurt()
    enemy.hurt = true

    local damageTaken = 1
    if enemy.goodTiming then
      print("ASLKDJ")
      damageTaken = 3
      enemy.goodTiming = false
    end

    enemy.health = enemy.health - damageTaken

    if enemy.health <= 0 then -- Replace with game state transition
      enemy.dead = true
    end


    enemy.timer:clear()
    enemy.timer:after(enemy.hurtDuration, function() enemy.sm:doidle() end)

    enemy.timer:tween(enemy.knockbackDuration, enemy, {offsetPos = {x = enemy.knockbackDist, y = 0}}, "out-expo")

    enemy.timer:during(enemy.shakeDuration, function()
        enemy.offsetPos.x = enemy.offsetPos.x + math.random(-enemy.shakeIntensity, enemy.shakeIntensity)
        enemy.offsetPos.y = enemy.offsetPos.y + math.random(-enemy.shakeIntensity, enemy.shakeIntensity)
      end)
  end
  function self.sm:onleavehurt()
    enemy.hurt = false
    enemy.offsetPos.x, enemy.offsetPos.y = 0, 0 -- This looks wierd, probably needs animation and/or tween, needs looking at
  end



  self.sm.owner = self

  self.sm:doidle()




--  self.sm.states = {
--    idle          = {guard  = true , attack_windup = true},
--    attack_windup = {attack = true , hurt = true},
--    guard         = {idle   = true},
--    attack        = {idle   = true , guard = true},
--  }

--  self:setState("idle")
end
--


--function enemy:setState(state)
--  local previous = self.sm.currentState

--  self.sm:switch(state)

--  self.timer:clear() -- THIS MIGHT BE BROKEN  


--  -- Do "onEnter" events here for now
--  if state == "idle" then
--    self.ac:setAnimation(state)

--    self:setResetWindupWait()
--  end

--  if state == "attack" then
--    self.ac:setAnimation(state, false)

--    enemy.goodTiming = false
--  end

--  if state == "attack_windup" then
--    self.ac:setAnimation(state)

--    self.timer:after(self.timingWindowTime, enemy.signalGoodTiming)
--    self.timer:after(self.timingWindowTime + self.timingWindowDuration, enemy.doattack)
--  end

--  if state == "guard" then
--    self.ac:setAnimation(state)

--    self:setResetGuardTimer()

--    if previous ~= "guard" then
--      self.timer:tween(enemy.knockbackDuration, self, {offsetPos = {x = self.knockbackDist, y = 0}}, "out-expo")

--      self.timer:during(self.shakeDuration, function()
--          self.offsetPos.x = self.offsetPos.x + math.random(-self.shakeIntensity, self.shakeIntensity)
--          self.offsetPos.y = self.offsetPos.y + math.random(-self.shakeIntensity, self.shakeIntensity)
--        end)
--    end
--  end
--end
--




function enemy:setResetWindupWait()
  if self["windupWaitTimer"] then
    self.timer:cancel(self["windupWaitTimer"])
  end

  self["windupWaitTimer"] = self.timer:after(self.windupWaitTime, function() enemy.sm:dowindup() end)
end

function enemy:setResetGuardTimer()
  if self["guardTimer"] then 
    self.timer:cancel(self["guardTimer"])
  end

  self["guardTimer"] = self.timer:after(self.guardDuration, function() enemy.sm:doidle() end)
end
--




function enemy.signalGoodTiming()
  -- TODO: animations
  enemy.goodTiming = true
end





--function enemy.doattack()
--  enemy:setState("attack")
--end




--function enemy:doguard()  
--  self:setState("guard")
--end

--function enemy.exitguard()
--  enemy:setState("idle")
--  -- NOTE: The reason this is not in the setState method is because this should be "onExit", not "onEnter"
--  enemy.offsetPos.x, enemy.offsetPos.y = 0, 0 -- This looks wierd, probably needs animation and/or tween, needs looking at
--end






function enemy:receiveAttack()
  if self.sm:can("doguard") then
    self.sm:doguard()
  elseif self.sm:can("dohurt") then
    self.sm:dohurt()
  end
end



function enemy:update(dt)
  self.timer:update(dt)
  self.ac:update(dt)
end


function enemy:draw()
  if self.hurt then
    love.graphics.setColor(255, 000, 000)
  end

  self.ac:loveDraw(nil, nil, nil, nil, nil, 250 - self.offsetPos.x, 250 - self.offsetPos.y)

  love.graphics.setColor(255, 255, 255)

  if enemy.goodTiming then
    love.graphics.circle("fill", 1000, 500, 100)
  end
  
  local healthStr = tostring(self.health)
  if self.dead then healthStr = "dead" end
  love.graphics.setColor(255, 000, 255)
  love.graphics.print(healthStr, 1500, 200)
  love.graphics.setColor(255, 255, 255)
end