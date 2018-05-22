

local RM = require "resourceManager.resourceManager"


local player = {}

function player:initialize()
  self.name = "Player"

  -- durations in seconds vvv
  self.hurtDuration  = 2 -- just works value: plays the two hurt animations pretty nicely even though they get cut off =P
  self.parryMinigameDuration = 2
  self.parryDuration = 1

  self.dodgeStartDuration = NORMDODGE_TRESHOLD + 0.0 -- MAGIC NUMBER: additional time on dodge start
  self.dodgeDuration = 2

  self.fumbleDuration = .35

  self.gunAttackDuration = 0.1

  self.chargeDuration = 1

  self.idleRegenDuration = .70

  self.SPRegenRateIdle = .2
  self.SPDrainRate = 0.4 -- points per second
  self.SPChargeDrainRate = 1

  self.HPGainRate = 0.5


  self.maxHP = 10 -- points
  self.maxSP = 10

  self.swordComboBaseDmg = 1
  self.swordComboGradDmg = 2


  self:initializeAC()
  self:initializeSM()

  self:reset()
end
--


function player:reset()
  self.HP = self.maxHP
  self.SP = self.maxSP/2

  return self.sm:switch("idle")
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


  name = "defeat"
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
        player.parrying = false

        self.regenTimer = Timer:new()
      end,

      update = function(self, dt)
        self.regenTimer:update(dt)


        if player.damaged then
          return sm:switch("hurt")

        elseif input:pressed("guard") then		
          return sm:switch("guard")

        elseif input:pressed("down") then
          return sm:switch("dodge", "low")

        elseif input:pressed("up") then
          return sm:switch("dodge", "high")

        elseif input:pressed("attack") then
          return sm:switch("charge")

        elseif input:pressed("heal") then
          return sm:switch("heal")

        end

        if self.regenTimer:reached(player.idleRegenDuration) then
          player.SP = math.min(player.SP + player.SPRegenRateIdle * dt, player.maxSP)
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
        --Sound:play("Open1")
        --Sound:play("Crossbow")


      end,

      update = function(self, dt)	
        if player.damaged  then
          ac:setAnimation("guard_hit", false)
          --Sound:play("Player Block")

          player.SP = math.max(player.SP - player.damaged.attack.damage, 0)
          if player.SP == 0 then
            print("hurt")
            return sm:switch("hurt")
          else
            player.damaged = false
          end
        end

        if input:pressed("down") then
          sm:switch("parry", "low")

        elseif input:pressed("up") then
          sm:switch("parry", "high")
        end


        if ac:curName() == "guard_hit" then
          if ac:curEvent() == "ended" then
            ac:setAnimation("guard")
          end
        end


        if not input:down("guard") or player.SP <= 0 then
          return sm:switch("idle")
        end

        player.SP = math.max(player.SP - player.SPDrainRate * dt, 0)
      end,
    })
  --

  sm:add("parry",  {
      enter = function(self, stance)
        self.stance = stance
        ac:setAnimation("parry", false)
        -- Put parry sounds here 

        self.parryTiming = false
        if enemy.sm:is("offensive") then
          self.parryTiming = enemy.timingStage == 3	
        end

        self.timer = Timer:new()
      end,

      update = function(self, dt)
        self.timer:update(dt)

        if player.damaged then
          if self.parryTiming and player.damaged.attack.stance == self.stance then
            return sm:switch("parryMinigame", parrying)
          else
            return sm:switch("hurt")
          end
        end

        if self.timer:reached(player.parryDuration) then
          return player.sm:switch("guard")
        end

      end,
    })
  --


  sm:add("heal",  {
      canSwitch = function(self)
        return player.HP < player.maxHP and player.SP > 0
      end,

      enter = function(self)
        ac:setAnimation("heal")
        --Sound:play("Fire2")
      end,

      update = function(self, dt)
        if player.damaged then
          return sm:switch("hurt")
        end

        if not input:down("heal") or player.HP >= player.maxHP or player.SP <= 0 then
          --	if self.sound then self.sound:stop() end
          return sm:switch("idle")
        end

        player.HP = math.min(player.HP + player.HPGainRate * dt, player.maxHP)
        player.SP = math.max(player.SP - player.HPGainRate * dt, 0) -- TODO: separate heal drain rate from hp gain rate

      end,
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
          return sm:switch("hurt")
        end


        if input:released("attack") or player.SP <= 0 then
          if self.chargeReady then
            return sm:switch("chargeAttack")
          else
            return sm:switch("attack")
          end
        end

        player.SP = player.SP - player.SPChargeDrainRate * dt

        if self.timer:reached(player.chargeDuration) and ac:curName() ~= "charge_attack_ready" then
          self.chargeReady = true
          ac:setAnimation("charge_attack_ready")
          --Sound:play("Charge Complete")
        end
      end,
    })
  --



  sm:add("chargeAttack",  { 
      enter = function(self)
        ac:setAnimation("charge_attack_attack", false)

        self.timer = Timer:new()
        self.target = 0.1 -- HARDCODED duration

        enemy:changeHP(-3)
        return enemy.sm:switch("hurt") -- HACK
      end,

      update = function(self, dt)
        self.timer:update(dt)

        if self.timer:reached(self.target) then
          return sm:switch("idle")
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
            --Sound:play("Bone Break", {delay = 0.4})
            --Sound:play("Crumble #1", {delay = 0.69})
            --Sound:play("Player Fall", {delay = 1.5})
            --Sound:play("Applause2", {delay = 2.5})
          else
            ac:setAnimation("hurt_mild", false)
            --Sound:play("Player Slammed", {delay = 0.3})
          end
        else
          ac:setAnimation("hurt_" .. kind, false) -- Bit borked with the other animations atm...
        end
        ----Sound:play("Enemy Hit")

        player:changeHP(-player.damaged.attack.damage)
        player.damaged = false

        self.timer = Timer:new()
        --        player.hurtDuration = ac:curDuration() -- HACK: This needs to be set properly later!
      end,

      update = function(self, dt)
        self.timer:update(dt)

        if self.timer:reached(player.hurtDuration) then
          return sm:switch("idle")
        end

      end
    })
  --
  
  sm:add("defeat", {
      enter = function(self, data)
        ac:setAnimation("defeat", false)
      end,

      update = function(self, dt)
      end,
    })
  --

  sm:add("parryMinigame",  reload("playerParry"))
  sm:add("dodge",  reload("playerDodgeState"))
end
--




function player:changeHP(offset)
  self.HP = math.min(math.max(self.HP + offset, 0), self.maxHP)

  local scalar = math.abs(offset)/3

  if gJoy and vibrationEnabled then
    gJoy:setVibration(1*scalar, 1*scalar, 1*scalar)
  end

  if self.HP <=0 then
    self.sm:switch("defeat")
    enemy.ac:setAnimation("idle")
    Gamestate.push(stateGameOver, {won = false})
  end
end


function player:changeSP(offset)
  self.SP = math.min(math.max(self.SP + offset, 0), self.maxSP)
end

function player:update(dt)
  self.ac:update(dt)
  self.sm:update(dt)
  player.parrying = false;
end


function player:draw()
  self.ac:loveDraw(x, y, r, sx, sy, 200, 200)
  self.sm:draw()
end




return player