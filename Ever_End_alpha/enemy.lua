

local RM = require "resourceManager.resourceManager"
local AC = require "animation.animationCollection"
local SM = require "statemachine.statemachine"

local Timer = require "timer.timer"


local enemy = {}


function enemy:initialize()
  self.name = "Quit" -- TODO: load properly
  self.stance = "low"
  
  self.attackTime = 3 -- seconds
  
  
  self:initializeAttacks()
  self:initializeAC()
  self:initializeSM()

  self.sm:switch("idle")
end

function enemy:initializeAttacks()
  self.attacks = {}
  
  local atks = self.attacks
  
  table.insert(atks, {
      -- name
      name = "high_attack01",
      -- animation (how load?)
--      animation = RM:
      
      -- nextAttack (implies combo) function
      -- timing info (read when loading frames)
      -- stance
      -- rand weight
      -- inv. frames
    })
    
  
end


function enemy:initializeAC()
  self.ac = AC:new()
  local ac = self.ac
  local name = ""

  ac:setFramerate(12)
  RM.prefix = "assets/" .. self.name .. "/" .. self.name .. "_"

  name = "high_idle"
  ac:addAnimation(name, RM:loadAnimation(name .. "_"))

  name = "low_idle"
  ac:addAnimation(name, RM:loadAnimation(name .. "_"))
end


function enemy:initializeSM()
  self.sm = SM:new()

  local sm = self.sm
  local ac = self.ac

  sm:add("idle", {
      enter = function()
        ac:setAnimation(enemy.stance .. "_idle")
        self.attackTimer = Timer:new()
      end,
      
      update = function(dt)
        -- TODO: put in reaction to attack
          -- TODO: get hurt
          -- TODO: or switch to defensive
          -- TODO: counter attack ( if been attacked multiple times)
          -- TODO: BETTER FEEDBACK FOR COUNTER ATTACK
        
        self.attackTimer:update(dt)
        
        if self.attackTimer:reached(enemy.attackTimer) then
          sm:switch("offensive")
        end
      end,
      --
        

    })

  sm:add("offensive", {
      enter = function()
        -- TODO: choose action
        
        -- TODO: combo?
        -- TODO: set stance depending on action
        -- TODO: perform action
        -- TODO: set animation
        
        -- TODO: implement attack format
        
      end,
      
      update = function()
        -- TODO: check animation for "ended"
        -- TODO: switch to correct state (combo?)
      end,
    })

  sm:add("defensive", {
      enter = function()
        -- TODO: figure out which reaction
      end,
      
      update = function(dt)
        
      end,

    })
end


function enemy:update(dt)
  self.ac:update(dt)
  self.sm:update(dt)
end


function enemy:draw()
  self.ac:loveDraw()
end



return enemy