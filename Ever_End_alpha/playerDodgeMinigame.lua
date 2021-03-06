
local RM = require "resourceManager.resourceManager"

local dodgeMain = {
  sm = SM:new(),
}

local sm = dodgeMain.sm
local ac = player.ac

local data = {}

local fumbling = false

local dodgeStart = {
  enter = function(self)
    ac:setAnimation("dodge_" .. data.stance .. "_start", false)
    if data.stance == "high" then 
      Sound:play("High Dodge")
    elseif data.stance == "low" then 
      Sound:play("Low Dodge")
    end

    self.timer = Timer:new()
    data.timing = (enemy.timingStage >= 2) and "perfect" or "normal"
  end,
  update = function(self, dt)
    self.timer:update(dt)
    -- Attacked during dodge:
    if player.damaged then
      if player.damaged.attack.stance == data.stance then
        return player.sm:switch("hurt", "dodge")
      else
        data.enemyAttack = player.damaged
        player.damaged = false
        enemy.sm:switch("dodgeMinigame")
        return sm:switch("dodgeMinigame")
      end
    end
    -- If not attacked, just switch to the end animation. ASSUMPTION: we didn't switch state before this
    if self.timer:reached(player.dodgeStartDuration) then
      return sm:switch("dodgeEnd") 
    end
  end,
}



-- Load combo stuff: -----------------------
RM.prefix = "assets/GUI/"
local combos = { -- HACK TODO: fix the readabilty of the m thing here...
  {name = "Up"   , anim = RM:loadAnimation("gun_combo_up_"   , nil, 12), xm =  0, ym =  0, }, -- x = 1*W/2, y = 1*H/4, }, -- EKivi hacke, made the cutton prompts be in the same place
  {name = "Down" , anim = RM:loadAnimation("gun_combo_down_" , nil, 12), xm =  0, ym =  0, }, -- x = 1*W/2, y = 3*H/4, },
  {name = "Left" , anim = RM:loadAnimation("gun_combo_left_" , nil, 12), xm =  0, ym =  0, }, -- x = 1*W/4, y = 1*H/2, },
  {name = "Right", anim = RM:loadAnimation("gun_combo_right_", nil, 12), xm =  0, ym =  0, }, -- x = 3*W/4, y = 1*H/2, },
}

local t = {x = 960, y = 540} -- Center point for the combo graphics -- {x = 2*W/3, y = 1*H/2}

for _, c in ipairs(combos) do
  local w, h =  c.anim.data._frames[1].data:getDimensions()
  c.ox, c.oy = w/2, h/2
  c.x, c.y = t.x + c.ox * c.xm, t.y + c.oy * c.ym
end



local dodgeMinigame = {
  enter = function(self)
    enemy.ac:pause()
    ac:setAnimation("dodge_" .. data.stance .. "_" .. data.timing) -- ASSUMPTION: data.timing should have a correct value here since we're in this state
    Sound:play("Slo Mo")

    self.hurtI = 1

    self.combo = combos[math.random(4)]

    local SPGained = data.timing == "normal" and SP_GAIN_FROM_DODGE_NORMAL or SP_GAIN_FROM_DODGE_PERFECT
    player.SP = math.min(player.SP + SPGained, player.maxSP)
    HUMPTimer.tween(.1, enemy, {x = -1000}, "in-quart")
    self.timer = Timer:new()
    self.fumbleTimer = Timer:new()
    fumbling = false
  end,
  --

  update = function(self, dt)
    self.timer:update(dt)
    if self.combo then self.combo.anim.data:update(dt) end -- update the combo GUI animations TODO: clean a bit?

    if data.timing == "normal" and self.timer:reached(player.dodgeDuration) then
      --      enemy.ac:play() -- This will probably not be needed?
      --      enemy.sm:switch("idle") -- NOTE: not quite good yet
      return sm:switch("dodgeEnd")
    end

    if data.timing == "perfect" and self.timer:reached(player.perfectDodgeDuration) then
      --      enemy.ac:play() -- This will probably not be needed?
      --      enemy.sm:switch("idle") -- NOTE: not quite good yet
      return sm:switch("dodgeEnd")
    end

    if self.fumbleTimer:reached(player.fumbleDuration) then
      fumbling = false;
      self.fumbleTimer:reset();
    end

    if fumbling then
      self.fumbleTimer:update(dt);
      return
    end


    -- Enemy hurt
    if self.enemyHurtTimer and self.enemyHurtTimer:reached(enemy.hurtDuration) then
      enemy.ac:setAnimation("idle")
      self.enemyHurtTimer = nil
    end


    -- Attack stuff: -----------
    if self.attackTimer then
      self.attackTimer:update(dt)
      if self.attackTimer:reached(player.gunAttackDuration) then
        ac:setAnimation("dodge_" .. data.stance .. "_" .. data.timing)

        self.attackTimer = nil
        self.combo = combos[math.random(4)]
      end
    elseif input:pressed("comboLeft") or input:pressed("comboRight") or input:pressed("comboUp") or input:pressed("comboDown") then
      if input:pressed("combo" .. self.combo.name) then
        self.hurtI = (self.hurtI % 2) + 1
--        print("#" .. self.hurtI)
        enemy.ac:setAnimation("hurt" .. string.format("%02d", self.hurtI))
        enemy:changeHP(-PLAYER_DODGE_DAMAGE)

        ac:setAnimation("gun_attack_" .. data.stance .. "_" .. data.timing, false)

        Sound:play("Gun1")
        Sound:play("Gun Wosh")

        self.attackTimer = Timer:new()
        self.enemyHurtTimer = Timer:new()

        self.combo = nil
      else -- Here is when misclicking a combo:
        -- put sound here
        fumbling = true;
        self.fumbleTimer:reset();
      end
    end
  end,

  exit = function(self)
    -- Timers were fucking things up
    self.timer = nil
    self.fumbleTimer = nil
    self.attackTimer = nil
  end,

  draw = function(self)
   
    love.graphics.push() -- HACKY fix to remove flip effect
    love.graphics.origin()
    love.graphics.scale(scale.x, scale.y)
    if self.combo and not fumbling then
      local c = self.combo
      c.anim.data:loveDraw(c.x, c.y, r, sx, sy, c.ox, c.oy)
    end
    love.graphics.pop()
  end,
}



local dodgeEnd = {
  enter = function(self, stance)
    ac:setAnimation("dodge_" .. data.stance .. "_end", false)
  end,

  update = function(self, dt)
    -- TODO: is animation timing dependent...

    if player.damaged then
      return player.sm:switch("hurt", "dodge")
    end

    -- If not attacked, just switch to the end animation
    if ac:curEvent() == "ended" then
      return player.sm:switch("idle")
    end
  end,

  exit = function (self)
    player.damaged = false -- HACK atm, needs more looking at!
  end,
}



dodgeMain.sm:add("dodgeStart", dodgeStart)

dodgeMain.sm:add("dodgeMinigame", dodgeMinigame)

dodgeMain.sm:add("dodgeEnd", dodgeEnd)



function dodgeMain:enter(stance)
  data.stance = stance
  return self.sm:switch("dodgeStart")
end

function dodgeMain:update(dt)
  self.sm:update(dt)
end

function dodgeMain:draw(dt)
  self.sm:draw()
end

function dodgeMain:exit()
  data = {}

  flipHack = not flipHack
  enemy.x = 0

  if enemy.sm:is("dodgeMinigame") then
    return enemy.sm:switch("idle") -- Non-tested HACK...
  end
end



return dodgeMain






