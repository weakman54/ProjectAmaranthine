

-- ATTACK FORMAT "scratchpad" TODO: move somewhere else
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

local dbg_render_timingCircles = false


local RM = require "resourceManager.resourceManager"


local enemy = {}

enemy.dbg_trigger_offensive_action = false


function enemy:initialize()
  self.name = "Quit1" -- TODO: load properly

  self.attackTime    = 3 -- seconds, TODO: figure better name for this
  self.guardDuration = 2
  self.hurtDuration  = 2
  self.tauntDuration = 1.2


  self.timingStage = 0


  -- TODO: think about how to load all of these
  --  self.HP = 0 -- Initialize in reset() ?
  self.maxHP = 10

  self.dmgToSPRatio = 1


  self.baseGuardWeight = 5
  --  self.counterWeightTable = {guard = self.baseGuardWeight, counterAttack = 1} -- INitialize in reset()?


  self:initializeAC()
  self:initializeAttacks()
  self:initializeSM()

  self:reset()
end
--


function enemy:reset()
  self.HP = self.maxHP

  self.damaged = false

  self.counterWeightTable = {guard = self.baseGuardWeight, counterAttack = 1}

  return self.sm:switch("idle")
end
--


function enemy:loadAttack(attack, framerate)
  -- TODO: look this over (though should finalize attack format first)
  assert(attack and attack.name, "must pass attack, attack must have name")

  framerate = framerate or DEFAULT_FRAMERATE


  -- Set animation ---------------------
  -- Load animation
  local name = attack.name
  RM.prefix = ""
  local anim =  RM:loadAnimation(string.format("assets/%s/%s_%s_", self.name, self.name, attack.animName), nil, framerate) -- NOTE: might as well do the "full" directory here, since this is set per attack anyway..

  local ac = self.ac

  if not ac:has(name) then   -- HACK NOTE: This sets the framerate and looping on the "global" animation handle, which _shouldn't_ break anything, but yeah...
    ac:addAnimation(name, anim)

    -- NOTE: these have to be _after_ addAnimation, since addAnimation will set the framerate (should probably not happen because of this)
    anim.data:setFramerate(framerate) -- HACK atm to fix framerate for old animation
    anim.data:setLooping(false)
  end


  attack.animation = anim


  -- Load timings -------------------------------------
  local frameDuration = 1/framerate

  for i, frame in ipairs(anim.data._frames) do
    local imgData = frame.imgData
    local r, g, b, a = imgData:getPixel(0, 0)

    if a == 1 and r == 1 then -- Corner marker for attack start
      attack.damageImpact = (i - 1) * frameDuration -- Using i - 1 to account for the fact that Timer only checks wether the set time has _passed_
    end
  end

  assert(attack.damageImpact, "There was no marked attack frame in the attack animation: " .. attack.name)


  attack.parryTreshold     = attack.parryTreshold     or PARRY_TRESHOLD
  attack.perfDodgeTreshold = attack.perfDodgeTreshold or PERFDODGE_TRESHOLD
  attack.normDodgeTreshold = attack.normDodgeTreshold or NORMDODGE_TRESHOLD

  attack.parryTime     = attack.damageImpact - attack.parryTreshold
  attack.perfDodgeTime = attack.damageImpact - attack.perfDodgeTreshold
  attack.normDodgeTime = attack.damageImpact - attack.normDodgeTreshold

  return attack
end
--


function enemy:initializeAttacks()
  self.attacks = {}
  self.attackWeights = {} -- NOTE: these are hardcoded atm, should make sure to fix a better way of loading the weights

  self.attacks["high_attack01"] = self:loadAttack({name = "high_attack01", animName = "high_attack01", damage = 1, stance = "high"})
  self.attackWeights["high_attack01"] = 2/7

  self.attacks["low_attack01"]  = self:loadAttack({name = "low_attack01" , animName = "low_attack01" , damage = 4, stance = "low" })
  self.attackWeights["low_attack01"] = 2/7



  self.attacks["comboTest"]  = self:loadAttack({name = "comboTest" , animName = "low_attack01" , damage = 4, stance = "low"})
  self.attacks["comboTest"].nextAttack = "low_attack01"
  self.attackWeights["comboTest"] = 2/7



  self.attackWeights["taunt"] = 1/7 -- Feels kindof misplaced but eh...


  self.counterAttack = self:loadAttack({name = "counterAttack", animName = "low_attack01", damage = 2, stance = "high"})
end
--


function enemy:initializeAC()
  self.ac = AC:new()

  local ac = self.ac
  local name

  ac:setFramerate(DEFAULT_FRAMERATE)
  RM.prefix = string.format("assets/%s/%s_", self.name, self.name)


  name = "idle"
  ac:addAnimation(name, RM:loadAnimation(name .. "_"))


  name = "guard"
  ac:addAnimation(name, RM:loadAnimation(name .. "_"))


  name = "taunt"
  ac:addAnimation(name, RM:loadAnimation(name .. "_"))


  for i=1, 3 do
    name = string.format("hurt%02d", i)
    ac:addAnimation(name, RM:loadAnimation(name .. "_"))
  end

  --  name = "counter_attack" -- TODO: rename?
  --  ac:addAnimation(name, RM:loadAnimation(name .. "_"))

  --
  --  -- Combo hurts
  --  for _, comboType in ipairs{"sword", "gun"} do
  --    for i=1, 3 do
  --      name = string.format("%s_hurt%02d", comboType, i)
  --      ac:addAnimation(name, RM:loadAnimation(name .. "_"))
  --    end
  --  end

  -- taunts
