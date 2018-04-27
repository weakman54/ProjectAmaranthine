

local RM = require "resourceManager.resourceManager"


local player = {}

function player:initialize()
  self.name = "Player"

  -- durations in seconds vvv
  self.hurtDuration  = 2 -- just works value: plays the two hurt animations pretty nicely even though they get cut off =P
  self.parryDuration = 2

  self.dodgeStartDuration = NORMDODGE_TRESHOLD + 0.0 -- MAGIC NUMBER: additional time on dodge start
  self.dodgeDuration = 2

  self.gunAttackDuration = 0.1

  self.chargeDuration = 1


  self.SPDrainRate = 0.1 -- points per second
  self.SPChargeDrainRate = 1


  self.maxHP = 10
  self.maxSP = 10


  self:initializeAC()
  self:initializeSM()

  self:reset()
end
--


function player:reset()
  self.HP = self.maxHP
  self.SP = self.maxSP/2

  self.sm:switch("idle")
end
--


function player:initializeAC()
  self.ac = AC:new()

  local ac = self.ac
  local name

  ac:setFramerate(12)
  RM.prefix = string.format("assets/%s/%s_", self.name, self.name)


  name = "idle"
  ac:addAnimation(name, RM:loadAnimation(name .. "_"))


  name = "guard"
  ac:addAnimation(name, RM:loadAnimation(name .. "_"))

  name = "guard_hit"
  ac:addAnimation(name, RM:loadAnimation(name .. "_"))


  name = "parry"
  ac:addAnimation(name, RM:loadAnimation(name .. "_"))


  name = "hurt_mild"
  ac:addAnimation(name, RM:loadAnimation(name .. "_"))
  name = "hurt_intense"
  ac:addAnimation(name, RM:loadAnimation(name .. "_"))


  name = "charge_attack_charging"
  ac:addAnimation(name, RM:loadAnimation(name .. "_"))
  name = "charge_attack_ready"
  ac:addAnimation(name, RM:loadAnimation(name .. "_"))
  name = "charge_attack_attack"
  ac:addAnimation(name, RM:loadAnimation(name .. "_"))


  -- Dodge 
  for _, stance in ipairs{"low", "high"} do
    for _, timing in ipairs{"start", "end", "normal", "perfect"} do
      name = string.format("dodge_%s_%s", stance, timing)
      ac:addAnimation(name, RM:loadAnimation(name .. "_"))
    end
  end
  name = "hurt_dodge"
  ac:addAnimation("hurt_dodge", RM:loadAnimation("dodge_hurt_")) -- NOTE: hardcoded values here to consolidate with other "hurts"


  -- Gun attack
  for _, stance in ipairs{"low", "high"} do
    for _, timing in ipairs{"normal", "perfect"} do
      name = string.format("gun_attack_%s_%s", stance, timing)
      ac:addAnimation(name, RM:loadAnimation(name .. "_"))
    end
  end


  name = "attack_start"
  ac:addAnimation(name, RM:loadAnimation(name .. "_"))


  name = "attack_guarded"
  ac:addAnimation(name, RM:loadAnimation(name .. "_"))

  -- Sword Comboss
  for i = 1, 3 do -- NOTE: hardcoed number of combo attacks
    for _, thing in ipairs{"windup", "attack"} do
      name = string.format("sword_combo%02d_%s", i, thing)
      ac:addAnimation(name, RM:loadAnimation(name .. "_"))
    end
  end


  name = "heal"
  ac:addAnimation(name, RM:loadAnimation(name .. "_"))
end
--


