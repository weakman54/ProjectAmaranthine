

local dbg_print_animation_frames = false

-- Reload error management stuff (should be moved) vvvvvvvv
reloaded = true

function reload(thing)
  package.loaded[thing] = nil
  reloaded = true
  return require(thing)
end


local stateError = require "gamestates.stateError"

-- NOTE: This function does not work well with multiple returns atm
function callOrError(f, ...)
  local function msgh(msg) -- xpcall stuff not tested atm..
    Gamestate.switch(stateError, msg)
  end


  local ok, ret = xpcall(f, msgh, ...)

  if not ok then
    return ok, ret
  end

  return ret
end
-- ^^^^^^^^^^^^^^^^^^^^^^


require "util"
require "global_consts"

-- Lib
Gamestate = require "hump.gamestate"
Sound = require "resourceManager.soundManager"
Timer = require "timer.timer"
HUMPTimer = require "hump.timer"
lume = require "lume.lume"

local baton = require "baton.baton"
input = nil -- Global used to store a baton "player" (input mappings)

lovebird = require "lovebird.lovebird"
table.insert(lovebird.whitelist, "*.*.*.*") -- Still testing...

SM = require "statemachine.statemachine"
AC = require "animation.animationCollection"
local RM = require "resourceManager.resourceManager"




-- States
stateMain   = require "gamestates.stateMain"
stateBattle = require "gamestates.stateBattle"
statePause  = require "gamestates.statePause"
stateVN     = require "gamestates.stateVN"



-- Other stuff:
scale = {x = 1, y = 1} -- scale hack

-- global joystick var, probably not needed...
gJoy = love.joystick.getJoysticks()[1]

-- TEST vvvvvvvvvvvvvvvvvv
flipHack = false

slomo = 1
dbgSlomoFactor = .5
-- TEST ^^^^^^^^^^^^^^^^^^


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
    -- TODO: choices = keys:
    combo = {"button:a", "button:b", "button:x", "button:y"},
    comboLeft    = {"key:a"    ,                   "button:x"},
    comboRight   = {"key:d"    ,                   "button:b"},
    comboUp      = {"key:w"    ,                   "button:y"},
    comboDown    = {"key:s"    ,                   "button:a"},

    systemStart = {"key:escape",                   "button:start"},    
    systemBack  = {"key:x"     ,                   "button:back"},               

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

  Sound:init()  

  math.randomseed( os.time() )

  Gamestate.switch(stateMain)
end


function love.update(dt)
  -- Skip frame if stuff has been loaded, since dt will be large
  if reloaded then 
    reloaded = false 
    return 
  end

  input:update()

  -- Change to pause from anywhere but main and pause itself
  if input:pressed("systemStart") then 
    if Gamestate.current() == stateMain then
      ----      love.event.quit() 
      --      Gamestate.switch(stateBattle)
    elseif Gamestate.current() ~= statePause then
      return Gamestate.push(statePause)
    end
  end



  -- TEST vvvvvvvvvvvvvv
  dt = dt * slomo
  -- TEST ^^^^^^^^^^^^^^

  lovebird.update()

  HUMPTimer.update(dt)

  Sound:update(dt)  -- NOTE: not quite fully tested, but should work fine
  callOrError(Gamestate.update, dt)
end


function love.draw()
  love.graphics.scale(scale.x, scale.y) -- Scale hack


  callOrError(Gamestate.draw)


  if dbg_print_animation_frames and player.ac and enemy.ac then
    dbgPrintAnimFrames()
  end
end

function dbgPrintAnimFrames()
  love.graphics.push()
  love.graphics.reset() -- RESETS Font as well, not documented? might be mistaken
  love.graphics.scale(scale.x, scale.y) -- Scale hack

  love.graphics.setColor(1.0, 1.0, 1.0)


  local t = 40

  love.graphics.rectangle("fill", 0, 0, W, t)

  love.graphics.setColor(0.0, 0.0, 0.0)

  love.graphics.print("player: " .. player.ac:curName() .. ": " .. player.ac:curFrame(), 10, 10)

  love.graphics.print("enemy: "  .. enemy.ac:curName()  .. ": " .. enemy.ac:curFrame(), 10, t/2)
  love.graphics.pop() -- does not re-reset font?

  love.graphics.setNewFont(48)

  love.graphics.setColor(1.0, 1.0, 1.0)
