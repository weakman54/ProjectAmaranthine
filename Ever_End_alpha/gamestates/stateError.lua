

-- TODO: incorporate functions in each module for how to handle errors (with severity probably)
-- NOTE for the above, this should probably be more implicit functions such as the current already used
-- Sound:muteMusic, rather than explicit doThisWhenError() functions, but they should be designed with
-- error handling/reset in mind as one of the use cases

local stateError = {}


local p 


function stateError:enter(prev, msg)
  self.from = prev
  self.err = msg

  -- COPIED FROM errorhandler:
  -- Reset state.
  if love.mouse then
    love.mouse.setVisible(true)
    love.mouse.setGrabbed(false)
    love.mouse.setRelativeMode(false)
    if love.mouse.isCursorSupported() then
      love.mouse.setCursor()
    end
  end
  if love.joystick then
    -- Stop all joystick vibrations.
    for i,v in ipairs(love.joystick.getJoysticks()) do
      v:setVibration()
    end
  end
  if love.audio then love.audio.stop() end

  love.graphics.reset()
  love.graphics.origin()



  local trace = debug.traceback()

  local errStr = {}

  table.insert(errStr, "Error\n")

  table.insert(errStr, msg)

  for l in trace:gmatch("(.-)\n") do
    if not l:match("boot.lua") then
      l = l:gsub("stack traceback:", "Traceback\n")
      table.insert(errStr, l)
    end
  end

  table.insert(errStr, "\n1 - start debugger\n2 - reload" .. --[[\n3 - propagate error (crash "properly")]]"\nx - exit game")


  p = table.concat(errStr, "\n")


  Sound:muteMusic()

  
  
  print("Error: " .. self.err)
end


function stateError:update(dt)
  if input:pressed("systemStart") then
    return Gamestate.pop()
  end
end

function stateError:draw()
  love.graphics.clear(193/255, 135/255, 255/255)
  love.graphics.setColor(0, 0, 0)

  love.graphics.setNewFont(20)

  local pos = 20
  love.graphics.printf(p, pos, pos, W - pos)


  love.graphics.setNewFont(FONT_PATH, FONT_SIZE)
  love.graphics.setColor(1, 1, 1)
end


-- NOTE: this function is an exception to the rule to not use keypressed in game states, since it is the error state.
-- TODO: that said, it should probably be looked at and cleaned up a bit
function stateError:keypressed(key)
  if key == "3" then
    error(self.err, 2) -- propagate the error for handling outside of the app

  elseif key == "x" then
    love.event.quit()

  end
end




return stateError