
local Animation = require "animation"
local AC = require "animationCollection"

local SM = require "statemachine.statemachine"


local stateMenu    = require "stateMenu" -- TODO: make sure statechanges are better implemented
local stateDodging = require "stateDodging"


player = {}


function player:loadAnimations()
  local anim

  anim = Animation:new()
  self.ac:addAnimation("attack", anim)

  anim:importFrame{
    image = love.graphics.newImage("assets/player_attack_0001.png"),
    duration = 0.4,
  }


  anim = Animation:new()
  self.ac:addAnimation("dodge_high", anim)

  anim:importFrame{
    image = love.graphics.newImage("assets/player_dodge-high_0001.png"),
    duration = 0.4, -- NOTE: this is currently controlled by dodgeDuration
  }


  anim = Animation:new()
  self.ac:addAnimation("dodge_low", anim)

  anim:importFrame{
    image = love.graphics.newImage("assets/player_dodge-low_0001.png"),
    duration = 0.4,-- NOTE: this is currently controlled by dodgeDuration
  }


  anim = Animation:new()
  self.ac:addAnimation("guard", anim)

  anim:importFrame{
    image = love.graphics.newImage("assets/player_guard_0001.png"),
    duration = 0.4,
  }
  anim:importFrame{
    image = love.graphics.newImage("assets/player_guard_0002.png"),
    duration = 0.4,
  }


  anim = Animation:new()
  self.ac:addAnimation("idle", anim)

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


function player:initializeStateMachine()
  self.sm = SM.create{
    initial = "idle",
    events = {
      { name = "doidle"      , from = "*"                                , to = "idle" },
      { name = "doguard"     , from = {"idle", "guard"}                  , to = "guard" },
      { name = "dododge_high", from = {"idle"}                           , to = "dodge_high"},
      { name = "dododge_low" , from = {"idle"}                           , to = "dodge_low" },
      { name = "doattack"    , from = {"idle"}                           , to = "attack"},
      { name = "dohurt"      , from = {"idle", "dodge_high", "dodge_low"}, to = "hurt"}
    },
    callbacks = {
      onstatechange = function(self, event, from, to, ...) if self.owner.ac:has(to) then self.owner.ac:setAnimation(to) end end,
    },
  }


  function player.sm:onattack()
    enemy:receiveAttack()
    player.attackTimer = player.timer:after(player.attackDuration, function() player.sm:doidle() end)
  end

  function player.sm:ondodge_high()
    player.timer:after(player.dodgeDuration, function() player.sm:doidle() end)
    if player.goodTiming then
      player.hasGoodTiming = true -- THis is hack, should think about how to improve
    end
  end
  function player.sm:onleavedodge_high()
    player.hasGoodTiming = false
  end


  function player.sm:ondodge_low()
    player.timer:after(player.dodgeDuration, function() player.sm:doidle() end)

    if player.goodTiming then
      player.hasGoodTiming = true  -- THis is hack, should think about how to improve
    end
  end
  function player.sm:onleavedodge_low()
    player.hasGoodTiming = false
  end


  function player.sm:onhurt()
    player.hurt = true

    player.health = player.health - 2

    if player.health <= 0 then -- Replace with game state transition
      player.dead = true
    end


    love.audio.play("assets/hurt.wav")


    player.timer:after(player.hurtDuration, function() player.sm:doidle() end)

    player.timer:tween(player.knockbackDuration, player, {offsetPos = {x = player.knockbackDist, y = 0}}, "out-expo")

    player.timer:during(player.shakeDuration, function()
        player.offsetPos.x = player.offsetPos.x + math.random(-player.shakeIntensity, player.shakeIntensity)
        player.offsetPos.y = player.offsetPos.y + math.random(-player.shakeIntensity, player.shakeIntensity)
      end)
  end

  function player.sm:onleavehurt(event, from, to)
    if to ~= "hurt" then
      player.offsetPos.x, player.offsetPos.y = 0, 0 -- This looks wierd, probably needs animation and/or tween, needs looking at
    end
    player.hurt = false
  end

  self.sm.owner = self
