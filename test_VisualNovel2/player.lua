
local Animation = require "animation"
local AC = require "animationCollection"

local Timer = require "timer"



player = {}


perfectHackCircle = false



function player:loadAnimations()
  local anim

  anim = Animation:new()
  self.ac:addAnimation("attack_high", anim)

  anim:importFrame{
    image = love.graphics.newImage("assets/player/player_attack-high_0001.png"),
    duration = 0.4,
  }


  anim = Animation:new()
  self.ac:addAnimation("attack_low", anim)

  anim:importFrame{
    image = love.graphics.newImage("assets/player/player_attack-low_0001.png"),
    duration = 0.4,
  }


  anim = Animation:new()
  self.ac:addAnimation("dodge_high", anim)

  anim:importFrame{
    image = love.graphics.newImage("assets/player/player_dodge-high_0001.png"),
    duration = 0.4, -- NOTE: this is currently controlled by dodgeDuration
  }


  anim = Animation:new()
  self.ac:addAnimation("dodge_low", anim)

  anim:importFrame{
    image = love.graphics.newImage("assets/player/player_dodge-low_0001.png"),
    duration = 0.4,-- NOTE: this is currently controlled by dodgeDuration
  }


  anim = Animation:new()
  self.ac:addAnimation("guard", anim)

  anim:importFrame{
    image = love.graphics.newImage("assets/player/player_guard_0001.png"),
    duration = 0.4,
  }
  anim:importFrame{
    image = love.graphics.newImage("assets/player/player_guard_0002.png"),
    duration = 0.4,
  }


  anim = Animation:new()
  self.ac:addAnimation("parry", anim)

  anim:importFrame{
    image = love.graphics.newImage("assets/player/player_parry_0001.png"),
    duration = 0.4,
  }


  anim = Animation:new()
  self.ac:addAnimation("idle_high", anim)

  anim:importFrame{
    image = love.graphics.newImage("assets/player/player_idle-high_0001.png"),
    duration = 0.4,
  }
  anim:importFrame{
    image = love.graphics.newImage("assets/player/player_idle-high_0002.png"),
    duration = 0.4,
  }

  anim = Animation:new()
  self.ac:addAnimation("idle_low", anim)

  anim:importFrame{
    image = love.graphics.newImage("assets/player/player_idle-low_0001.png"),
    duration = 0.4,
  }
  anim:importFrame{
    image = love.graphics.newImage("assets/player/player_idle-low_0002.png"),
    duration = 0.4,
  }


  anim = Animation:new()
  self.ac:addAnimation("hurt", anim)

  anim:importFrame{
    image = love.graphics.newImage("assets/player/player_hurt_0001.png"),
    duration = 0.4,
  }


  anim = Animation:new()
  self.ac:addAnimation("heal", anim)

  anim:importFrame{
    image = love.graphics.newImage("assets/player/player_heal_0001.png"),
    duration = 0.4,
  }
  anim:importFrame{
    image = love.graphics.newImage("assets/player/player_heal_0002.png"),
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
        ac:setAnimation("idle_" .. player.stance) 
      end,

      update = function(self, dt)
        -- HACK vvvvvvvv
        if input:down("up") then
          self.stance = "high"

        elseif input:down("down") then
          self.stance = "low"

        end

        ac:setAnimation("idle_" .. player.stance)
        -- ^^^^^^^

        if input:pressed("attack") then 
          sm:switch("attack")
        end

        if input:pressed("dodge") then 
          sm:switch("dodge")
        end

        if input:pressed("guard") then
          sm:switch("guard") 
        end

        if input:pressed("heal") then
          sm:switch("heal") 
        end
      end,
    })
--


  sm:add("attack", {      
      enter = function(self)
        love.audio.play("assets/sounds/Absorb1.ogg")
        ac:setAnimation("attack_" .. player.stance)
        self.timer = Timer:new()

        enemy:receiveAttack(player.stance)
      end,

      update = function(self, dt)
        self.timer:update(dt)
        if self.timer:reached(player.attackDuration) then
          sm:switch("idle") -- Closed var
        end
      end,
    })
--


  sm:add("guard", {
      canSwitch = function() return player.SP > 0 end,

      enter = function(self)
        ac:setAnimation("guard")

        player.guardTimer:reset()
      end,

      update = function(self, dt)
        player.guardTimer:update(dt)

        player.SP = math.max(player.SP - 1 * dt, 0) -- Magic number 0, minSP, should probably be 0 though

        if not input:down("guard") or player.SP <= 0 then 
          player.guardTimer:reset() -- Mostly needed for dbg output
          sm:switch("idle")
        end
      end,
    })
