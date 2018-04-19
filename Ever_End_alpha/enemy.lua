

local dbg_render_timingCircles = true
local dbg_timingCircles = 0


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


function enemy:loadAttack(attack, framerate)
  assert(attack and attack.name, "must pass attack, attack must have name")
  assert(framerate, "must pass framerate") -- TODO: cleanup error messages


  local name = attack.name
--  local attack = {}
--  attack.name = name
  -- name
--      name = name,
  -- animation (how load?)
--      animation = anim,

  -- nextAttack (implies combo) function
  -- timing info (read when loading frames)
  -- stance
  -- rand weight
  -- inv. frames
--    }


  -- Load animation --------
  local ac = self.ac

  RM.prefix = "assets/" .. self.name .. "/" .. self.name .. "_"

  local anim = RM:loadAnimation(name .. "_")

  ac:addAnimation(name, anim)
  anim.data:setFramerate(framerate) -- HACK atm to fix framerate for old animation
  anim.data:setLooping(false)

  attack.animation = anim


  -- Load timings --------
  local frameDuration = 1/framerate
  print("FD", frameDuration)

  attack.parryTreshold     = attack.parryTreshold     or PARRY_TRESHOLD
  attack.perfDodgeTreshold = attack.perfDodgeTreshold or PERFDODGE_TRESHOLD
  attack.normDodgeTreshold = attack.normDodgeTreshold or NORMDODGE_TRESHOLD

  for i, frame in ipairs(anim.data._frames) do
    local imgData = frame.imgData
    local r, g, b, a = imgData:getPixel(0, 0)

    if a == 1 and r == 1 then -- Corner marker for attack start
      attack.damageImpact = (i - 1) * frameDuration -- Using i - 1 to account for the fact that Timer only checks wether the set time has _passed_
      print((i - 1), (i - 1) * frameDuration)
    end
  end

  attack.parryTime     = attack.damageImpact - attack.parryTreshold
  attack.perfDodgeTime = attack.damageImpact - attack.perfDodgeTreshold
  attack.normDodgeTime = attack.damageImpact - attack.normDodgeTreshold

  table.insert(self.attacks, attack)
end


function enemy:initializeAttacks()
  self.attacks = {}

  self:loadAttack({name = "high_attack01"}, 30)
--  self.attacks[#self.attacks].animation.data.dbg_render = 

--  self:loadAttack("low_attack01", 30) -- NOTE: left out to reduce loading times
end


function enemy:initializeAC()
  self.ac = AC:new()
  local ac = self.ac
  local name = ""

  ac:setFramerate(12)
  RM.prefix = "assets/" .. self.name .. "/" .. self.name .. "_"

  name = "idle"
  ac:addAnimation(name, RM:loadAnimation(name .. "_"))
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
        self.curAttack = enemy.attacks[1]
        ac:setAnimation(self.curAttack.name, false)

        self.timer = Timer:new()

        -- TODO: set animation


        -- TODO: combo?
        -- TODO: set stance depending on action
        -- TODO: perform action

        -- TODO: implement attack format

      end,

      update = function(self, dt)
        self.timer:update(dt)

        if self.timer:reached(self.curAttack.damageImpact) then
          -- TODO: do damage things
        end

        -- TODO: check animation for "ended"
        if self.curAttack.animation.data.event == "ended" then
          -- TODO: switch to correct state (combo?)
          sm:switch("idle")
        end

        if dbg_render_timingCircles then 
          dbg_timingCircles = 0
          if self.timer:between(self.curAttack.parryTime    , self.curAttack.damageImpact) then
            dbg_timingCircles = dbg_timingCircles + 1
          end
          if self.timer:between(self.curAttack.perfDodgeTime, self.curAttack.damageImpact) then
            dbg_timingCircles = dbg_timingCircles + 1
          end
          if self.timer:between(self.curAttack.normDodgeTime, self.curAttack.damageImpact) then
            dbg_timingCircles = dbg_timingCircles + 1
          end
        end
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

  
  for i=1, dbg_timingCircles do -- don't need to check bool here..s
    local r = i/3
    love.graphics.setColor(r, r, 255)
    love.graphics.circle("fill", 1000, 500, (4 - i) * 50)
    love.graphics.setColor(255, 255, 255)
  end
end



return enemy