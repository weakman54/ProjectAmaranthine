

local RM = require "resourceManager.resourceManager"


local statePause = {}


local printScreenMode = false


function statePause:init()
  RM.prefix = ""
  self.GUI = RM:loadAnimation("assets/GUI/pause_screen_")
end


function statePause:enter(from)
  self.from = from -- record previous state
  self.pausedSounds = love.audio.pause()
end

local returnAcc = 0
local menuAcc = 0

function statePause:update(dt)
--  if input:down("comboUp") then
--    returnAcc = returnAcc + dt
--  else
--    returnAcc = 0
--  end

--  if input:down("comboDown") then
--    menuAcc = menuAcc + dt
--  else
--    menuAcc = 0
--  end

  if inputTimers.comboUp.triggered then
    return Gamestate.pop()

  elseif inputTimers.comboDown.triggered then
    Gamestate.pop()
    return Gamestate.switch(stateMain)

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

    self.GUI.data:loveDraw(x, y, r, sx, sy, 200, 200)

--    love.graphics.printf('PAUSE', 0, H/2, W, 'center')

--    love.graphics.printf("escape/start - Return to game\nr - Return to main menu\nt - Toggle printscreen mode\nx/back - Exit game", 0, H/2 + 100, W, "center")
  end
end

function statePause:keypressed(key)
  if key == "r" then
--    Gamestate.pop()
--    return Gamestate.switch(stateMain)

  elseif key == "t" then
    printScreenMode = not printScreenMode

  elseif key == "" then


  end
end



function statePause:leave()
  love.audio.play(self.pausedSounds)
end



return statePause