end
--


function player:initialize()

  self.timer = Timer.new()

  self.attackDuration = 0.5
  self.dodgeDuration = 0.6

  self.hurtDuration = 1

  self.shakeDuration = 0.1
  self.shakeIntensity = 10

  self.knockbackDuration = 0.2
  self.knockbackDist = -100 -- (pixels)

  self.offsetPos = {x = 0, y = 0}


  self.maxhealth = 3

  self.maxSP = 10
  self.SPBaseGuardDrainRate = 1 -- (point/s)
  self.SPDrainFunction = function(accVal) return accVal*4 end -- Used to calculate SPDrain when guarding
  -- Calculation is: base + f(acc)
  self.SPDrainMax = 10




  self.ac = AC:new()
  self.ac.name = "player"

  self:loadAnimations()

  self.ac:overrideDoEvent(function(self, event, ...) 
      local eventName = self.name .. "_" .. event
--      print(eventName)
      Signal.emit(eventName, ...) 
    end)


  self:initializeStateMachine()


  self:reset()
end
--


function player:reset()
  self.timer:clear()

  self.health = self.maxhealth
  self.dead = false
  self.hurt = false

  self.SP = self.maxSP/2
  self.SPDrainAcc = 0
--  self.SPCurrentDrainRate = 0

  self.offsetPos.x, self.offsetPos.y = 0, 0

  self.sm:doidle()
end



function player:receiveAttack(highlow)
  if (self.sm:is("dodge_high") and highlow == "low") or
  (self.sm:is("dodge_low")  and highlow == "high") then
    local amtRegained = self.hasGoodTiming and 3 or 1
    self.SP = math.min(self.SP + amtRegained, self.maxSP)
    
--    Signal.emit("dodgeAttack", self.hasGoodTiming)
    
    Gamestate.push(stateDodging, self.hasGoodTiming)
    
  else
    self.sm:dohurt()
  end
end


Signal.register("goodTiming", function(isGood) player.goodTiming = isGood end)




function player:calculateSPDrain(dt)
  if self.sm:is("guard") then
    self.SPDrainAcc = math.min(self.SPDrainAcc + dt, self.SPDrainMax)

    local curSPDrainRate = self.SPBaseGuardDrainRate + self.SPDrainFunction(self.SPDrainAcc)
    self.SP = self.SP - curSPDrainRate * dt 

  elseif self.SPDrainAcc > 0 then -- MAGIC NUMBER: minDrainAcc (should probably just be 0 though...)
    self.SPDrainAcc = math.max(self.SPDrainAcc - self.SPBaseGuardDrainRate * dt, 0) -- TODO: introduce separate variables for this (including function?)

  end
end

function player:update(dt)
  self.timer:update(dt)
  self.ac:update(dt)

  if self.dead then Gamestate.switch(stateMenu, {won=false}) end

  self:calculateSPDrain(dt)

  if self.sm:is("guard") and self.SP <= 0 then -- Is there an easy way to stop a transition from happening due to a condition?
    self.sm:doidle()
  end
end

function player:draw()  
  if self.hurt then 
    love.graphics.setColor(255, 000, 000)
  end
  self.ac:loveDraw(nil, nil, nil, nil, nil, 250 - self.offsetPos.x, 250 - self.offsetPos.y)
  love.graphics.setColor(255, 255, 255)


  local healthStr = tostring(self.health)

  love.graphics.setColor(255, 000, 255)
  love.graphics.print(healthStr, 250, 200)
  love.graphics.setColor(255, 255, 255)
end



function player:keypressed(key, scancode, isrepeat)
--  if key == "" then
  if key == "g" then
    if love.keyboard.isDown("w") then
      self.sm:dododge_high()

    elseif love.keyboard.isDown("s") then
      self.sm:dododge_low()

    else
      self.sm:doguard()
    end

  elseif key == "space" then
    self.sm:doattack()


  end
end


function player:keyreleased(key)
  if key == "g" and self.sm:is("guard") then
    self.sm:doidle()
  end
end



