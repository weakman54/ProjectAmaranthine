

local RM = require "resourceManager.resourceManager"
local AC = require "animation.animationCollection"
local SM = require "statemachine.statemachine"

local Timer = require "timer.timer"


local enemy = {}


function enemy:initialize()
  self.name = "Quit" -- TODO: load properly
--  self.stance = "low"

  self.attackTime = 1 -- seconds


  self:initializeAC()
  self:initializeAttacks()
  self:initializeSM()

  self.sm:switch("idle")
end


function enemy:initializeAttacks()
  self.attacks = {}

  local atks = self.attacks
  local ac = self.ac

  local name
  local anim

  RM.prefix = "assets/" .. self.name .. "/" .. self.name .. "_"

  name = "high_attack01"
  anim = RM:loadAnimation(name .. "_")

  table.insert(atks, {
      -- name
      name = name,
      -- animation (how load?)
      animation = anim,

      -- nextAttack (implies combo) function
      -- timing info (read when loading frames)
      -- stance
      -- rand weight
      -- inv. frames
    })

  ac:addAnimation(name, anim)
  anim.data:setFramerate(30) -- HACK atm to fix framerate for old animation



  name = "low_attack01"
  anim = RM:loadAnimation(name .. "_")

  table.insert(atks, {
      -- name
      name = name,
      -- animation (how load?)
      animation = anim,

      -- nextAttack (implies combo) function
      -- timing info (read when loading frames)
      -- stance
      -- rand weight
      -- inv. frames
    })
  ac:addAnimation(name, anim)
  anim.data:setFramerate(30) -- HACK atm to fix framerate for old animation


end


function enemy:initializeAC()
  self.ac = AC:new()
  local ac = self.ac
  local name = ""

  ac:setFramerate(12)
  RM.prefix = "assets/" .. self.name .. "/" .. self.name .. "_"

--  name = "high_idle"
--  ac:addAnimation(name, RM:loadAnimation(name .. "_"))

  name = "idle"
  ac:addAnimation(name, RM:loadAnimation("low_" .. name .. "_"))
end


function enemy:initializeSM()
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

        if self.attackTimer:reached(enemy.attackTime) then
          sm:switch("offensive")
        end
      end,
      --


    })

  sm:add("offensive", {
      enter = function(self)
        -- TODO: choose action
        local attack = enemy.attacks[1]
        ac:setAnimation(attack.name)

        -- TODO: set animation


        -- TODO: combo?
        -- TODO: set stance depending on action
        -- TODO: perform action

        -- TODO: implement attack format

      end,

      update = function(self)
        -- TODO: check animation for "ended"
        -- TODO: switch to correct state (combo?)
      end,
    })

  sm:add("defensive", {
      enter = function(self)
        -- TODO: figure out which reaction
      end,

      update = function(self, dt)

      end,

    })
end


function enemy:update(dt)
  self.ac:update(dt)
  self.sm:update(dt)
end


function enemy:draw()
  self.ac:loveDraw(x, y, r, sx, sy, 200, 200)
  love.graphics.print(self.sm.curState.name, 1400, 200)
end



return enemy