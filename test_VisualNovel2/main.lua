
-- Utility stuff TODO: move into proper place! vvvvvvvvvvvvvvvv
function removeValue(array, value) 
  for i=#array, 1, -1 do 
    if array[i] == value then 
      table.remove(array, i) 
    end 
  end 
end

function clearTable(t)
  local count = #t
  for i=0, count do t[i]=nil end
end
-- Utility stuff ^^^^^^^^^^^^^^^^^


-- Scaling HACK
scale = {}


require "miniSoundManager"

baton     = require "baton"  
Gamestate = require "hump.gamestate"
SM        = require "statemachine"
Timer     = require "hump.timer"


require "player"
require "enemy"


stateMain   = require "stateMain"
stateBattle = require "stateBattle"
stateVN     = require "stateVN"
statePause  = require "statePause"



-- HACK FOR NOW!
-- Put input stuff in better order later!
input = baton.new {
  controls = {
    left   = {'key:left' , "key:a", 'axis:leftx-', 'button:dpleft'},
    right  = {'key:right', "key:d", 'axis:leftx+', 'button:dpright'},
    up     = {'key:up'   , "key:w", 'axis:lefty-', 'button:dpup'},
    down   = {'key:down' , "key:s", 'axis:lefty+', 'button:dpdown'},
    attack = {'key:space',                         'button:a'},
    guard  = {"key:g"    ,                         "button:rightshoulder", "axis:triggerright+"},
    dodge  = {"key:d"    ,                         "button:x"},
    heal   = {"key:h"    ,                         "button:y"},
  },
  pairs = {
    move = {'left', 'right', 'up', 'down'}
  },
  joystick = love.joystick.getJoysticks()[1],
}




function love.load(arg)
  do -- BOILERPLATE vvvvvvvvvvv
    love.graphics.setNewFont(48)

    love.graphics.clear(000, 000, 000)

    if arg[#arg] == "-debug" then
      love.graphics.print("Debug Load...", 100, 100)
      love.graphics.present()
      require("mobdebug").start() 
    end

    love.graphics.print("Loading...", 100, 100)
    love.graphics.present()
  end -- BOILERPLATE ^^^^^^^^
  --

  Gamestate.registerEvents()
  Gamestate.switch(stateMain)
end
--


function love.update(dt)
  love.audio.update()
  input:update()
end


function love.draw()
end


function love.keypressed(key)
  if key == "escape" then
    love.event.quit()

  elseif Gamestate.current() ~= stateMain and Gamestate.current() ~= statePause and key == 'p' then
    return Gamestate.push(statePause)

  end
end


















