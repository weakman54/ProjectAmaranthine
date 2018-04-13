
-- Lib
local Gamestate = require "hump.gamestate"


-- States
local stateMain = require "gamestates.stateMain"



local scale = {x = 1, y = 1} -- scale hack



function love.load(arg)
  do -- Starting loadscreens
    love.graphics.setNewFont(48)

    love.graphics.clear{0, 0, 0}

    if arg[#arg] == "-debug" then
      love.graphics.print("Debug Load...")
      love.graphics.present()
      require("mobdebug").start() 
    end

    love.graphics.print("Loading...", 150, 100)
    love.graphics.present()
  end
--

  Gamestate.switch(stateMain)
end


function love.update(dt)
  Gamestate.update(dt)
end


function love.draw()
  love.graphics.scale(scale.x, scale.y) -- Scale hack
  
  Gamestate.draw()
end


function love.keypressed(key, scancode, isrepeat)

  if scancode == "`" then
    love._openConsole()
  end
  --

  if key == "escape" then
    love.event.quit()

  elseif key == "" then

  end
  --

  Gamestate.keypressed(key, scancode, isrepeat)
end


function love.resize(w, h)
  scale.x = love.graphics.getWidth()/1920  -- scale hack
  scale.y = love.graphics.getHeight()/1080 -- scale hack
end






































