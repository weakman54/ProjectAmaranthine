

local Animation = require "animation"
local AC = require "animationCollection"

local SM = require "makeshiftSM"


enemy = {
  ac = AC:new(),
  timer = Timer.new(),  
  sm = SM:new("idle"),


  offsetPos = {x = 0, y = 0},

  guardDuration = 1.25,

  shakeDuration = 0.1,
  shakeIntensity = 10,

  knockbackDuration = 0.2,
  knockbackDist = 100, -- (pixels)

  windupWaitTime = 1,
  timingWindowTime = 1,
  timingWindowDuration = 0.5,
}
--


function initializeEnemy()

  enemy.ac.name = "enemy"

  do -- Import animations
    local anim

    anim = Animation:new()
--  print(Animation, getmetatable(anim))
    enemy.ac:addAnimation("attack_windup", anim)

    anim:importFrame{
      image = love.graphics.newImage("assets/enemy_attack-windup_0001.png"),
      duration = 0.2,
    }
    anim:importFrame{
      image = love.graphics.newImage("assets/enemy_attack-windup_0002.png"),
      duration = 0.2,
    }


    anim = Animation:new()
    enemy.ac:addAnimation("attack", anim)

    anim:importFrame{
      image = love.graphics.newImage("assets/enemy_attack_0001.png"),
      duration = 0.4,
    }
    anim:importFrame{
      image = love.graphics.newImage("assets/enemy_attack_0002.png"),
      duration = 0.4,
    }


    anim = Animation:new()
    enemy.ac:addAnimation("guard", anim)

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
    enemy.ac:addAnimation("idle", anim)

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

  enemy.ac:overrideDoEvent(function(self, event, ...) 
      local eventName = self.name .. "_" .. event
--      print(eventName)
      Signal.emit(eventName, ...) 
    end)


  enemy.sm.states = {
    idle          = {guard  = true , attack_windup = true},
    attack_windup = {attack = true , hurt = true},
    guard         = {idle   = true},
    attack        = {idle   = true , guard = true},
  }

  enemy:setState("idle")
end
--


function enemy:setState(state)
--  print(state, self.sm:switch(state))

  local previous = self.sm.currentState

  self.sm:switch(state)

--  if not self.sm:switch(state) then return end

  self.timer:clear() -- THIS MIGHT BE BROKEN  


  -- Do "onEnter" events here for now
  if state == "idle" then
    self.ac:setAnimation(state)

    self:setResetWindupWait()
  end

  if state == "attack" then
    self.ac:setAnimation(state, false)

    enemy.goodTiming = false
  end

  if state == "attack_windup" then
    self.ac:setAnimation(state)

    self.timer:after(self.timingWindowTime, enemy.signalGoodTiming)
    self.timer:after(self.timingWindowTime + self.timingWindowDuration, enemy.doAttack)
  end

  if state == "guard" then
    self.ac:setAnimation(state)

    self:setResetGuardTimer()

    if previous ~= "guard" then
      self.timer:tween(enemy.knockbackDuration, self, {offsetPos = {x = self.knockbackDist, y = 0}}, "out-expo")

      self.timer:during(self.shakeDuration, function()
          self.offsetPos.x = self.offsetPos.x + math.random(-self.shakeIntensity, self.shakeIntensity)
          self.offsetPos.y = self.offsetPos.y + math.random(-self.shakeIntensity, self.shakeIntensity)
        end)
    end
  end
end
--


-- Mostly superfluous generalization, and doesn't work too well, want to look into it more though
--function enemy:setResetTimer(timerHandleStr, time, func)
--  if self[timerHandleStr] then
--    self.timer:cancel(self[timerHandleStr])
--  end
  
--  self[timerHandleStr] = self.timer:after(time, func)
--end


function enemy:setResetWindupWait()
  if self["windupWaitTimer"] then
    self.timer:cancel(self["windupWaitTimer"])
  end

  self["windupWaitTimer"] = self.timer:after(self.windupWaitTime, function() enemy:setState("attack_windup") end)
end

function enemy:setResetGuardTimer()
  if self["guardTimer"] then 
    self.timer:cancel(self["guardTimer"])
  end

  self["guardTimer"] = self.timer:after(self.guardDuration, enemy.exitGuard)
end
--




function enemy.signalGoodTiming()
  -- TODO: animations
  enemy.goodTiming = true
end




function enemy.doAttack()
  enemy:setState("attack")
end
Signal.register("enemy_attack_ended", function() enemy:setState("idle") end)




function enemy:doGuard()  
  self:setState("guard")
end

function enemy.exitGuard()
  enemy:setState("idle")
  -- NOTE: The reason this is not in the setState method is because this should be "onExit", not "onEnter"
  enemy.offsetPos.x, enemy.offsetPos.y = 0, 0 -- This looks wierd, probably needs animation and/or tween, needs looking at
end






function enemy:receiveAttack()

  if self.sm:is("idle") or self.sm:is("guard") then
    self:doGuard()
  end
end




function enemy:update(dt)
  self.timer:update(dt)
  self.ac:update(dt)
end


function enemy:draw()
  self.ac:loveDraw(nil, nil, nil, nil, nil, 250 - self.offsetPos.x, 250 - self.offsetPos.y)
  if enemy.goodTiming then
    love.graphics.circle("fill", 1000, 500, 100)
  end
end