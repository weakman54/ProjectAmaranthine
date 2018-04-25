

local stateError = {}


function stateError:enter(prev, err)
  self.from = prev
  self.err = err

  debugPrint("Loading: Debug. Error: " .. err, 100, 100)
  require("mobdebug").start() 

  print("Error: " .. self.err)
end


function stateError:update(dt)
  if input:pressed("systemStart") then
    return Gamestate.pop()
  end
end

function stateError:draw()
  local w, h = love.graphics.getWidth(), love.graphics.getHeight()
  -- draw previous screen
--  self.from:draw()

  love.graphics.clear(0, 0, 0)
  love.graphics.setColor(1, 1, 1)
  love.graphics.printf('Error', 0, 50, W, 'center')

  love.graphics.printf("Error: " .. self.err .. "\nescape - return\n+ - reload\nx - propagate error (crash 'properly')", 0, 100, W, "center")
end


function stateError:keypressed(key)
  if key == "x" then
    error(self.err) -- propagate the error for handling outside of the app
  end
end




return stateError