
local Animation = require "animation"
local AC = require "animationCollection"

local Timer = require "timer"



enemy = {}



function enemy:loadAnimations()
  local anim

  anim = Animation:new()

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
  self.ac:addAnimation("guard_high", anim)

  anim:importFrame{
    image = love.graphics.newImage("assets/enemy_guard-high_0001.png"),
    duration = 0.4,
  }
  anim:importFrame{
    image = love.graphics.newImage("assets/enemy_guard-high_0002.png"),
    duration = 0.4,
  }
  anim:importFrame{
    image = love.graphics.newImage("assets/enemy_guard-high_0003.png"),
    duration = 0.4,
  }


  anim = Animation:new()
  self.ac:addAnimation("guard_low", anim)

  anim:importFrame{
    image = love.graphics.newImage("assets/enemy_guard-low_0001.png"),
    duration = 0.4,
  }
  anim:importFrame{
    image = love.graphics.newImage("assets/enemy_guard-low_0002.png"),
    duration = 0.4,
  }
  anim:importFrame{
    image = love.graphics.newImage("assets/enemy_guard-low_0003.png"),
    duration = 0.4,
  }


  anim = Animation:new()
  self.ac:addAnimation("idle_high", anim)

  anim:importFrame{
    image = love.graphics.newImage("assets/enemy_idle-high_0001.png"),
    duration = 0.4,
  }
  anim:importFrame{
    image = love.graphics.newImage("assets/enemy_idle-high_0002.png"),
    duration = 0.4,
  }

  anim = Animation:new()
  self.ac:addAnimation("idle_low", anim)

  anim:importFrame{
    image = love.graphics.newImage("assets/enemy_idle-low_0001.png"),
    duration = 0.4,
  }
  anim:importFrame{
    image = love.graphics.newImage("assets/enemy_idle-low_0002.png"),
    duration = 0.4,
  }


  anim = Animation:new()
  self.ac:addAnimation("hurt", anim)

  anim:importFrame{
    image = love.graphics.newImage("assets/enemy_hurt_0001.png"),
    duration = 0.4,
  }
  anim:importFrame{
    image = love.graphics.newImage("assets/enemy_hurt_0002.png"),
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
        enemy.stance = enemy.stance == "low" and "high" or "low"


        ac:setAnimation("idle_" .. enemy.stance)


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
        ac:setAnimation("attack_windup_" .. enemy.stance)

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
        ac:setAnimation("attack_" .. enemy.stance, false)

        player:receiveAttack(enemy.stance)

        self.timer = Timer:new()
      end,

      update = function(self, dt)
        self.timer:update(dt)

        if self.timer:reached(enemy.attackDuration) then
          sm:switch("idle")
        end
      end,
    })


  sm:add("parried", {
      enter = function(self)  -- ok, these are technically the closures
        ac:setAnimation("attack_" .. enemy.stance, false)
        ac.curAnim:pause() -- NOTE: should probably implement "proxy" functions in AC

        -- NOTE Leaving this here to fix later, but for now I'm going with what works
--        if not enemy.parriedTimer then enemy.parriedTimer = Timer:new() end
--        enemy.parriedTimer:reset()
        self.timer = Timer:new()
      end,

      update = function(self, dt)
        self.timer:update(dt)

        if self.timer:reached(player.parryDuration) then -- HACK: is dependent on players parryDuration, should be decoupled
          sm:switch("idle")
        end
      end,
    })


  sm:add("guard", {
      enter = function(self)  -- ok, these are technically the closures
        ac:setAnimation("guard_" .. enemy.stance)
        enemy.guardTimer = Timer:new()
      end,

      update = function(self, dt)
        enemy.guardTimer:update(dt)

        if enemy.guardTimer:reached(enemy.guardDuration) then
          sm:switch("idle")
        end
      end,
    })

  sm:add("hurt", {
      enter = function(self)  -- ok, these are technically the closures
        ac:setAnimation("hurt")
        self.timer = Timer:new()
      end,

      update = function(self, dt)
        self.timer:update(dt)

        if self.timer:reached(enemy.guardDuration) then
          sm:switch("idle")
        end
      end,
    })
end
--


function enemy:initialize()
  self.offsetPos = {x = 0, y = 0}

  self.maxhealth = 3

  self.stance = "low"

  self.windupWaitTime = 2


  self.timingWindowTime = 0.4
  self.timingWindowDuration = 0.3
  self.windupDuration = self.timingWindowTime + self.timingWindowDuration


  self.guardDuration = 1.4




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


function enemy:receiveAttack(playerStance)
  -- Needs looking at, but eh

  local doGuard = self.sm:is("idle")
  if doGuard then
    self.stance = playerStance
    self.sm:switch("guard")
    return
  end

  if self.sm:is("guard") then
    self.guardTimer:reset()
  end


  local doHurt = false or -- Align OCD BS
  (self.stance == "high" and playerStance == "low") or
  (self.stance == "low" and playerStance == "high") or
  self.sm:is("attack_windup") or 
  self.sm:is("parried")


  if doHurt then
    self.health = self.health - 2

    self.sm:switch("hurt")
    return
  end
end


function enemy:update(dt)
  self.ac:update(dt)
  self.sm:update(dt)
end


function enemy:draw()
  love.graphics.setColor(255, 255, 255)

  self.ac:loveDraw(nil, nil, nil, nil, nil, 200 - self.offsetPos.x, 200 - self.offsetPos.y)


  if self.goodTiming then
    love.graphics.circle("fill", 1000, 500, 100)
  end


  love.graphics.setColor(000, 000, 000)
  love.graphics.print(self.stance, 1500, 500)
end




















