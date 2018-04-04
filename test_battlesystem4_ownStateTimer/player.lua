
local Animation = require "animation"
local AC = require "animationCollection"

local Timer = require "timer"



player = {}

dbg_perfectDodge = false
dbg_parryTiming = false



function player:loadAnimations()
  local anim

  anim = Animation:new()
  self.ac:addAnimation("attack_high", anim)

  anim:importFrame{
    image = love.graphics.newImage("assets/player_attack-high_0001.png"),
    duration = 0.4,
  }


  anim = Animation:new()
  self.ac:addAnimation("attack_low", anim)

  anim:importFrame{
    image = love.graphics.newImage("assets/player_attack-low_0001.png"),
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
  self.ac:addAnimation("parry", anim)

  anim:importFrame{
    image = love.graphics.newImage("assets/player_parry_0001.png"),
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
        if input:pressed("attack") then 
          sm:switch("attack")
--          if input:down("up") then
--            sm:switch("attack_high")

--          elseif input:down("down") then
--            sm:switch("attack_low")

        end


        if input:pressed("dodge") then 
          sm:switch("dodge")
--          if input:down("up") then
--            sm:switch("dodge_high")

--          elseif input:down("down") then
--            sm:switch("dodge_low")
        end


        if input:pressed("guard") then
          sm:switch("guard") 

        end

      end,
    })
--


  sm:add("attack", {      
      enter = function(self) 
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

--  sm:add("attack_low", {      
--      enter = function(self) 
--        ac:setAnimation("attack_low")
--        self.timer = Timer:new()

--        enemy:receiveAttack("low")
--      end,

--      update = function(self, dt)
--        self.timer:update(dt)
--        if self.timer:reached(player.attackDuration) then
--          sm:switch("idle") -- Closed var
--        end
--      end,
--    })
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
          player.dodgeTimer:reset() -- Mostly needed for proper debug output
          sm:switch("idle") -- Closed var
        end
      end,
    })
--

--  sm:add("dodge_low", {      
--      enter = function(self) 
--        ac:setAnimation("dodge_low")
--        self.timer = Timer:new()
--      end,

--      update = function(self, dt)
--        self.timer:update(dt)
--        if self.timer:reached(player.dodgeDuration) then
--          sm:switch("idle") -- Closed var
--        end
--      end,
--    })
--


  sm:add("hurt", {      
      enter = function(self) 
        ac:setAnimation("idle")

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
end
--

function player:initialize()
--  self.shakeDuration = 0.1
--  self.shakeIntensity = 10

--  self.knockbackDuration = 0.2
--  self.knockbackDist = -100 -- (pixels)

  self.stance = "low"


  self.attackDuration = 0.5

  self.dodgeTimer = Timer:new()
  self.perfectDodgeTreshold = 0.3
  self.dodgeDuration = 0.6

  self.hurtDuration = 1


  self.offsetPos = {x = 0, y = 0}

  self.guardTimer = Timer:new() 
  self.parryTreshold = 0.2 -- seconds
  self.parryDuration = 0.8 -- seconds



  self.maxhealth = 3

  self.maxSP = 10
--  self.SPBaseGuardDrainRate = 1 -- (point/s)
--  self.SPDrainFunction = function(accVal) return accVal*4 end -- Used to calculate SPDrain when guarding
--  -- Calculation is: base + f(acc)
--  self.SPDrainMax = 10



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


function player:receiveAttack(enemyStance)
  if self.sm:is("dodge") then
    print("DODGE")
    if false or -- Align OCD BS
    (self.stance == "high" and enemyStance == "low") or
    (self.stance == "low" and enemyStance == "high") then

      print("Actual dodge")

      local amtRegained

      if self.dodgeTimer._acc <= self.perfectDodgeTreshold then -- HACK, using internal value of timer, should implement properly 
        print("timing")
        amtRegained = 3
      else
        amtRegained = 1
      end

      self.SP = math.min(self.SP + amtRegained, self.maxSP)

      return
    end
  end
  --


  if self.sm:is("guard") then
    print("GUARD")
    if self.guardTimer._acc <= self.parryTreshold then -- HACK, using internal value of timer, should implement properly 
      print("TIMING")
      self.sm:switch("parrying")
      enemy.sm:switch("parried")
    end
    return
  end
  --


  -- ASSUMPTION: we return out before this if should not take damage
  self.health = self.health - 2
  self.sm:switch("hurt")




--  else
--    self.health = self.health - 2 -- MAGIC NUMBER: 2, health reduction, should be dependent on attack type probably, need to think about that 
--    if self.health <= 0 then
--      self.dead = true
--    end
--    self.sm:switch("hurt")
--  end
end


function player:update(dt)

-- TROLOL, needs dodge state to run the update...
--  if self.dodgeTimer._acc <= self.perfectDodgeTreshold then -- HACK, using internal value of timer, should implement properly 
--    dbg_perfectDodge = true
--  else
--    dbg_perfectDodge = false
--  end

--  if self.guardTimer._acc <= self.parryTreshold then -- HACK, using internal value of timer, should implement properly 
--    dbg_parryTiming = true
--  else
--    dbg_parryTiming = false
--  end


  if input:down("up") then
    self.stance = "high"

  elseif input:down("down") then
    self.stance = "low"

  end


  self.ac:update(dt)
  self.sm:update(dt)
end


function player:draw()
  if self.sm:is("hurt") then
    love.graphics.setColor(255, 000, 000)
  else
    love.graphics.setColor(255, 255, 255)
  end

  self.ac:loveDraw(nil, nil, nil, nil, nil, 250 - self.offsetPos.x, 250 - self.offsetPos.y)

  love.graphics.setColor(000, 000, 000)
  love.graphics.print(self.stance, 200, 200)

  if dbg_parryTiming then
    if dbg_perfectDodge then
      love.graphics.setColor(100, 100, 255)
    end

    love.graphics.circle("fill", 1000, 500, 50)
  end
end












