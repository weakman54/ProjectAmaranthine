
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

--function parry:draw(dt)
--  self.sm:draw()
--end

function parry:exit()
  data = {}

  if enemy.sm:is("parryMinigame") then
    return enemy.sm:switch("idle") -- Non-tested HACK...
  end
end





sm:add("parryStart", {
    enter = function(self)
      ac:setAnimation("parry", false)

      enemy.sm:switch("parryMinigame")
      enemy.ac:pause()

      self.timer = Timer:new()
    end,

    update = function(self, dt)
      self.timer:update(dt)

      if input:pressed("attack") then
        return sm:switch("parryWindup", 1)
      end


      if self.timer:reached(player.parryDuration) then
        return player.sm:switch("idle")
      end
    end,
  })

sm:add("parryWindup", {
    enter = function(self, stage)
      self.stage = stage
      ac:setAnimation(string.format("sword_combo%02d_windup", stage))

      self.timer = Timer:new()
    end,

    update = function(self, dt)
      self.timer:update(dt)

      if self.timer:reached(1) or input:pressed("attack") then -- HARDCODED for now
       return sm:switch("parryAttack", self.stage)
      end
    end,
  })


sm:add("parryAttack", {
    enter = function(self, stage)
      self.stage = stage

      ac:setAnimation(string.format("sword_combo%02d_attack", self.stage), false)
      enemy.ac:setAnimation(string.format("sword_hurt%02d", self.stage))
      
      enemy:changeHP(-1) -- MAGIC VALUE: damage

      self.timer = Timer:new()
    end,

    update = function(self, dt)
      self.timer:update(dt)

      if self.timer:reached(1) then -- HARDCODED for now
        local t = self.stage + 1
        if t == 4 then
          player.sm:switch("idle")
        else
          sm:switch("parryWindup", t)
        end
      end
    end,
  })








return parry