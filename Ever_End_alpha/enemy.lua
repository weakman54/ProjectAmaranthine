

local dbg_render_timingCircles = true
local dbg_timingCircles = 0


local RM = require "resourceManager.resourceManager"
local AC = reload( "animation.animationCollection")
local SM = reload( "statemachine.statemachine")

local Timer = require "timer.timer"


--local player = require "player"


local enemy = {}

enemy.dbg_trigger_offensive_action = false


function enemy:initialize()
  self.name = "Quit" -- TODO: load properly
--  self.stance = "low"

  self.attackTime = 6 -- seconds
  
  
  self.timingStage = 0


  -- TODO: think about how to load all of these
  self.HP = 0
  self.maxHP = 10


  self:initializeAC()
  self:initializeAttacks()
  self:initializeSM()

  self:reset()
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
--  print("FD", frameDuration)

  attack.parryTreshold     = attack.parryTreshold     or PARRY_TRESHOLD
  attack.perfDodgeTreshold = attack.perfDodgeTreshold or PERFDODGE_TRESHOLD
  attack.normDodgeTreshold = attack.normDodgeTreshold or NORMDODGE_TRESHOLD

  for i, frame in ipairs(anim.data._frames) do
    local imgData = frame.imgData
    local r, g, b, a = imgData:getPixel(0, 0)

    if a == 1 and r == 1 then -- Corner marker for attack start
      attack.damageImpact = (i - 1) * frameDuration -- Using i - 1 to account for the fact that Timer only checks wether the set time has _passed_
--      print((i - 1), (i - 1) * frameDuration)
    end
  end

  assert(attack.damageImpact, "There was no marked attack frame in the attack animation: " .. attack.name)

  attack.parryTime     = attack.damageImpact - attack.parryTreshold
  attack.perfDodgeTime = attack.damageImpact - attack.perfDodgeTreshold
  attack.normDodgeTime = attack.damageImpact - attack.normDodgeTreshold

  table.insert(self.attacks, attack)
end
--


function enemy:initializeAttacks()
  self.attacks = {}

  self:loadAttack({name = "high_attack01", damage = 1, stance = "high"}, 30)
--  self.attacks[#self.attacks].animation.data.dbg_render = 

  self:loadAttack({name = "low_attack01", damage = 4, stance = "low"}, 30)
end
--


function enemy:initializeAC()
  self.ac = AC:new()
  local ac = self.ac
  local name = ""

  ac:setFramerate(12)
  RM.prefix = "assets/" .. self.name .. "/" .. self.name .. "_"

  name = "idle"
  ac:addAnimation(name, RM:loadAnimation(name .. "_"))


  name = "guard"
  ac:addAnimation(name, RM:loadAnimation(name .. "_"))


  name = "hurt"
  ac:addAnimation(name, RM:loadAnimation(name .. "_"))

  for _, comboType in ipairs{"sword", "gun"} do
    for i=1, 2 do
      name = comboType .. "_hurt" .. string.format("%02d", i)
      ac:addAnimation(name, RM:loadAnimation(name .. "_"))
    end
  end




  for i=1, 1 do
    name = "taunt" .. string.format("%02d", i)
    ac:addAnimation(name, RM:loadAnimation(name .. "_"))
  end
end
--


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

        if self.attackTimer:reached(enemy.attackTime) or enemy.dbg_trigger_offensive_action then
          sm:switch("offensive")
        end
      end,
      --


    })

  sm:add("offensive", {
      enter = function(self)
        enemy.dbg_trigger_offensive_action = false
        
        -- TODO: choose action
        local attackI = math.random(2)
--        print("#", attackI)
        self.curAttack = enemy.attacks[attackI]
--        enemy.stance = self.curAttack.stance
        ac:setAnimation(self.curAttack.name, false)

        self.timer = Timer:new()

        self.didDamage = false

        -- TODO: set animation


        -- TODO: combo?
        -- TODO: set stance depending on action
        -- TODO: perform action

        -- TODO: implement attack format

      end,


      update = function(self, dt)
        self.timer:update(dt)

        if self.timer:reached(self.curAttack.damageImpact) and not self.didDamage then
          self.didDamage = true
          player.damaged = {attack = self.curAttack, timing = enemy.timingStage}
        end

        -- TODO: check animation for "ended"
--        if self.curAttack.animation.data.event == "ended" then 
        if ac:curEvent() == "ended" then

          -- TODO: switch to correct state (combo?)
          sm:switch("idle")
        end

        if dbg_render_timingCircles then 
          enemy.timingStage = 0
          if self.timer:between(self.curAttack.parryTime    , self.curAttack.damageImpact) then
            enemy.timingStage = enemy.timingStage + 1
          end
          if self.timer:between(self.curAttack.perfDodgeTime, self.curAttack.damageImpact) then
            enemy.timingStage = enemy.timingStage + 1
          end
          if self.timer:between(self.curAttack.normDodgeTime, self.curAttack.damageImpact) then
            enemy.timingStage = enemy.timingStage + 1
          end
        end
        
        
        if enemy.damaged then
          enemy.HP = enemy.HP - enemy.damaged.damage
          enemy.damaged = false
          enemy.sm:switch("hurt", enemy.damaged.kind)
        end
      end,
      
      
      exit = function(self)
        enemy.timingStage = 0
--        enemy.stance = ""
      end,
    })

  sm:add("defensive", {
      enter = function(self)
        -- TODO: figure out which reaction
      end,

      update = function(self, dt)

      end,

  })
--


sm:add("hurt", {
      enter = function(self, kind)
        ac:setAnimation(kind .. "_hurt" .. "01") -- NOTE: need to handle differing numbers of hurt here
        
        self.timer = Timer:new()
      end,

      update = function(self, dt)
        self.timer:update(dt)
        
        if self.timer:reached(2) then -- HARDCODED hurtDuration
          sm:switch("idle")
        end

      end,

  })
--
end
--


function enemy:reset()
  self.HP = self.maxHP

  self.sm:switch("idle")
end


function enemy:update(dt)
  self.ac:update(dt)
  self.sm:update(dt)
end


function enemy:draw()
  self.ac:loveDraw(x, y, r, sx, sy, 200, 200)
  love.graphics.print(self.sm.curState.name, 1400, 200)


  for i=1, self.timingStage do -- don't need to check bool here..
    local r = i/3
    love.graphics.setColor(r, r, 255)
    love.graphics.circle("fill", 1000, 500, (4 - i) * 50)
    love.graphics.setColor(255, 255, 255)
  end
end



return enemy