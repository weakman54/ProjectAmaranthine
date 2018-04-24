

local dbg_print_animation_frames = true

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
Timer = require "timer.timer"

SM = require "statemachine.statemachine"
AC = require "animation.animationCollection"


local baton = require "baton.baton"
local RM = require "resourceManager.resourceManager"


-- States
stateMain   = require "gamestates.stateMain"
stateBattle = require "gamestates.stateBattle"
statePause  = require "gamestates.statePause"
stateVN     = require "gamestates.stateVN"

-- player/enemy
player = require "player"
enemy = require "enemy"




-- Other stuff:
local scale = {x = 1, y = 1} -- scale hack


-- TEST vvvvvvvvvvvvvvvvvv
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

  if dbg_print_animation_frames and player.ac and enemy.ac then
    love.graphics.push()
    love.graphics.reset() -- RESETS Font as well, not documented? might be mistaken
    love.graphics.scale(scale.x, scale.y) -- Scale hack

    love.graphics.setColor(1.0, 1.0, 1.0)


    local t = 40

    love.graphics.rectangle("fill", 0, 0, W, t)

    love.graphics.setColor(0.0, 0.0, 0.0)
    

    love.graphics.print("player: " .. player.ac:curName() .. ": " .. player.ac:curFrame(), 10, 10)

    love.graphics.print("enemy: "  .. enemy.ac:curName()  .. ": " .. enemy.ac:curFrame(), 10, t/2)

    love.graphics.pop()
    
    love.graphics.setNewFont(48)

    love.graphics.setColor(1.0, 1.0, 1.0)
  end
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
    Timer = reload("timer.timer")
    SM = reload "statemachine.statemachine"
    AC = reload "animation.animationCollection"

    -- NOTE: player and enemy needs to be reloaded _before_ stateBattle! they are initialized there
    player = reload("player")
    enemy = reload("enemy")

    stateBattle = reload("gamestates.stateBattle")
    statePause  = reload("gamestates.statePause")
    stateMain   = reload("gamestates.stateMain")
    stateVN     = reload("gamestates.stateVN")




    RM.dbg_render = false -- Don't show loading screens, they take long to just render...
    Gamestate.switch(stateMain)
  end
end


function love.resize(w, h)
  scale.x = love.graphics.getWidth()/1920  -- scale hack
  scale.y = love.graphics.getHeight()/1080 -- scale hack
end






































