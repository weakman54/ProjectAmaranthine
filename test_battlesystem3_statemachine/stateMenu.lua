
local stateBattle = require "stateBattle"

local stateMenu = {}


function stateMenu:draw()
  love.graphics.print("Press space to start", 100, 100)
end

function stateMenu:keypressed(key)
  if key == "space" then
    Gamestate.switch(stateBattle)
  end
end


return stateMenu