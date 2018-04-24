
local dodgeMain = {
  sm = SM:new(),
}

local sm = dodgeMain.sm
local ac = player.ac

local data = {}


local dodgeStart = {
  enter = function(self)
    print("dodgeStart")
    ac:setAnimation("dodge_" .. data.stance .. "_start", false)

    self.timer = Timer:new()

    if enemy.sm:is("offensive") then
      data.timing = (enemy.timingStage >= 2) and "perfect" or "normal"
      print("1", data.timing)
    else
      data.timing = "none" -- This needs to have a value, but should still work
    end
  end,

  update = function(self, dt)
    self.timer:update(dt)

    -- Attacked during dodge:
    if player.damaged then

      print("2", data.timing)
      if player.damaged.attack.stance == data.stance then
        player.sm:switch("hurt", "dodge")

      else

        data.enemyAttack = player.damaged

        player.damaged = false

        enemy.sm:switch("dodgeMinigame")
        sm:switch("dodgeMinigame")
      end
    end

    
    if self.timer:reached(player.dodgeStartDuration) then
      sm:switch("dodgeEnd") -- If not attacked, just switch to the end animation. ASSUMPTION: we didn't switch state before this
    end
  end,
}




local dodgeMinigame = {
  enter = function(self)
    print("dodgeMini")
    enemy.ac:pause()
    ac:setAnimation("dodge_" .. data.stance .. "_" .. data.timing)

    self.timer = Timer:new()
  end,

  update = function(self, dt)
    self.timer:update(dt)

    if self.timer:reached(player.dodgeDuration) then
      enemy.ac:play() -- This will probably not be needed?
      enemy.sm:switch("idle") -- NOTE: not quite good yet
      sm:switch("dodgeEnd")
    end
  end,
}



local dodgeEnd = {
  enter = function(self, stance)
    print("dodgeEnd")
    ac:setAnimation("dodge_" .. data.stance .. "_end", false)
  end,

  update = function(self, dt)
    -- TODO: A bunch of stuff here is animation timing dependent...

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

function dodgeMain:exit()
  data = {}
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


