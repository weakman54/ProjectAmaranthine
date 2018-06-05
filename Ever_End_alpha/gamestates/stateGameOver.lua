local RM = require "resourceManager.resourceManager"
local VNSystem = require "VNSystem"


local stateGameOver = {}



function stateGameOver:init()
  RM.prefix = ""
  self.defeatGUI  = RM:loadAnimation("assets/GUI/Defeat_screen_")  
  self.victoryGUI = RM:loadAnimation("assets/GUI/Victory_screen_")

--  self.sm = SM:new()
--  local sm = self.sm

--  sm:add("initial", {

--      })
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


  if self.acceptInput then
    if input:pressed("comboUp") then
		if not self.won then
			Gamestate.switch(stateBattle, "enemy" .. enemy.name) -- HACK: should switch to the correct battle better (all the global state is making this hacky...)
		end
    elseif input:pressed("comboLeft") then
      VNSystem:loadScene(enemy.nextScene, enemy.nextPanel)
      Gamestate.switch(stateVN)
      
    elseif input:pressed("comboRight") then
      Gamestate.switch(stateMain)

    elseif input:pressed("systemBack") then
      love.event.quit()

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
  else
    self.defeatGUI.data:loveDraw(x, y, r, sx, sy, 200, 200)
  end
--  love.graphics.printf("Game Over", 0, 200, W,'center')
--  love.graphics.printf("left - Restart Battle\nright - Start VN\nx/back - Exit game", 0, H - 200, W, 'center')
end


return stateGameOver