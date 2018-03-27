
local stateBattle = require "stateBattle"

local stateMenu = {}

local won


function stateMenu:enter(previous, data)
  if data then
    won = data.won
  end
end


function stateMenu:draw()
  if won == nil then
    love.graphics.print("Press space to start", 100, 100)

  elseif won then
    love.graphics.print("You won, press space to restart", 100, 100)
  elseif won == false then
    love.graphics.print("You lost, press space to restart", 100, 100)
  end
end

function stateMenu:keypressed(key)
  if key == "space" then
    Gamestate.switch(stateBattle)
  end
end


return stateMenu