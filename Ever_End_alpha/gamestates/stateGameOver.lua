local RM = require "resourceManager.resourceManager"


local logo


local stateGameOver = {}


function stateGameOver:init()
  RM.prefix = ""
  logo = RM:loadImage("assets/EveREnd logo.png")
end


function stateGameOver:update(dt)
  if input:pressed("attack") then
    Gamestate.switch(stateBattle)
    
  elseif input:pressed("guard") then
    Gamestate.switch(stateVN)
    
  elseif input:pressed("systemBack") then
    love.event.quit()
    
  end
end

function stateGameOver:draw()
--  love.graphics.draw(logo.data, 0, -200)
  love.graphics.printf("Game Over", 0, 200, W,'center')
  love.graphics.printf("space/a - Start Battle\ng/right shoulder - Start VN\nx/back - Exit game", 0, H - 200, W, 'center')
end


return stateGameOver