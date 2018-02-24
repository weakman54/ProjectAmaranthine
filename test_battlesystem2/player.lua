
local Animation = require "animation"
local AC = require "animationCollection"

local SM = require "makeshiftSM"


player = {
  state = "none",
  ac = AC:new(),
  timer = Timer.new(),  
  sm = SM:new(),

  attackDuration = 0.5,
  dodgeDuration = 1,
}

function initializePlayer()

  player.ac.name = "player"

  do -- Initialize animations
    local anim

    anim = Animation:new()
    player.ac:addAnimation("attack", anim)

    anim:importFrame{
      image = love.graphics.newImage("assets/player_attack_0001.png"),
      duration = 0.4,
    }


    anim = Animation:new()
    player.ac:addAnimation("dodge_high", anim)

    anim:importFrame{
      image = love.graphics.newImage("assets/player_dodge-high_0001.png"),
      duration = 0.4,
    }


    anim = Animation:new()
    player.ac:addAnimation("dodge_low", anim)

    anim:importFrame{
      image = love.graphics.newImage("assets/player_dodge-low_0001.png"),
      duration = 0.4,
    }


    anim = Animation:new()
    player.ac:addAnimation("guard", anim)

    anim:importFrame{
      image = love.graphics.newImage("assets/player_guard_0001.png"),
      duration = 0.4,
    }
    anim:importFrame{
      image = love.graphics.newImage("assets/player_guard_0002.png"),
      duration = 0.4,
    }


    anim = Animation:new()
    player.ac:addAnimation("idle", anim)

    anim:importFrame{
      image = love.graphics.newImage("assets/player_idle_0001.png"),
      duration = 0.4,
    }
    anim:importFrame{
      image = love.graphics.newImage("assets/player_idle_0002.png"),
      duration = 0.4,
    }
  end
  --
  player.ac:overrideDoEvent(function(self, event, ...) 
      local eventName = self.name .. "_" .. event
--      print(eventName)
      Signal.emit(eventName, ...) 
    end)


  player.sm.states = {
    idle = {guard = true, dodge_high = true, dodge_low = true, attack = true},
    guard = {idle = true, attack = true},
    dodge_high = {idle = true},
    dodge_low = {idle = true},
    attack = {idle = true, guard = true},
  }

  player:setState("idle")
end
--


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



function player.doAttack(waitFunc)
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
  if key == "g" and self.sm:is("guard") then
    self:setState("idle")
  end
end



