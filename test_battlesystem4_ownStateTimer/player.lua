
local Animation = require "animation"
local AC = require "animationCollection"

local Timer = require "timer"



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

function player:initSM()
  self.sm = SM:new()
  
  local sm = self.sm -- NOTE: Closure, might be good, might not..
  local ac = self.ac -- NOTE: Closure

  sm:add("idle", {
      enter = function(self)  -- ok, these are technically the closures
        ac:setAnimation("idle") 
      end,

      update = function(self, dt) 
        if input:pressed("attack") then sm:switch("attack") end
        
        if input:pressed("guard") then 
          if input:down("up") then
            sm:switch("dodge_high")
            
          elseif input:down("down") then
            sm:switch("dodge_low")
            
          else
            sm:switch("guard") 
            
          end
        end
        
      end,
    })

  sm:add("attack", {      
      enter = function(self) 
        ac:setAnimation("attack")
        self.timer = Timer:new()
      end,

      update = function(self, dt)
        self.timer:update(dt)
        if self.timer:reached(player.attackDuration) then
          sm:switch("idle") -- Closed var
        end
      end,
    })

  sm:add("guard", {
      canSwitch = function() return player.SP > 0 end,

      enter = function(self)
        ac:setAnimation("guard")
      end,

      update = function(self, dt)
        player.SP = math.max(player.SP - 1 * dt, 0) -- Magic number 0, minSP, should probably be 0 though

        if not input:down("guard") or player.SP <= 0 then sm:switch("idle") end
      end,
    })
  
  
  sm:add("dodge_high", {      
      enter = function(self) 
        ac:setAnimation("dodge_high")
        self.timer = Timer:new()
      end,

      update = function(self, dt)
        self.timer:update(dt)
        if self.timer:reached(player.dodgeDuration) then
          sm:switch("idle") -- Closed var
        end
      end,
    })
  
  sm:add("dodge_low", {      
      enter = function(self) 
        ac:setAnimation("dodge_low")
        self.timer = Timer:new()
      end,

      update = function(self, dt)
        self.timer:update(dt)
        if self.timer:reached(player.dodgeDuration) then
          sm:switch("idle") -- Closed var
        end
      end,
    })
end
--

function player:initialize()
  self.attackDuration = 0.5
  self.dodgeDuration = 0.6

--  self.hurtDuration = 1

--  self.shakeDuration = 0.1
--  self.shakeIntensity = 10

--  self.knockbackDuration = 0.2
--  self.knockbackDist = -100 -- (pixels)

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



  self:initSM()


  self:reset()
end
--

function player:reset()
--  self.timer:clear()

  self.health = self.maxhealth
--  self.dead = false
--  self.hurt = false

  self.SP = self.maxSP/2
  self.SPDrainAcc = 0
--  self.SPCurrentDrainRate = 0

  self.offsetPos.x, self.offsetPos.y = 0, 0

--  self.sm:doidle()
end
--


function player:update(dt)
  self.ac:update(dt)
  self.sm:update(dt)
end


function player:draw()
  self.ac:loveDraw(nil, nil, nil, nil, nil, 250 - self.offsetPos.x, 250 - self.offsetPos.y)
end













