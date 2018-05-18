
local RM = require "resourceManager.resourceManager"


local parry = {sm = SM:new()}

local ac = player.ac
local sm = parry.sm


local data = {}



function parry:enter()
  return self.sm:switch("parryStart")
end

function parry:update(dt)
  self.sm:update(dt)
end

function parry:draw(dt)
  self.sm:draw()
end

function parry:exit()
  data = {}

  if enemy.sm:is("parryMinigame") then
    return enemy.sm:switch("idle") -- Non-tested HACK...
  end
end




local stageTimings = {
  --  {duration = 2.0, target = 1.500},  
  {duration = 1.5, target = 1.250 },
  {duration = 1.0, target = 0.865 },
  {duration = 0.5, target = 0.4375},
}

RM.prefix = ""
local graphics = {
  border = {anim = RM:loadAnimation("assets/GUI/sword_combo_border_"      , nil, 12), s = 1},
  flash  = {anim = RM:loadAnimation("assets/GUI/sword_combo_border_flash_", nil, 12), s = 1},
  button = {anim = RM:loadAnimation("assets/GUI/sword_combo_button_"      , nil, 12), s = 1},
}

for _, c in pairs(graphics) do
  local iw, ih =  c.anim.data._frames[1].data:getDimensions()
  c.ox, c.oy = iw/2, ih/2
  c.x, c.y = W/2, H/2
end




sm:add("parryStart", {
    enter = function(self)
      ac:setAnimation("parry", false)
      Sound:play("Player Parry")

      enemy.sm:switch("parryMinigame")
      enemy.ac:pause()

      graphics.border.s = 1
      HUMPTimer.tween(player.parryMinigameDuration, graphics.border, {s = 0.25}, "linear")

      self.timer = Timer:new()
    end,

    update = function(self, dt)
      self.timer:update(dt)

      if input:pressed("attack") then
        return sm:switch("parryWindup", 1)
      end


      if self.timer:reached(player.parryMinigameDuration) then
        return player.sm:switch("idle")
      end
    end,

    draw = function(self)
      love.graphics.push() -- HACKY fix to remove flip effect
      love.graphics.origin()
      love.graphics.scale(scale.x, scale.y)


      local c 

      c = graphics.button
      c.anim.data:loveDraw(c.x, c.y, r, c.s, c.s, c.ox, c.oy)

      if self.drawFlash then
        c = graphics.flash
        c.anim.data:loveDraw(c.x, c.y, r, c.s, c.s, c.ox, c.oy)

      else
        c = graphics.border
        c.anim.data:loveDraw(c.x, c.y, r, c.s, c.s, c.ox, c.oy)
      end


      love.graphics.pop()
    end,
  })






sm:add("parryWindup", {
    enter = function(self, stage)
      ac:setAnimation(string.format("sword_combo%02d_windup", stage))

      self.stage = stage
      self.duration = stageTimings[stage].duration
      self.target   = self.duration/2

      self.drawFlash = false
      graphics.border.s = 1

      --      local dif = self.duration - self.target
      --      local after = function() HUMPTimer.tween(dif, graphics.border, {s = 0.25}, "linear") end
      HUMPTimer.tween(self.duration, graphics.border, {s = 0.25}, "linear")


      self.timer = Timer:new()
    end,

    update = function(self, dt)
      self.timer:update(dt)

      --      if input:pressed("attack") then

      --        self.drawFlash = true
      --      end

      if self.timer:reached(self.duration) or input:pressed("attack") then
        local dif = math.abs(self.timer._acc - self.target)
        local norm = dif/self.target

        return sm:switch("parryAttack", self.stage, norm)
      end
    end,

    draw = function(self)
      love.graphics.push() -- HACKY fix to remove flip effect
      love.graphics.origin()
      love.graphics.scale(scale.x, scale.y)


      local c 

      c = graphics.button
      c.anim.data:loveDraw(c.x, c.y, r, c.s, c.s, c.ox, c.oy)

      if self.drawFlash then
        c = graphics.flash
        c.anim.data:loveDraw(c.x, c.y, r, c.s, c.s, c.ox, c.oy)

      else
        c = graphics.border
        c.anim.data:loveDraw(c.x, c.y, r, c.s, c.s, c.ox, c.oy)
      end


      love.graphics.pop()
    end,
  })



sm:add("parryAttack", {
    enter = function(self, stage, normalizedDif)
      self.stage = stage

      ac:setAnimation(string.format("sword_combo%02d_attack", self.stage), false)
      enemy.ac:setAnimation(string.format("hurt%02d", self.stage))

      --      self.swordComboBaseDmg = 1
      --      self.swordComboGradDmg = 2

      local damageDealt = player.swordComboBaseDmg + player.swordComboGradDmg - player.swordComboGradDmg * normalizedDif

      enemy:changeHP(-damageDealt)

      self.timer = Timer:new()
    end,

    update = function(self, dt)
      self.timer:update(dt)

      if self.timer:reached(1) then -- HARDCODED for now
        local t = self.stage + 1
        if t == 4 then -- HARDCODED number of stages, also slightly HACK way to determine when to change
          player.sm:switch("idle")
        else
          sm:switch("parryWindup", t)
        end
      end
    end,
  })








return parry