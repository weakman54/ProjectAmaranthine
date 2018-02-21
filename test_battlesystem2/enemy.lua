
local Animation = require "animation"
local AC = require "animationCollection"

local SM = require "makeshiftSM"


enemy = {
  state = "none",
  ac = AC:new(),
  timer = Timer.new(),

  offsetPos = {x = 0, y = 0},

  guardDuration = 1.25,

  shakeDuration = 0.1,
  shakeIntensity = 10,

  knockbackDuration = 0.2,
  knockbackDist = 100, -- (pixels)
  
  sm = SM:new(),
}

enemy.sm.states = {
  idle          = {guard  = true , attack_windup = true},
  attack_windup = {attack = true , hurt = true},
  guard         = {idle   = true},
  attack        = {idle   = true , guard = true},
}


function enemy:setState(state)
--  print(state, self.sm:switch(state))
  if not self.sm:switch(state) then return end
  
  self.timer:clear() -- THIS MIGHT BE BROKEN  
  
  self.ac:setAnimation(state)
end




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
  print(self.sm.currentState)
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
end