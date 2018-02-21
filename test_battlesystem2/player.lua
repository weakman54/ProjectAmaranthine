
local Animation = require "animation"
local AC = require "animationCollection"

local SM = require "makeshiftSM"


player = {
  state = "none",
  ac = AC:new(),
  timer = Timer.new(),
  attackDuration = 0.5,
  dodgeDuration = 1,

  sm = SM:new(),
}


player.sm.states = {
  idle = {guard = true, dodge_high = true, dodge_low = true, attack = true},
  guard = {idle = true, attack = true},
  dodge_high = {idle = true},
  dodge_low = {idle = true},
  attack = {idle = true, guard = true},
}

function player:setState(state)
  if not self.sm:switch(state) then return end
  self.timer:clear() -- TODO: make sure this is done proper!

  self.ac:setAnimation(state)

  if state == "attack" then -- TODO: implement more proper state machine!!
    self.attackTimer = self.timer:script(player.doAttack)

  elseif state == "dodge_low" or state == "dodge_high" then
    self.dodgeTimer = self.timer:script(player.doDodge)

  end
end



function player.doAttack(waitFunc) -- Globally mutating, but can't do it any other way atm =/
  enemy:receiveAttack()
  waitFunc(player.attackDuration)
  player:setState("idle") 
end

function player.doDodge(waitFunc)
  waitFunc(player.dodgeDuration)
  player:setState("idle")
end









function player:update(dt)
  self.timer:update(dt)
  self.ac:update(dt)
end

function player:draw()
  self.ac:loveDraw(nil, nil, nil, nil, nil, 250, 250)
end


function player:keypressed(key, scancode, isrepeat)
  if key == "g" then
    if love.keyboard.isDown("w") then
      self:setState("dodge_high")

    elseif love.keyboard.isDown("s") then
      self:setState("dodge_low")

    else
      self:setState("guard")
    end

  elseif key == "space" then
    self:setState("attack")

  elseif key == "" then

  end
end


function player:keyreleased(key)
  if key == "g" then
    self:setState("idle")
  end
end



