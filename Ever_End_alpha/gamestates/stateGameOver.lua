local RM = require "resourceManager.resourceManager"
local VNSystem = require "VNSystem"


local stateGameOver = {}



function stateGameOver:init()
  RM.prefix = ""
  self.defeatGUI  = RM:loadAnimation("assets/GUI/Defeat_screen_")  
  self.victoryGUI = RM:loadAnimation("assets/GUI/Victory_screen_")
end

function stateGameOver:enter(from, data)
  self.from = from
  self.won = data.won
  self.acceptInput = false

  self.fadeOut = 1
  HUMPTimer.tween(2, self, {fadeOut = 0}, "out-quad", function() stateGameOver.acceptInput = true end)

  Sound:muteMusic()
end


function stateGameOver:update(dt)
  enemy.ac:update(dt) -- ASSUMPTION: global enemy and player exists
  player.ac:update(dt)


  if not self.acceptInput then return end -- NOTE/ASSUMPTION:  Only input code after here. if other code is added, this needs to be revised!

--  if input:pressed("systemBack") then
--    return love.event.quit()
--  end

  if self.won then
    if inputTimers.comboDown.triggered then -- Continue
      VNSystem:loadScene(enemy.nextScene, enemy.nextPanel)
      return Gamestate.switch(stateVN)
    end

  else -- if defeated
    if inputTimers.comboUp.triggered then -- Back to main
      return Gamestate.switch(stateMain)

    elseif inputTimers.comboLeft.triggered then -- Skip to story
      VNSystem:loadScene(enemy.nextScene, enemy.nextPanel)
      return Gamestate.switch(stateVN)

    elseif inputTimers.comboDown.triggered then -- Retry
      Gamestate.switch(stateBattle, "enemy" .. enemy.name) -- HACK: should switch to the correct battle better (all the global state is making this hacky...)

    end
  end
end

function stateGameOver:draw()
  -- HACK RESET BELOW
  if flipHack then
    love.graphics.origin()
    love.graphics.scale(-scale.x, scale.y) -- Scale hack
    love.graphics.translate(-1920, 0)
  end

  --love.graphics.draw(background, x, y, r, sx, sy, 200, 200)
  love.graphics.setColor(self.fadeOut, self.fadeOut, self.fadeOut)
  self.from.background.data:loveDraw(x, y, r, sx, sy, 200, 200) -- NOTE: this is not updated for the new background stuff, not very noticeable though

  enemy:draw()

  love.graphics.setColor(1, 1, 1)
  player:draw()

-- RESET STUFF (?)
  love.graphics.origin()
  love.graphics.scale(scale.x, scale.y) -- Scale hack


  if self.won then
    self.victoryGUI.data:loveDraw(x, y, r, sx, sy, 200, 200)
    drawGUIOverlays({"comboDown"})

  else
    self.defeatGUI.data:loveDraw(x, y, r, sx, sy, 200, 200)
    drawGUIOverlays({"comboLeft", "comboDown", "comboUp"})

  end
end


return stateGameOver