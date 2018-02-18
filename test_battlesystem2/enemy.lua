
local Animation = require "animation"
local AC = require "animationCollection"


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
}

function enemy:doGuard()
  if self.state ~= "guard" then
    self:setState("guard")
    self.timer:tween(enemy.knockbackDuration, self, {offsetPos = {x = self.knockbackDist, y = 0}}, "out-expo")

    self.timer:during(self.shakeDuration, function()
        self.offsetPos.x = self.offsetPos.x + math.random(-self.shakeIntensity, self.shakeIntensity)
        self.offsetPos.y = self.offsetPos.y + math.random(-self.shakeIntensity, self.shakeIntensity)

      end)
  end

  if self.guardTimer then 
    self.timer:cancel(self.guardTimer) 
    self.guardTimer = nil 
  end
  
  self.guardTimer = self.timer:after(self.guardDuration, enemy.afterGuard)
end
function enemy.afterGuard()
  enemy:exitGuard() -- Uh, idk even know...
end
function enemy:exitGuard()
  self.guardTimer = nil
  self:setState("idle")
  self.offsetPos.x, self.offsetPos.y = 0, 0 -- This looks wierd, probably needs animation and/or tween, needs looking at
end


function enemy:setState(state)
  self.timer:clear() -- THIS MIGHT BE BROKEN  
  self.state = state
  self.ac:setAnimation(state)
end



function enemy:receiveAttack()
  if self.state == "idle" or self.state == "guard" then
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