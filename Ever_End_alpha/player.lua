

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
end


function player:initializeSM()
  self.sm = SM:new()

  local sm = self.sm
  local ac = self.ac

  sm:add("idle", {
      enter = function(self)
        ac:setAnimation("idle")
        self.attackTimer = Timer:new()
      end,
      
      update = function(self, dt)
          -- TODO: put in reaction to attack
          -- TODO: get hurt
          -- TODO: or switch to defensive
          -- TODO: counter attack ( if been attacked multiple times)
          -- TODO: BETTER FEEDBACK FOR COUNTER ATTACK
        
        self.attackTimer:update(dt)
        
        if self.attackTimer:reached(player.attackTime) then
          sm:switch("offensive")
        end
      end,
      --
        

})
end

function player:update(dt)
  self.ac:update(dt)
  self.sm:update(dt)
end


function player:draw()
  self.ac:loveDraw()
end


return player