

local stateMain = {}

local playerDeath


function stateMain:enter(previous, data)
  if data then
    playerDeath = data.playerDeath
  end
end


function stateMain:update(dt)

end


function stateMain:draw()
  if playerDeath ~= nil then
    if playerDeath then
      love.graphics.print("You were defeated! Press r to try again, or space to restart entirely")
    else
      love.graphics.print("You won! Press space to play again")
    end
  else
    love.graphics.print("press space to start", 100, 100)
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