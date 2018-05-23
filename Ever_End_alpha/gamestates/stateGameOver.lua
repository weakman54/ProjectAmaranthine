local RM = require "resourceManager.resourceManager"
local VNSystem = require "VNSystem"


local logo


local stateGameOver = {}



function stateGameOver:init()
  RM.prefix = ""
  logo = RM:loadImage("assets/EveREnd logo.png")
end

function stateGameOver:enter(from, data)
  self.from = from
  
  self.won = data.won
  
  self.fadeOut = 1
  HUMPTimer.tween(2, self, {fadeOut = 0})
  
  Sound:muteMusic()
end


function stateGameOver:update(dt)
  enemy.ac:update(dt) -- ASSUMPTION: global enemy and player exists
  player.ac:update(dt)


  if input:pressed("left") then
    Gamestate.switch(stateBattle)

  elseif input:pressed("right") then
    if self.won then
      VNSystem:loadScene(enemy.nextScene, enemy.nextPanel)
    end
    Gamestate.switch(stateVN)

  elseif input:pressed("systemBack") then
    love.event.quit()

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
  self.from.background.data:loveDraw(x, y, r, sx, sy, 200, 200)

  enemy:draw()

  love.graphics.setColor(1, 1, 1)
  player:draw()

-- RESET STUFF (?)
  love.graphics.origin()
  love.graphics.scale(scale.x, scale.y) -- Scale hack


  love.graphics.printf("Game Over", 0, 200, W,'center')
  love.graphics.printf("right - Restart Battle\nleft - Start VN\nx/back - Exit game", 0, H - 200, W, 'center')
end


return stateGameOver