function player:initializeSM()
  self.sm = SM:new()

  local sm = self.sm
  local ac = self.ac


  sm:add("idle", {
      enter = function(self)
        ac:setAnimation("idle")

        player.damaged = false
      end,

      update = function(self, dt)
        if player.damaged then
          sm:switch("hurt")

        elseif input:pressed("guard") then
          sm:switch("guard")

        elseif input:pressed("down") then
          sm:switch("dodge", "low")

        elseif input:pressed("up") then
          sm:switch("dodge", "high")

        elseif input:pressed("attack") then
          sm:switch("charge")

        end
      end,
    })
  --


  sm:add("guard",  {
      canSwitch = function(self)
        return player.SP > 0
      end,

      enter = function(self)
        ac:setAnimation("guard")

        if enemy.sm:is("offensive") then
          self.parryTiming = enemy.timingStage == 3
        end
      end,

      update = function(self, dt)
        if player.damaged then
          if self.parryTiming then
            sm:switch("parry")
          else
            ac:setAnimation("guard_hit", false)

            player.SP = math.max(player.SP - player.damaged.attack.damage, 0)
          end

          player.damaged = false
        end


        if ac:curName() == "guard_hit" then
          if ac:curEvent() == "ended" then
            ac:setAnimation("guard")
          end
        end


        if not input:down("guard") or player.SP <= 0 then
          sm:switch("idle")
        end

        player.SP = player.SP - player.SPDrainRate * dt
      end,

      exit = function(self)
      end
    })
  --


  sm:add("charge",  {
      enter = function(self)
        ac:setAnimation("charge_attack_charging")

        self.chargeReady = false

        self.timer = Timer:new()
      end,

      update = function(self, dt)
        self.timer:update(dt)
        
        if player.damaged then          
          sm:switch("hurt")
        end


        if input:released("attack") or player.SP <= 0 then
          if self.chargeReady then
            sm:switch("chargeAttack")
          else
            sm:switch("attack")
          end
        end

        player.SP = player.SP - player.SPChargeDrainRate * dt

        if self.timer:reached(player.chargeDuration) and ac:curName() ~= "charge_attack_ready" then
          self.chargeReady = true
          ac:setAnimation("charge_attack_ready")
        end
      end,
    })
  --



  sm:add("chargeAttack",  { 
      enter = function(self)
        ac:setAnimation("charge_attack_attack", false)

        self.timer = Timer:new()
        self.target = 0.1 -- HARDCODED duration
        
        enemy.sm:switch("hurt") -- HACK
        enemy:changeHP(-3)
      end,

      update = function(self, dt)
        self.timer:update(dt)

        if self.timer:reached(self.target) then
          sm:switch("idle")
        end
      end,
    })
--


  sm:add("attack",  { -- HACK: Entire "normal" attack stuff is hack atm, but it's in for playtesting/demo
      enter = function(self)
        ac:setAnimation("attack_start")

        self.timer = Timer:new()
        self.target = 0.1

        enemy.attacked = true
      end,

      update = function(self, dt)
        self.timer:update(dt)

        if self.timer:reached(self.target) then
          if self.attacked then
            return sm:switch("idle")
          end

          self.attacked = true
          if player.guarded then -- If this is not true, timer is still reached, and will reset to idle (yeah... hacks)
            player.guarded = false
            ac:setAnimation("attack_guarded", false)
            self.target = ac:curDuration() + 0.1
            self.timer:reset()
          end
        end
      end,

      exit = function(self)
        self.attacked = false
      end,
    })
--


  sm:add("hurt", {
      enter = function(self, kind)
        if not kind then
          if player.damaged.attack.damage >= INTENSE_DAMAGE_TRESHOLD then
            ac:setAnimation("hurt_intense", false)
          else
            ac:setAnimation("hurt_mild", false)
          end
        else
          ac:setAnimation("hurt_" .. kind, false) -- Bit borked with the other animations atm...
        end

        player:changeHP(-player.damaged.attack.damage)
        player.damaged = false

        self.timer = Timer:new()
--        player.hurtDuration = ac:curDuration() -- HACK: This needs to be set properly later!
      end,

      update = function(self, dt)
        self.timer:update(dt)

        if self.timer:reached(player.hurtDuration) then
          sm:switch("idle")
        end

      end
    })
--

  sm:add("parry",  reload("playerParry"))
  sm:add("dodge",  reload("playerDodgeState"))
end
--



function player:changeHP(offset)
  self.HP = self.HP + offset
  
  local scalar = math.abs(offset)/3
  
  if gJoy then
    gJoy:setVibration(1*scalar, 1*scalar, 1*scalar)
  end

  -- TODO: handle death
end



function player:update(dt)
  self.ac:update(dt)
  self.sm:update(dt)
end


function player:draw()
  self.ac:loveDraw(x, y, r, sx, sy, 200, 200)
  self.sm:draw()
end




return player