--


  sm:add("parrying", {
      enter = function(self)
        ac:setAnimation("parry")

        if not player.parryTimer then player.parryTimer = Timer:new() end
        player.parryTimer:reset()

        hackground = true
      end,

      update = function(self, dt)
        player.parryTimer:update(dt)

        if player.parryTimer:reached(player.parryDuration) then
          sm:switch("idle")
        end

        if input:pressed("attack") then
          sm:switch("attack")
        end

        player.SP = math.max(player.SP - 1 * dt, 0) -- Magic number 0, minSP, should probably be 0 though
      end,

      exit = function() hackground = false end
    })
--


  sm:add("dodge", {      
      enter = function(self) 
        ac:setAnimation("dodge_" .. player.stance)

        player.dodgeTimer:reset()
      end,

      update = function(self, dt)
        player.dodgeTimer:update(dt)

        if player.dodgeTimer:reached(player.dodgeDuration) then
          -- NOTE: do not reset timer here, need it for dodging state atm
          sm:switch("idle") -- Closed var
        end
      end,
    })
--

  sm:add("dodging", {
      enter = function(self)
        ac:setAnimation("dodge_" .. player.stance)

        hackground = true

        if player.dodgeTimer._acc <= player.perfectDodgeTreshold then -- HACK: using internal Timer state
          perfectHackCircle = true
        end

      end,

      update = function(self, dt)
        player.dodgeTimer:update(dt)  -- ASSUMPTION: came in from dodge state, and has dodgeTimer!

        if player.dodgeTimer:reached(player.dodgeDuration) then
          sm:switch("idle")
        end

        if input:pressed("attack") then
          if perfectHackCircle then
            -- Do dodge attack animation
            enemy:receiveAttack("dodge")
          else
            sm:switch("attack")
          end
        end
      end,

      exit = function()
        hackground = false 
        perfectHackCircle = false
      end
    })
--

  sm:add("hurt", {      
      enter = function(self) 
        ac:setAnimation("hurt")

        self.timer = Timer:new()
      end,

      update = function(self, dt)
        self.timer:update(dt)

        if self.timer:reached(player.hurtDuration) then
          sm:switch("idle") -- Closed var
        end
      end,
    })
--

  sm:add("heal", {
      canSwitch = function() return player.health < player.maxhealth end,

      enter = function(self)
        ac:setAnimation("heal")
      end,

      update = function(self, dt)
        player.health = math.min(player.health + 1 * dt, player.maxhealth)

        if not input:down("heal") or player.health >= player.maxhealth then 
          sm:switch("idle")
        end
      end,
    })
--


end
--

function player:initialize()
  self.stance = "low"

  self.attackDuration = 0.5

  self.dodgeTimer = Timer:new()
  self.perfectDodgeTreshold = 0.2
  self.dodgeDuration = 0.6

  self.hurtDuration = 1

  self.offsetPos = {x = 0, y = 0}

  self.guardTimer = Timer:new() 
  self.parryTreshold = 0.1 -- seconds
  self.parryDuration = 0.8 -- seconds



  self.maxhealth = 10

  self.maxSP = 10



  self.ac = AC:new()
  self.ac.name = "player"
  self.ac:setFramerate(30)

  self:loadAnimations()



  self:initSM()


  self:reset()
end
--

function player:reset()
  self.health = self.maxhealth

  self.SP = self.maxSP/2
  self.SPDrainAcc = 0

  self.offsetPos.x, self.offsetPos.y = 0, 0

  self.sm:switch("idle")
end
--


function player:receiveAttack(enemyStance)
  if self.sm:is("dodge") then
    if true and -- Align OCD BS
    (self.stance == "high" and enemyStance == "low") or
    (self.stance == "low" and enemyStance == "high") then

      self.sm:switch("dodging")
      enemy.sm:switch("dodged")

      return
    end
  end
  --


  if self.sm:is("guard") then
    if self.guardTimer._acc <= self.parryTreshold then -- HACK, using internal value of timer, should implement properly 
      self.sm:switch("parrying")
      enemy.sm:switch("parried")
    end
    return
  end
  --


  -- ASSUMPTION: we return out before this if should not take damage
  self.health = self.health - 2
  if self.health <= 0 then
    Gamestate.switch(stateMain, {playerDeath = true})
  end
  
  self.sm:switch("hurt")
end


function player:update(dt)
--   Update this per state instead?, more clutter, but also more clear?
  if input:down("up") then
    self.stance = "high"

  elseif input:down("down") then
    self.stance = "low"

  end


  self.ac:update(dt)
  self.sm:update(dt)
end


function player:draw()
  love.graphics.setColor(255, 255, 255)
  self.ac:loveDraw(nil, nil, nil, nil, nil, 200 - self.offsetPos.x, 200 - self.offsetPos.y)

  love.graphics.setColor(000, 000, 000)
  love.graphics.print(self.stance, 200, 200)

  if perfectHackCircle then
    love.graphics.setColor(255, 000, 000)
    love.graphics.circle("fill", 1000, 500, 50)
  end
end













