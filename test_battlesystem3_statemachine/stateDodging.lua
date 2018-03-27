


local stateDodging = {}


local duration = 1


function stateDodging:enter(previous, goodTiming)
  self.timer = Timer.after(duration, function() Gamestate.pop() end)
  self.goodTiming = goodTiming
end

function stateDodging:update(dt)
  enemy:update(dt)
  player:update(dt) -- Experimental
end

function stateDodging:draw()
  enemy:draw()
  player:draw()
  love.graphics.print("Dodging", 100, 100)
end

function stateDodging:keypressed(key)
  if key == "space" then -- MAGIC VALUE... TODO: fix input system proper
    player.sm:doattack("fromDodge")
    enemy:receiveAttack({thing="fromDodge", goodTiming = self.goodTiming })
  end
end


return stateDodging