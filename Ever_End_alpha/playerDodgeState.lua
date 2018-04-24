
local sm = player.sm
local ac = player.ac

return {
  enter = function(self, stance)
    self.stance = stance        

    ac:setAnimation("dodge_" .. self.stance .. "_start", false)

    self.timer = Timer:new()

    if enemy.sm:is("offensive") then
      self.timing = (enemy.timingStage >= 2) and "perfect" or "normal"
    else
      self.timing = "none" -- This needs to have a value, but should still work
    end
  end,


  update = function(self, dt)
    -- TODO: A bunch of stuff here is animation timing dependent...

    if player.damaged then
      if player.damaged.attack.stance == self.stance then
        sm:switch("hurt", "dodge")
      else
--            sm:switch("dodging")??
        ac:setAnimation("dodge_" .. self.stance .. "_" .. self.timing)

        enemy.dodged = true
      end

      player.damaged = false
    end

    -- If actually dodged, update timer and check for attack
    if ac:curName() == "dodge_" .. self.stance .. "_" .. self.timing then
      self.timer:update(dt)

      if input:pressed("attack") then
        ac:setAnimation("gun_attack_" .. self.stance .. "_" .. self.timing, false)
      end
    end


    -- If attacking, Deal damage
    if ac:curName() == "gun_attack_" .. self.stance .. "_" .. self.timing then
      self.timer:update(dt) -- NOTE: This still counts against timer, should it?

      -- TODO: keep track of timing and damage
      if not self.didDamage then
        enemy.damaged = {damage = 1, kind = "gun", timing = self.timing}
        self.didDamage = true
      end

      if ac:curEvent() == "ended" then
        ac:setAnimation("dodge_" .. self.stance .. "_" .. self.timing)
      end
    end
    --

    -- Timer check is here atm cause testing if should count time regardless if attacking or not
    if self.timer:reached(player.dodgeDuration) and not self.done then
      self.done = true
      ac:setAnimation("dodge_" .. self.stance .. "_end", false)
    end


    -- If not attacked, just switch to the end animation
    if ac:curEvent() == "ended" then
      if ac:curName() == "dodge_" .. self.stance .. "_start" then
        ac:setAnimation("dodge_" .. self.stance .. "_end", false) -- NOTE: This assumes we have already switched to "middle" before this if an attack was actually dodged

--            HUMPTimer.tween(player.dodgeDuration, 

      elseif ac:curName() == "dodge_" .. self.stance .. "_end" then
        sm:switch("idle")
        enemy.playerDoneDodge = true
        flipHack = not flipHack

      end
    end
  end,


  exit = function(self)
--        self.timing = "none"
    self.done = false
    self.didDamage = false
  end,
}