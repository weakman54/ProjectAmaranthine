

-- LASKDJLASKDJLASKJD
reloaded = true

function reload(thing)
  package.loaded[thing] = nil
  reloaded = true
  return require(thing)
end
-- ALSKDJLAKSJD


require "util"
require "global_consts"

-- Lib
Gamestate = require "hump.gamestate"
Sound = require "resourceManager.soundManager"


local baton = require "baton.baton"
local RM = require "resourceManager.resourceManager"


-- States
stateMain   = require "gamestates.stateMain"
stateBattle = require "gamestates.stateBattle"
statePause  = require "gamestates.statePause"


-- Other stuff:
local scale = {x = 1, y = 1} -- scale hack


-- TEST vvvvvvvvvvvvvvvvvv
enemy = require("enemy")

flipHack = false
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
  reloaded = true
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

  Gamestate.switch(stateMain)
end


function love.update(dt)
  if reloaded then 
    reloaded = false 
    return 
  end

  input:update()

  if input:pressed("systemStart") then 
    if Gamestate.current() == stateMain then
      love.event.quit() 
    elseif Gamestate.current() ~= statePause then
      return Gamestate.push(statePause)
    end
  end



  -- TEST vvvvvvvvvvvvvv
  -- TEST ^^^^^^^^^^^^^^

  Sound:update(dt)  -- NOTE: not quite fully tested, but should work fine
  Gamestate.update(dt)
end


function love.draw()
  if flipHack then
    love.graphics.scale(-scale.x, scale.y) -- Scale hack
    love.graphics.translate(-1920, 0)

  else
    love.graphics.scale(scale.x, scale.y) -- Scale hack
  end

  -- TEST vvvvvvvvvvv
  -- ^^^^^^^^^^^^^^^^

  Gamestate.draw()
end


function love.keypressed(key, scancode, isrepeat)
  -- TEST vvvvvvvvvvvvvvv
  -- TEST ^^^^^^^^^^^^^^^

  Gamestate.keypressed(key, scancode, isrepeat) -- TODO: remove this later

  -- NOTE: cannot use input library in keypressed! use it in update instead!
  if scancode == "`" then
    love._openConsole()
  end

  if key == "t" then
    enemy.dbg_trigger_offensive_action = not enemy.dbg_trigger_offensive_action

  elseif key == "+" then
    print("RELOADING\n-------------------------------------------------------------\n")
    stateBattle = reload("gamestates.stateBattle")
    statePause = reload("gamestates.statePause")
    stateMain = reload("gamestates.stateMain")

    RM.dbg_render = false
    Gamestate.switch(stateMain) -- Easier to switch to the one you want from here
  end
end


function love.resize(w, h)
  scale.x = love.graphics.getWidth()/1920  -- scale hack
  scale.y = love.graphics.getHeight()/1080 -- scale hack
end






































