

local RM = require "resourceManager.resourceManager"
local AC = reload( "animation.animationCollection")
local SM = reload( "statemachine.statemachine")

local HUMPTimer = require "hump.timer"

local Timer = require "timer.timer"

--local enemy = require "enemy"


local player = {}

function player:initialize()
  self.name = "Player" -- NOTE: This probably shouldn't be needed 
  self.stance = "low"


  self.hurtDuration = 5 -- seconds
  self.parryDuration = 2
  self.dodgeDuration = 2


  self.maxHP = 10
  self.maxSP = 10


  self:initializeAC()
  self:initializeSM()

  self:reset()
end
--


function player:initializeAC()
  self.ac = AC:new()
  local ac = self.ac
  local name = ""

  ac:setFramerate(12)
  RM.prefix = "assets/" .. self.name .. "/" .. self.name .. "_"

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


  for _, stance in ipairs{"low", "high"} do
    for _, timing in ipairs{"start", "end", "normal", "perfect"} do
      name = "dodge_" .. stance .. "_" .. timing
      ac:addAnimation(name, RM:loadAnimation(name .. "_"))
    end
  end
  name = "hurt_dodge"
  ac:addAnimation("hurt_dodge", RM:loadAnimation("dodge_hurt_")) -- NOTE: hardcoded values here to consolidate with other "hurts"



  for _, stance in ipairs{"low", "high"} do
    for _, timing in ipairs{"normal", "perfect"} do
      name = "gun_attack_" .. stance .. "_" .. timing
      ac:addAnimation(name, RM:loadAnimation(name .. "_"))
    end
  end


  name = "attack_start"
  ac:addAnimation(name, RM:loadAnimation(name .. "_"))


  name = "attack_guarded"
  ac:addAnimation(name, RM:loadAnimation(name .. "_"))

  for i = 1, 2 do -- NOTE: hardcoed number of combo attacks
    for _, thing in ipairs{"windup", "attack"} do
      name = "sword_combo" .. string.format("%02d", i) .. "_" .. thing
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
      end,

      update = function(self, dt)
        if player.damaged then
          sm:switch("hurt")

        elseif input:down("guard") then
          sm:switch("guard")

        elseif input:down("down") then
          sm:switch("dodge", "low")

        elseif input:down("up") then
          sm:switch("dodge", "high")

        elseif input:down("attack") then


        end
      end,
    })
  --

--  sm:add("name",  {
--      enter = function(self)
--    end,

--    update = function(self, dt)
--    end,
--    })

  sm:add("guard",  {
      enter = function(self)
        ac:setAnimation("guard")
        if enemy.sm:is("offensive") then
          player.guardTiming = enemy.timingStage
        end

      end,

      update = function(self, dt)
        if player.damaged then
          print(player.damaged.timing)
          
          if player.damaged.timing == 3 then
            sm:switch("parry")
          else
            ac:setAnimation("guard_hit", false)
          end

          player.damaged = false
        end


        if ac:curName() == "guard_hit" then
          if ac:curEvent() == "ended" then
            ac:setAnimation("guard")
          end
        end


        if not input:down("guard") then
          sm:switch("idle")
        end
      end,

      exit = function(self)
        player.guardTiming = 0
      end
    })
  --


  sm:add("parry",  {
      enter = function(self)
        ac:setAnimation("parry")
        enemy.ac:pause()

        self.timer = Timer:new()
      end,

      update = function(self, dt)
        self.timer:update(dt)

        if self.timer:reached(player.parryDuration) then
          enemy.sm:switch("idle") -- TODO: separate into enemy
          sm:switch("idle")
        end
      end,
    })
--


  sm:add("dodge",  {
      enter = function(self, stance)
        self.stance = stance
        self.timing = 1

        

        ac:setAnimation("dodge_" .. self.stance .. "_start", false)

        if enemy.sm:is("offensive") then
          player.dodgeTiming = enemy.timingStage
        end

        self.timer = Timer:new()
      end,


      update = function(self, dt)
        if player.damaged then
          if player.damaged.attack.stance == self.stance then
            sm:switch("hurt", "dodge")
          else
            enemy.ac:pause()
          end
          
          player.damaged = false
        end


        if ac:curName() == "dodge_" .. self.stance .. "_normal" then
          self.timer:update(dt)

          if self.timer:reached(player.dodgeDuration) then
            ac:setAnimation("dodge_" .. self.stance .. "_end", false)
          end

          if input:pressed("attack") then
            ac:setAnimation("gun_attack_" .. self.stance .. "_normal", false)
          end
        end


        if ac:curName() == "gun_attack_" .. self.stance .. "_normal" then
          -- TODO: keep track of timing and damage
          if not self.didDamage then
            enemy.damaged = {damage = 1, kind = "gun"}
            self.didDamage = true
          end

          if ac:curEvent() == "ended" then
            ac:setAnimation("dodge_" .. self.stance .. "_normal")
          end
        end          


        if ac:curEvent() == "ended" then
          if ac:curName() == "dodge_" .. self.stance .. "_start" then
            ac:setAnimation("dodge_" .. self.stance .. "_normal", true)

--            HUMPTimer.tween(player.dodgeDuration, 

--          elseif ac:curName() == "dodge_" .. self.stance .. "_normal" then
--            ac:setAnimation("dodge_" .. self.stance .. "_end", false)

          elseif ac:curName() == "dodge_" .. self.stance .. "_end" then
            sm:switch("idle")
            enemy.sm:switch("idle")
            flipHack = not flipHack

          end
        end
      end,


      exit = function(self)
        player.dodgeTiming = 0
        self.didDamage = false
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

        player.HP = player.HP - player.damaged.attack.damage
        player.damaged = false

--        self.hurtTimer = Timer:new()
      end,

      update = function(self, dt)
--        self.hurtTimer:update(dt)

--        if self.hurtTimer:reached(player.hurtDuration) then
        if ac:curEvent() == "ended" then
          sm:switch("idle")
        end

      end
    })
--
end
--


function player:reset()
  self.HP = self.maxHP
  self.SP = self.maxSP/2

  self.sm:switch("idle")
end



function player:update(dt)
  self.ac:update(dt)
  self.sm:update(dt)
end


function player:draw()
  self.ac:loveDraw(x, y, r, sx, sy, 200, 200)
end




return player