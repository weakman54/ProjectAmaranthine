

local statePause = {}


local printScreenMode = false


function statePause:enter(from)
  self.from = from -- record previous state
  self.pausedSounds = love.audio.pause()
end


function statePause:update(dt)
  if input:pressed("systemStart") then
    return Gamestate.pop()
    
  elseif input:pressed("systemBack") then
    love.event.quit()
    
  end
end

function statePause:draw()
  -- draw previous screen
  self.from:draw()

  if not printScreenMode then
    -- overlay with pause message
    love.graphics.setColor(0, 0, 0, 0.5)
    love.graphics.rectangle('fill', 0, 0, W, H)
    love.graphics.setColor(1, 1, 1)
    love.graphics.printf('PAUSE', 0, H/2, W, 'center')

    love.graphics.printf("escape/start - Return to game\nr - Return to main menu\nt - Toggle printscreen mode\nx/back - Exit game", 0, H/2 + 100, W, "center")
  end
end

function statePause:keypressed(key)
  if key == "r" then
    Gamestate.pop()
    return Gamestate.switch(stateMain)

  elseif key == "t" then
    printScreenMode = not printScreenMode

  elseif key == "" then


  end
end



function statePause:leave()
  love.audio.play(self.pausedSounds)
end



return statePause