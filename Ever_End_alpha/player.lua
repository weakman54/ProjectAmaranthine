

local RM = require "resourceManager.resourceManager"
local AC = require "animation.animationCollection"
local SM = require "statemachine.statemachine"

local Timer = require "timer.timer"


local player = {}

function player:initialize()
  self.name = "Player" -- NOTE: This probably shouldn't be needed 
  self.stance = "low"

  self.attackTime = 3 -- seconds

  self:initializeAC()
  self:initializeSM()

  self.sm:switch("idle")
end


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
  name = "dodge_hurt"
  ac:addAnimation(name, RM:loadAnimation(name .. "_"))



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


function player:initializeSM()
  self.sm = SM:new()

  local sm = self.sm
  local ac = self.ac

  sm:add("idle", {
      enter = function(self)
        ac:setAnimation("idle")
      end,

      update = function(self, dt)


      end,
      --


    })
end

function player:update(dt)
  -- Aimation testing: vvvvvv
  if input:down("guard") then
    self.ac:setAnimation("hurt_mild")

  elseif input:down("attack") then
    self.ac:setAnimation("hurt_intense")

  end
-- Animation testing ^^^^^^


  self.ac:update(dt)
  self.sm:update(dt)
end


function player:draw()
  self.ac:loveDraw(x, y, r, sx, sy, 200, 200)
end




return player