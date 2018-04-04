

baton = require"baton"  
Gamestate = require "hump.gamestate"
SM = require "statemachine"

require "player"


local stateBattle = require "stateBattle"



-- HACK FOR NOW!
-- Put input stuff in better order later!
input = baton.new {
  controls = {
    left   = {'key:left' , "key:a", 'axis:leftx-', 'button:dpleft'},
    right  = {'key:right', "key:d", 'axis:leftx+', 'button:dpright'},
    up     = {'key:up'   , "key:w", 'axis:lefty-', 'button:dpup'},
    down   = {'key:down' , "key:s", 'axis:lefty+', 'button:dpdown'},
    attack = {'key:space',                         'button:a'},
    guard  = {"key:g"    ,                         "button:x"},
    dodge  = {"key:d"    ,                         "button:rightshoulder"},
  },
  pairs = {
    move = {'left', 'right', 'up', 'down'}
  },
  joystick = love.joystick.getJoysticks()[1],
}




function love.load(arg)
  love.graphics.setNewFont(48)  

  if arg[#arg] == "-debug" then 
    love.graphics.print("Debugload...", 100, 100)
    love.graphics.present()
    require("mobdebug").start()
  end

  love.graphics.print("Loading...", 100, 100)
  love.graphics.present()
  
  
  player:initialize()
  enemy:initialize()


  Gamestate.registerEvents()
  Gamestate.switch(stateBattle)
end




function love.update(dt)
  input:update()
--  someSM:update(dt)
end


function love.draw()
end


function love.keypressed(key)
  if key == "escape" then
    love.event.quit()
  end
end