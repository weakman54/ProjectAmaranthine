

local Animation = require "animation"
local AC = require "animationCollection"

local SM = require "statemachine.statemachine"

local menuState = require "stateMenu" -- TODO: make sure statechanges are better implemented


enemy = {
  timer = Timer.new(),  
  ac = AC:new(),

  highlow = "low",

  offsetPos = {x = 0, y = 0},

  maxhealth = 5,

  guardDuration = 1.25,

  shakeDuration = 0.1,
  shakeIntensity = 10,

  knockbackDuration = 0.2,
  knockbackDist = 100, -- (pixels)


  windupWaitTime = 2,
  timingWindowTime = 0.4,
  timingWindowDuration = 0.3,

  hurtDuration = 1,
}
--

function enemy:initializeAnimationCollection()
  self.ac.name = "enemy"

  self:loadAnimations()

  self.ac:overrideDoEvent(function(self, event, ...) 
      local eventName = self.name .. "_" .. event
--      print(eventName)
      Signal.emit(eventName, ...) 
    end)
end
--

function enemy:loadAnimations()
  local anim

  anim = Animation:new()
--  print(Animation, getmetatable(anim))
  self.ac:addAnimation("attack_windup_high", anim)

  anim:importFrame{
    image = love.graphics.newImage("assets/enemy_attack-windup-high_0001.png"),
    duration = 0.2,
  }
  anim:importFrame{
    image = love.graphics.newImage("assets/enemy_attack-windup-high_0002.png"),
    duration = 0.2,
  }


  anim = Animation:new()
  self.ac:addAnimation("attack_low", anim)

  anim:importFrame{
    image = love.graphics.newImage("assets/enemy_attack-low_0001.png"),
    duration = 0.4,
  }
  anim:importFrame{
    image = love.graphics.newImage("assets/enemy_attack-low_0002.png"),
    duration = 0.4,
  }

  anim = Animation:new()
--  print(Animation, getmetatable(anim))
  self.ac:addAnimation("attack_windup_low", anim)

  anim:importFrame{
    image = love.graphics.newImage("assets/enemy_attack-windup-low_0001.png"),
    duration = 0.2,
  }
  anim:importFrame{
    image = love.graphics.newImage("assets/enemy_attack-windup-low_0002.png"),
    duration = 0.2,
  }



  anim = Animation:new()
  self.ac:addAnimation("attack_high", anim)

  anim:importFrame{
    image = love.graphics.newImage("assets/enemy_attack-high_0001.png"),
    duration = 0.4,
  }
  anim:importFrame{
    image = love.graphics.newImage("assets/enemy_attack-high_0002.png"),
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

function enemy:initializeStateMachine()
  self.sm = SM.create{
    initial = "idle",
    events = {
      { name = "doidle", from = "*", to = "idle" },
      { name = "doguard", from = {"idle", "guard"}, to = "guard" },
      { name = "dowindup", from = {"idle", "hurt"}, to = "attack_windup"},
      { name = "doattack", from = {"attack_windup"}, to = "attack"},
      { name = "dohurt", from = {"attack_windup", "attack"}, to = "hurt"} -- Again, is there a way to only switch if a specific condition is met?
    },
    callbacks = {
      onstatechange = function(self, event, from, to, ...)
        if self.owner.ac:has(to) then 
          self.owner.ac:setAnimation(to) 

        elseif self.owner.ac:has(to .. "_" .. self.owner.highlow) then
          self.owner.ac:setAnimation(to .. "_" .. self.owner.highlow) -- HACK!
        end
      end,
    },
  }

  function self.sm:onidle(event, from, to, ...)
    enemy.timer:clear() -- THIS MIGHT BE BROKEN

    enemy.highlow = enemy.highlow == "low" and "high" or "low"

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



  function self.sm:onattack_windup(event, from, to, highlow)

    enemy.timer:after(enemy.timingWindowTime, function() Signal.emit("goodTiming", true) end)
    enemy.timer:after(enemy.timingWindowTime + enemy.timingWindowDuration, function() enemy.sm:doattack() end)
  end
  function self.sm:onleaveattack_windup(event, from, to)
    if to == "hurt" then return end
    Signal.emit("goodTiming", false)
  end

  function self.sm:onattack()
    player:receiveAttack(enemy.highlow)
  end

  Signal.register("enemy_attack_low_looped", function() enemy.sm:doidle() end)
  Signal.register("enemy_attack_high_looped", function() enemy.sm:doidle() end)


  function self.sm:onhurt()
    self.owner.ac:setAnimation("idle")
    local damageTaken = 1
    if enemy.goodTiming then
      damageTaken = 3
      Signal.emit("goodTiming", false)
    end

    enemy.health = enemy.health - damageTaken

    if enemy.health <= 0 then -- Replace with game state transition
      enemy.dead = true
    end

    enemy:hurtFeedback()
  end
  function self.sm:onleavehurt()
    enemy.hurt = false
    enemy.offsetPos.x, enemy.offsetPos.y = 0, 0 -- This looks wierd, probably needs animation and/or tween, needs looking at
  end

  self.sm.owner = self
end
--

function enemy:reset()
  self.timer:clear()

  self.health = self.maxhealth
  self.dead = false
  self.hurt = false

  self.offsetPos.x, self.offsetPos.y = 0, 0

  self.sm:doidle()
end
--

function enemy:initialize()
  self:initializeAnimationCollection()
  self:initializeStateMachine()

  self:reset()
end
--



function enemy:hurtFeedback()
  love.audio.play("assets/hurt.wav")

  enemy.hurt = true

  enemy.timer:clear()
  enemy.timer:after(enemy.hurtDuration, function() 
      enemy.sm:doidle() 
    end)

  enemy.timer:tween(enemy.knockbackDuration, enemy, {offsetPos = {x = enemy.knockbackDist, y = 0}}, "out-expo")

  enemy.timer:during(enemy.shakeDuration, function()
      enemy.offsetPos.x = enemy.offsetPos.x + math.random(-enemy.shakeIntensity, enemy.shakeIntensity)
      enemy.offsetPos.y = enemy.offsetPos.y + math.random(-enemy.shakeIntensity, enemy.shakeIntensity)
    end)
end




function enemy:setResetWindupWait()
  if self["windupWaitTimer"] then
    self.timer:cancel(self["windupWaitTimer"])
  end

  self["windupWaitTimer"] = self.timer:after(self.windupWaitTime, function() enemy.sm:dowindup() end)
end
--

function enemy:setResetGuardTimer()
  if self["guardTimer"] then 
    self.timer:cancel(self["guardTimer"])
  end

  self["guardTimer"] = self.timer:after(self.guardDuration, function() enemy.sm:doidle() end)
end
--



Signal.register("goodTiming", function(value)
    -- TODO: animations
    enemy.goodTiming = value 
  end)


function enemy:receiveAttack(info)
  if self.sm:can("doguard") then
    self.sm:doguard()
  elseif self.sm:can("dohurt") then
    self.sm:dohurt()
  end

  if info and info.thing == "fromDodge" then
    self.hurt = true
  end
end


function enemy:update(dt)
  self.timer:update(dt)
  self.ac:update(dt)

  if self.dead then Gamestate.switch(menuState, {won=true}) end
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
  if self.dead then Gamestate.switch(menuState) end
  love.graphics.setColor(255, 000, 255)
  love.graphics.print(healthStr, 1500, 200)
  love.graphics.setColor(255, 255, 255)
end