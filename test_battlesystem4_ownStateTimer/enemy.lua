
local Animation = require "animation"
local AC = require "animationCollection"

local Timer = require "timer"



enemy = {}



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


function enemy:initSM()
  self.sm = SM:new()

  local sm = self.sm -- NOTE: Closure, might be good, might not..
  local ac = self.ac -- NOTE: Closure

  sm:add("idle", {
      enter = function(self)  -- ok, these are technically the closures
        ac:setAnimation("idle")

        enemy.highlow = enemy.highlow == "low" and "high" or "low"

        self.timer = Timer:new()
      end,

      update = function(self, dt)
        self.timer:update(dt)

        if self.timer:reached(enemy.windupWaitTime) then
          sm:switch("attack_windup")
        end
      end,
    })

  sm:add("attack_windup", {
      enter = function(self)  -- ok, these are technically the closures
        ac:setAnimation("attack_windup_" .. enemy.highlow)

        self.timer = Timer:new()
      end,

      update = function(self, dt)
        self.timer:update(dt)

        if self.timer:reached(enemy.windupDuration) then
          sm:switch("attack")
          
        elseif self.timer:reached(enemy.timingWindowTime) then
          enemy.goodTiming = true
        
        end
      end,
      
      exit = function(self) enemy.goodTiming = false end
    })

  sm:add("attack", {
      enter = function(self)  -- ok, these are technically the closures
        ac:setAnimation("attack_" .. enemy.highlow, false)

        self.timer = Timer:new()
      end,

      update = function(self, dt)
        self.timer:update(dt)

        if self.timer:reached(enemy.attackDuration) then
          sm:switch("idle")
        end
      end,
    })
end
--


function enemy:initialize()
  self.offsetPos = {x = 0, y = 0}

  self.maxhealth = 3

  self.highlow = "low"

  self.windupWaitTime = 2
  
  
  self.timingWindowTime = 0.4
  self.timingWindowDuration = 0.3
  self.windupDuration = self.timingWindowTime + self.timingWindowDuration




  self.ac = AC:new()
  self.ac.name = "player"

  self:loadAnimations()


  self.attackDuration = self.ac.animations["attack_low"]:duration() -- Calculated from how long the animation is atm, should be decoupled, but should also be easier to figure out




  self:initSM()


  self:reset()
end
--

function enemy:reset()
  self.offsetPos.x, self.offsetPos.y = 0, 0

  self.health = self.maxhealth
end
--


function enemy:update(dt)
  self.ac:update(dt)
  self.sm:update(dt)
end


function enemy:draw()
  self.ac:loveDraw(nil, nil, nil, nil, nil, 250 - self.offsetPos.x, 250 - self.offsetPos.y)
  
  if self.goodTiming then
    love.graphics.circle("fill", 1000, 500, 100)
  end
end




















