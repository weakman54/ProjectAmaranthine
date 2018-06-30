

local RM = require "resourceManager.resourceManager"


local statePause = {}


local printScreenMode = false


function statePause:init()
  RM.prefix = ""
  self.GUI = RM:loadAnimation("assets/GUI/pause_screen_")
end


function statePause:enter(from)
  self.from = from -- Used to draw "behind" the overlay
  self.pausedSounds = love.audio.pause() -- Save these so we can resume them on leave
end

function statePause:leave()
  love.audio.play(self.pausedSounds) 
end



function statePause:update(dt)
  if inputTimers.comboUp.triggered then 
    Gamestate.pop()
    return Gamestate.switch(stateMain)

  elseif inputTimers.comboDown.triggered then
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

    self.GUI.data:loveDraw(x, y, r, sx, sy, 200, 200)

    drawGUIOverlays({"comboUp", "comboDown"})
  end
end


function statePause:keypressed(key)
  if key == "t" then
    printScreenMode = not printScreenMode

  elseif key == "" then

  end
end


return statePause