--  for i=1, 1 do
--    name = string.format("taunt%02d", i)
----    ac:addAnimation(name, RM:loadAnimation(name .. "_"))
--  end
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

        enemy.attacked = false -- HACK: entire attack stuff needs looking at...
      end,

      update = function(self, dt)
        self.attackTimer:update(dt)

        -- TODO: put in reaction to attack #
        -- TODO: get hurt (?)
        -- TODO: or switch to defensive # (just guard atm, not sure if more is needed?)
        -- TODO: counter attack ( if been attacked multiple times)
        -- TODO: BETTER FEEDBACK FOR COUNTER ATTACK

        if self.attackTimer:reached(enemy.attackTime) or enemy.dbg_trigger_offensive_action then
          return sm:switch("offensive")
        end

        -- HACK Stuff:
        if enemy.attacked then
          player.guarded = true
          enemy.attacked = false


          enemy.counterWeightTable.counterAttack = enemy.counterWeightTable.counterAttack + 1

          local choice = lume.weightedchoice(enemy.counterWeightTable)

          -- a bit more hack
          if choice == "counterAttack" then
            return sm:switch("offensive", "counterAttack")
          else
            return sm:switch("guard")
          end
        end
      end,
      --
    })
  --

  sm:add("offensive", {
      enter = function(self, kind, nextAttack)
        enemy.dbg_trigger_offensive_action = false


        -- TODO: choose action #
        -- TODO: Restructure to use lume.weigthed choice (TODO: clean up how taunts work)
        --        local attackI = math.random(#enemy.attacks * 2 + 1)
        --        attackI = math.ceil(attackI/2)

        if kind then
          if kind == "counterAttack" then
            self.curAttack = enemy.counterAttack
            enemy.counterWeightTable = {guard = enemy.baseGuardWeight, counterAttack = 1} -- Reset weights for counter attack

          elseif kind == "combo" then

            self.curAttack = enemy.attacks[nextAttack]

          end

        else
          local choice = lume.weightedchoice(enemy.attackWeights)
          if choice == "taunt" then -- Still kindof hacky here, but this works better I think
            return sm:switch("taunt")
          end

          self.curAttack = enemy.attacks[choice]
        end

        --        if self.curAttack.nextAttack then
        --          print("COMBO!")
        --        end


        -- TODO: set animation
        ac:setAnimation(self.curAttack.name, false)

        self.timer = Timer:new()

        self.didDamage = false

        -- TODO: combo?
        -- TODO: perform action X
        -- TODO: implement attack format (ish)
      end,


      update = function(self, dt)
        self.timer:update(dt)

        if self.timer:reached(self.curAttack.damageImpact) and not self.didDamage then
          self.didDamage = true
          player.damaged = {attack = self.curAttack, timing = enemy.timingStage}
        end

        -- TODO: Fix so that this is not animation timing dependent
        if ac:curEvent() == "ended" then
          -- TODO: if nextAttack, switch back to offensive with the info (sm:switch("offensive", data))
          -- TODO: switch to correct state (combo?)
          if self.curAttack.nextAttack then
            return sm:switch("offensive", "combo", self.curAttack.nextAttack)
          else
            return sm:switch("idle")
          end
        end

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
      end,


      draw = function(self)
        if dbg_render_timingCircles then
          for i=1, enemy.timingStage do -- don't need to check bool here..
            local r = i/3
            love.graphics.setColor(r, r, 255)
            love.graphics.circle("fill", W/2, H/2, (4 - i) * 50)
            love.graphics.setColor(255, 255, 255)
          end
        end
      end,


      exit = function(self)
        enemy.timingStage = 0
      end,
    })

  sm:add("guard", { -- NOTE: renamed this from "defensive", that was basically phased out anyway...
      enter = function(self)
        ac:setAnimation("guard", false)

        self.soundPlayed=false

        self.timer = Timer:new()
      end,

      update = function(self, dt)
        self.timer:update(dt)

        if self.timer:reached(0.1) and not self.soundPlayed then 
          Sound:play("Enemy Block")
          self.soundPlayed=true
        end

        if self.timer:reached(enemy.guardDuration) then
          return sm:switch("idle")
        end

        if enemy.attacked then
          player.guarded = true
          enemy.attacked = false
          return sm:switch("guard")
        end
      end,

    })
  --


  sm:add("taunt", {
      enter = function(self)
        ac:setAnimation("taunt", false)
        Sound:play("Froggy Laugh", {delay = 0.15})

        self.timer = Timer:new()
      end,

      update = function(self, dt)
        self.timer:update(dt)

        if enemy.attacked then
          enemy.attacked = false
          enemy:changeHP(-1) -- HARDCODED: damage
          return sm:switch("hurt01")
        end

        if self.timer:reached(enemy.tauntDuration) then
          return sm:switch("idle")
        end
      end,

    })
  --



  sm:add("hurt", {
      enter = function(self, data)
        ac:setAnimation("hurt01", false)
        Sound:play("Player Hit")

        self.timer = Timer:new()
      end,

      update = function(self, dt)
        self.timer:update(dt)

        if self.timer:reached(enemy.hurtDuration) then -- HARDCODED: hurtDuration
          return sm:switch("idle")
        end
      end,
    })
  --


  sm:add("parryMinigame", reload("enemyParryMinigame"))
  sm:add("dodgeMinigame", reload("enemyDodgeMinigame"))
end
--



function enemy:changeHP(offset)
  self.HP = math.min(math.max(self.HP + offset, 0), self.maxHP)

  if offset < 0 then
    player:changeSP(math.abs(offset * self.dmgToSPRatio))
  end

  if self.HP <=0 then
    Gamestate.switch(stateVN);
  end

end



function enemy:update(dt)
  self.ac:update(dt)
  self.sm:update(dt)
end


function enemy:draw()
  self.ac:loveDraw(x, y, r, sx, sy, 200, 200)

  self.sm:draw()
end


return enemy