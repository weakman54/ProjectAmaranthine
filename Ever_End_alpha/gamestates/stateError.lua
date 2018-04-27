

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

  table.insert(errStr, '\n1 - start debugger\n2 - reload\n3 - propagate error (crash "properly")\nx - exit game')


  p = table.concat(errStr, "\n")

--  p = p:gsub("\t", "")
--  p = p:gsub("%[string \"(.-)\"%]", "%1")





-- Use the assigned button instead
--  debugPrint("Loading: Debug. Error: " .. err, 100, 100)
--  require("mobdebug").start() 

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

--  love.graphics.printf('Error', 20, 50, W, 'center')

  love.graphics.setNewFont(20)
--  love.graphics.printf(, 20, 100, W, "center")

  local pos = 20
  love.graphics.printf(p, pos, pos, W - pos)


  love.graphics.setNewFont(48)
end


function stateError:keypressed(key)
  if key == "3" then
    error(self.err, 2) -- propagate the error for handling outside of the app
    
  elseif key == "x" then
    love.event.quit()
    
  end
end




return stateError