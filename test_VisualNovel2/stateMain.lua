

local stateMain = {}

local playerDeath
local logo

function stateMain:init()
  logo = love.graphics.newImage("assets/EveREnd logo.png")
end



function stateMain:enter(previous, data)
  if data then
    playerDeath = data.playerDeath
  end
end


function stateMain:update(dt)

end


function stateMain:draw()
  local W, H = love.graphics.getWidth(), love.graphics.getHeight()
--    love.graphics.printf('PAUSE', 0, H/2, W, 'center')

  love.graphics.draw(logo, 0, -200)
  if playerDeath ~= nil then
    if playerDeath then
      love.graphics.printf("You were defeated! Press r to try again, or space to restart entirely", 0, H - 200, W, 'center')
    else
      love.graphics.printf("You won! Press space to play again", 0, H - 200, W, 'center')
    end
  else
    love.graphics.printf("press space to start, escape to exit", 0, H - 200, W, 'center')
  end
end


function stateMain:keypressed(key)
  if key == "escape" then
    love.event.quit()

  elseif key == "space" then
    Gamestate.switch(stateVN)

  elseif key == "r" then
    Gamestate.switch(stateBattle)

  elseif key == "" then


  end
end



return stateMain