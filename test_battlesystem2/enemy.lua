

local Animation = require "animation"
local AC = require "animationCollection"

local SM = require "makeshiftSM"


enemy = {
  state = "none",
  ac = AC:new(),
  timer = Timer.new(),  
  sm = SM:new(),


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
  if not self.sm:switch(state) then return end

  self.timer:clear() -- THIS MIGHT BE BROKEN  

  local loop = true
  if state == "attack" then
    loop = false
  end


  self.ac:setAnimation(state, loop)

  if state == "idle" then
    self:setResetWindup()
  end
end



function enemy:setResetWindup()
  if self.windupTimer then
    self.timer:cancel(self.windupTimer)
    self.windupTimer = nil
  end

  self.timer:after(self.windupWaitTime, enemy.attackWaitHelper)
end


function enemy.attackWaitHelper()
  enemy:doWindup()
end


function enemy:doWindup()
  self:setState("attack_windup")

  self.timer:after(self.timingWindowTime, signalGoodTiming)
  self.timer:after(self.timingWindowTime + self.timingWindowDuration, enemy.doAttack)
end


function signalGoodTiming()
  enemy.goodTiming = true
end


function enemy.doAttack()
  enemy.goodTiming = false
  enemy:setState("attack")
--  enemy.timer:after(0.79, function() enemy:setState("idle") end) -- Hardcoded atm, this needs looking at...
end
Signal.register("enemy_attack_ended", function() enemy:setState("idle") end)




function enemy:doGuard()  
  if self.sm.currentState ~= "guard" then -- If first time guarding, do knockback tweens
    self:setState("guard")
    self.timer:tween(enemy.knockbackDuration, self, {offsetPos = {x = self.knockbackDist, y = 0}}, "out-expo")

    self.timer:during(self.shakeDuration, function()
        self.offsetPos.x = self.offsetPos.x + math.random(-self.shakeIntensity, self.shakeIntensity)
        self.offsetPos.y = self.offsetPos.y + math.random(-self.shakeIntensity, self.shakeIntensity)
      end)
  end

  -- set timer, reset if already going
  if self.guardTimer then 
    self.timer:cancel(self.guardTimer) 
    self.guardTimer = nil 
  end

  self.guardTimer = self.timer:after(self.guardDuration, enemy.afterGuard)
end
function enemy.afterGuard()
  enemy:exitGuard() -- Uh, idk even...
end
function enemy:exitGuard()
  self.guardTimer = nil
  self:setState("idle")
  self.offsetPos.x, self.offsetPos.y = 0, 0 -- This looks wierd, probably needs animation and/or tween, needs looking at
end






function enemy:receiveAttack()
--  print(self.sm.currentState)
  if self.sm.currentState == "idle" or self.sm.currentState == "guard" then
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