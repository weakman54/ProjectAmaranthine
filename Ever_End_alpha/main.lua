
require "util"
require "global_consts"

-- Lib
local Gamestate = require "hump.gamestate"
local baton = require "baton.baton"
local Sound = require "resourceManager.soundManager"


-- States
--local stateMain = require "gamestates.stateMain"
local stateBattle = require "gamestates.stateBattle"


-- Other stuff:
local scale = {x = 1, y = 1} -- scale hack


-- TEST vvvvvvvvvvvvvvvvvv
local enemy = require "enemy"
-- TEST ^^^^^^^^^^^^^^^^^^


input = baton.new { -- Should be global
  controls = {
    left   = {'key:left' , "key:a", 'axis:leftx-', 'button:dpleft'},
    right  = {'key:right', "key:d", 'axis:leftx+', 'button:dpright'},
    up     = {'key:up'   , "key:w", 'axis:lefty-', 'button:dpup'},
    down   = {'key:down' , "key:s", 'axis:lefty+', 'button:dpdown'},
    attack = {'key:space',                         'button:a'},
    guard  = {"key:g"    ,                         "button:rightshoulder", "axis:triggerright+"},
    dodge  = {"key:d"    ,                         "button:x"},
    heal   = {"key:h"    ,                         "button:y"},

    systemStart = {"key:escape",                   "button:start"},                      
  },
  pairs = {
    move = {'left', 'right', 'up', 'down'}
  },
  joystick = love.joystick.getJoysticks()[1],
}



function love.load(arg)
  do -- Starting loadscreens
    love.graphics.setNewFont(48)

    if arg[#arg] == "-debug" then
      debugPrint("Loading: Debug", 100, 100)
      require("mobdebug").start() 
    end

    debugPrint("Loading: ", 100, 100)
  end
  --

  math.randomseed( os.time() )
  

  Gamestate.switch(stateBattle)
end


function love.update(dt)
  input:update()

  if input:pressed("systemStart") then love.event.quit() end

  -- TEST vvvvvvvvvvvvvv
  -- TEST ^^^^^^^^^^^^^^

  Sound:update(dt)  -- NOTE: not quite fully tested, but should work fine
  Gamestate.update(dt)
end


function love.draw()
  love.graphics.scale(scale.x, scale.y) -- Scale hack

  -- TEST vvvvvvvvvvv
  -- ^^^^^^^^^^^^^^^^

  Gamestate.draw()
end


function love.keypressed(key, scancode, isrepeat)
  -- TEST vvvvvvvvvvvvvvv
  -- TEST ^^^^^^^^^^^^^^^

  -- NOTE: cannot use input library in keypressed! use it in update instead!
  if scancode == "`" then
    love._openConsole()
  end
end


function love.resize(w, h)
  scale.x = love.graphics.getWidth()/1920  -- scale hack
  scale.y = love.graphics.getHeight()/1080 -- scale hack
end






