end
--



function GameReload()
  print("\n-------------------------------------------------------------\nRELOADING\n-------------------------------------------------------------\n")
  reload "util"
  reload "global_consts"

  Timer = reload("timer.timer")
  SM    = reload("statemachine.statemachine")
  AC    = reload("animation.animationCollection")
--  Sound = reload("resourceManager.soundManager")
--    Sound:init()

  -- NOTE: player and enemy needs to be reloaded _before_ stateBattle! they are initialized there

  stateBattle = reload("gamestates.stateBattle")
  statePause  = reload("gamestates.statePause")
  stateMain   = reload("gamestates.stateMain")
  stateVN     = reload("gamestates.stateVN")
  -- NOTE: probably should not reload stateError here, since its called in callOrError


  --  RM.dbg_render = false -- Don't show loading screens, they take long to just render...
  Gamestate.switch(stateMain)
end



function love.keypressed(key, scancode, isrepeat)
  -- NOTE: cannot use input library in keypressed! use it in update instead!

  if Gamestate.current() ~= stateError then
    callOrError(Gamestate.keypressed, key, scancode, isrepeat) -- TODO: remove this later
  else
    Gamestate.keypressed(key, scancode, isrepeat)
  end

  -- NOTE: windows specific, crashes on mac...
  if scancode == "`" and love.system.getOS() == "Windows" then
    love._openConsole()
  end


  if key == "t" then
    enemy.dbg_trigger_offensive_action = not enemy.dbg_trigger_offensive_action

  elseif key == "1" then
    debugPrint("Loading: Debug", 100, 100)
    require("mobdebug").start() 
    print("debug ---------------")


  elseif key == "2" then
    callOrError(GameReload)

  elseif key == "3" then -- Reset animations, could proably be moved
    if player.sm then
      player.sm:switch("idle")
    end

    if enemy.sm then
      enemy.sm:switch("idle")
    end

  elseif key == "4" then

    slomo = slomo == 1 and dbgSlomoFactor or 1
  end
end


function love.resize(w, h)
  scale.x = love.graphics.getWidth()/1920  -- scale hack
  scale.y = love.graphics.getHeight()/1080 -- scale hack
end


function love.joystickadded( joystick )
  gJoy = love.joystick.getJoysticks()[1]

  -- This can be simplified
  input = baton.new { -- HACK
    controls = {
      left   = {'key:left' , "key:a", 'axis:leftx-', 'button:dpleft'},
      right  = {'key:right', "key:d", 'axis:leftx+', 'button:dpright'},
      up     = {'key:up'   , "key:w", 'axis:lefty-', 'button:dpup'},
      down   = {'key:down' , "key:s", 'axis:lefty+', 'button:dpdown'},
      attack = {'key:space',                         'button:a','button:b'},
      guard  = {"key:g"    ,                         "button:x"},--"button:rightshoulder", "axis:triggerright+"},
      dodge  = {"key:d"    ,                         "button:x"},
      heal   = {"key:h"    ,                         "button:y"},
      -- TODO: choices = keys:

      comboLeft    = {"key:a"    ,                   "button:x"},
      comboRight   = {"key:d"    ,                   "button:b"},
      comboUp      = {"key:w"    ,                   "button:y"},
      comboDown    = {"key:s"    ,                   "button:a"},

      systemStart = {"key:escape",                   "button:start"},    
      systemBack  = {"key:x"     ,                   "button:back"},               

    },
    pairs = {
      move = {'left', 'right', 'up', 'down'}
    },
    joystick = love.joystick.getJoysticks()[1],
  }
end


function love.joystickremoved()
  gJoy = love.joystick.getJoysticks()[1]
end


































