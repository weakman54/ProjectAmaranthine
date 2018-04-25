
local RM = require "resourceManager.resourceManager"

local dodgeMain = {
  sm = SM:new(),
}

local sm = dodgeMain.sm
local ac = player.ac

local data = {}


local dodgeStart = {
  enter = function(self)
    ac:setAnimation("dodge_" .. data.stance .. "_start", false)

    self.timer = Timer:new()

    data.timing = (enemy.timingStage >= 2) and "perfect" or "normal"
  end,

  update = function(self, dt)
    self.timer:update(dt)

    -- Attacked during dodge:
    if player.damaged then
      if player.damaged.attack.stance == data.stance then
        player.sm:switch("hurt", "dodge")

      else

        data.enemyAttack = player.damaged

        player.damaged = false

        enemy.sm:switch("dodgeMinigame")
        sm:switch("dodgeMinigame")
      end
    end

    -- If not attacked, just switch to the end animation. ASSUMPTION: we didn't switch state before this
    if self.timer:reached(player.dodgeStartDuration) then
      sm:switch("dodgeEnd") 
    end
  end,
}



-- Load combo stuff: -----------------------
RM.prefix = "assets/GUI/"
local combos = { -- HACK TODO: fix the readabilty of the m thing here...
  {name = "up"   , anim = RM:loadAnimation("gun_combo_up_"   , nil, 12), xm = 0, ym = -1},-- x = 1*W/2, y = 1*H/4, },
  {name = "down" , anim = RM:loadAnimation("gun_combo_down_" , nil, 12), xm = 0, ym = 1},-- x = 1*W/2, y = 3*H/4, },
  {name = "left" , anim = RM:loadAnimation("gun_combo_left_" , nil, 12), xm = -1, ym = 0},-- x = 1*W/4, y = 1*H/2, },
  {name = "right", anim = RM:loadAnimation("gun_combo_right_", nil, 12), xm = 1, ym = 0},-- x = 3*W/4, y = 1*H/2, },
}


local t = {x = 2*W/3, y = 1*H/2} -- Center point for the combo graphics

for _, c in ipairs(combos) do
  local w, h =  c.anim.data._frames[1].data:getDimensions()
  c.ox, c.oy = w/2, h/2
  c.x, c.y = t.x + c.ox * c.xm, t.y + c.oy * c.ym
--  print(c.name, c.x, c.y, c.ox * c.m, c.oy * c.m, c.ox, c.oy, c.m)

--  print("#", w, h, combo.ox, combo.oy)
end



local dodgeMinigame = {
  enter = function(self)
--    print("dodgeMini")
    enemy.ac:pause()
    ac:setAnimation("dodge_" .. data.stance .. "_" .. data.timing) -- ASSUMPTION: data.timing should have a correct value here since we're in this state


    self.combo = combos[math.random(4)]


    self.timer = Timer:new()
  end,

  update = function(self, dt)
    self.timer:update(dt)
    self.combo.anim.data:update(dt)

    if self.timer:reached(player.dodgeDuration) then
      enemy.ac:play() -- This will probably not be needed?
      enemy.sm:switch("idle") -- NOTE: not quite good yet
      sm:switch("dodgeEnd")
    end
  end,

  draw = function(self)
    for i=1, 4 do
--      local c = combos[i]
      local c = self.combo
      c.anim.data:loveDraw(c.x, c.y, r, sx, sy, c.ox, c.oy)
    end
  end,
}



local dodgeEnd = {
  enter = function(self, stance)
    ac:setAnimation("dodge_" .. data.stance .. "_end", false)
  end,

  update = function(self, dt)
    -- TODO: is animation timing dependent...

    if player.damaged then
      player.sm:switch("hurt", "dodge")
    end

    -- If not attacked, just switch to the end animation
    if ac:curEvent() == "ended" then
      player.sm:switch("idle")
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
  self.sm:switch("dodgeStart", stance)
end

function dodgeMain:update(dt)
  self.sm:update(dt)
end

function dodgeMain:draw(dt)
  self.sm:draw()
end

function dodgeMain:exit()
  data = {}
  if enemy.sm:is("dodgeMinigame") then
    enemy.sm:switch("idle") -- Non-tested HACK...
  end
end



return dodgeMain





--if enemy.sm:is("offensive") then
--      data.timing = (enemy.timingStage >= 2) and "perfect" or "normal"
--    else
--      data.timing = "none" -- This needs to have a value, but should still work
--    end





--  update = function(self, dt)
--    -- TODO: A bunch of stuff here is animation timing dependent...

--    if player.damaged then

--      if player.damaged.attack.stance == data.stance then
--        sm:switch("hurt", "dodge")
--      else
--        local t = {
--          enemyAttack = player.damaged,
--          stance = self.stance,
--          timing = self.timing
--        }
--        player.damaged = false
--        enemy.sm:switch("dodge_minigame")
--        sm:switch("dodge_minigame", t)


------            sm:switch("dodging")??
----        ac:setAnimation("dodge_" .. self.stance .. "_" .. self.timing)

----        enemy.dodged = true
--      end
--    end

----    -- If actually dodged, update timer and check for attack
----    if ac:curName() == "dodge_" .. self.stance .. "_" .. self.timing then
----      self.timer:update(dt)

----      if input:pressed("attack") then
----        ac:setAnimation("gun_attack_" .. self.stance .. "_" .. self.timing, false)
----      end
----    end


----    -- If attacking, Deal damage
----    if ac:curName() == "gun_attack_" .. self.stance .. "_" .. self.timing then
----      self.timer:update(dt) -- NOTE: This still counts against timer, should it?

----      -- TODO: keep track of timing and damage
----      if not self.didDamage then
----        enemy.damaged = {damage = 1, kind = "gun", timing = self.timing}
----        self.didDamage = true
----      end

----      if ac:curEvent() == "ended" then
----        ac:setAnimation("dodge_" .. self.stance .. "_" .. self.timing)
----      end
----    end
----    --

----    -- Timer check is here atm cause testing if should count time regardless if attacking or not
----    if self.timer:reached(player.dodgeDuration) and not self.done then
----      self.done = true
----      ac:setAnimation("dodge_" .. self.stance .. "_end", false)
----    end


--    -- If not attacked, just switch to the end animation
--    if ac:curEvent() == "ended" then
--      if ac:curName() == "dodge_" .. self.stance .. "_start" then
--        ac:setAnimation("dodge_" .. self.stance .. "_end", false) -- NOTE: This assumes we have already switched to "middle" before this if an attack was actually dodged

--      elseif ac:curName() == "dodge_" .. self.stance .. "_end" then
--        sm:switch("idle")
--        flipHack = not flipHack

--      end
--    end
--  end,
----


--  exit = function(self)
----        self.timing = "none"
--    enemy.playerDoneDodge = true
--    self.done = false
--    self.didDamage = false
--  end,
--}


