

local statePause = {}

local printScreenMode = false

function statePause:init()
end
function statePause:enter(from)
  self.from = from -- record previous state
  self.pausedSounds = love.audio.pause()
end


function statePause:update(dt)

end

function statePause:draw()
  local W, H = love.graphics.getWidth(), love.graphics.getHeight()
  -- draw previous screen
  self.from:draw()

  if not printScreenMode then
    -- overlay with pause message
    love.graphics.setColor(0,0,0, 100)
    love.graphics.rectangle('fill', 0,0, W,H)
    love.graphics.setColor(255,255,255)
    love.graphics.printf('PAUSE', 0, H/2, W, 'center')

    love.graphics.printf("p - return\nr - return to main menu\nt - toggle printscreen mode\nescape - exit game", 0, H/2 + 100, W, "center")
  end
end

function statePause:keypressed(key)
  if key == "escape" then
    love.event.quit()

  elseif key == "p" then
    return Gamestate.pop()

  elseif key == "r" then
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