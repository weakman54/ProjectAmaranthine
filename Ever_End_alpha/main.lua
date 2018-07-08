

dbg_debugEnabled = true

local dbg_openConsole = false and dbg_debugEnabled

local dbg_print_animation_frames = false
local dbg_renderInputTimers = false
local preloadEverything = false

-- Reload error management stuff (should be moved) vvvvvvvv
reloaded = true

function reload(thing)
  if type(thing) ~= "string" then error("reload(): Must pass a string to reload! (passed type: " .. type(thing) .. ")", 2) end
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
require "settings"

-- Lib
Gamestate = require "hump.gamestate"
Sound = require "resourceManager.soundManager"
Timer = require "timer.timer"
HUMPTimer = require "hump.timer"
lume = require "lume.lume"


VNSystem = require "VNSystem"

require "shakeEffect"



local baton = require "baton.baton"
--input = nil -- Global used to store a baton "player" (input mappings)

--lovebird = require "lovebird.lovebird"
--table.insert(lovebird.whitelist, "*.*.*.*") -- Still testing...

SM = require "statemachine.statemachine"
AC = require "animation.animationCollection"
local RM = require "resourceManager.resourceManager"




-- States
stateMain   = require "gamestates.stateMain"
stateBattle = require "gamestates.stateBattle"
statePause  = require "gamestates.statePause"
stateVN     = require "gamestates.stateVN"
stateGameOver     = require "gamestates.stateGameOver"




-- Other stuff:
scale = {x = 1, y = 1} -- scale hack
scale.x = love.graphics.getWidth()/1920  -- scale hack
scale.y = love.graphics.getHeight()/1080 -- scale hack

-- global joystick var, probably not needed...
gJoy = love.joystick.getJoysticks()[1]

-- TEST vvvvvvvvvvvvvvvvvv
flipHack = false

slomo = 1
dbgSlomoFactor = .5
speedUpFactor = 200
-- TEST ^^^^^^^^^^^^^^^^^^


input = baton.new({
    controls = {
      left   = {'key:left' , "key:a", 'axis:leftx-', 'button:dpleft'},
      right  = {'key:right', "key:d", 'axis:leftx+', 'button:dpright'},
      up     = {'key:up'   , "key:w", 'axis:lefty-', 'button:dpup'},
      down   = {'key:down' , "key:s", 'axis:lefty+', 'button:dpdown'},
      attack = {'key:space',                         'button:a'},
      -- guard  = {"key:g"    ,                         "button:rightshoulder", "axis:triggerright+"},
      parry  = {"key:g"    ,                         "button:x"},
      -- dodge  = {"key:d"    ,                         "button:x"},
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
  })


local dbg_inputTimerPercentage = 0
inputTimers = {
  comboDown = {},
  comboUp = {},
  comboLeft = {},
  comboRight = {},
}


function drawGUIOverlays(which)
  if type(which) ~= "table" then error("drawGUIOverlays(): Must supply which overlays to be drawn as a table! Given: " .. tostring(which), 2) end

  for _, name in ipairs(which) do
    local overlay = guiOverlays[name]
    local inputPercentage = inputTimers[name].percentage

    love.graphics.setColor(1, 1, 1, inputPercentage)
    overlay.data:loveDraw(x, y, r, sx, sy, 200, 200)
    love.graphics.setColor(1, 1, 1)
  end
end



function love.load(arg)  

  if dbg_openConsole then
    dbg_openConsole = false
    love._openConsole()
  end

  love.mouse.setVisible( false )

  reloaded = true

  do -- Starting loadscreens
    love.graphics.setNewFont(FONT_PATH, FONT_SIZE)

    if arg[#arg] == "-debug" then
      debugPrint("Loading: Debug", 100, 100)
      require("mobdebug").start() 
    end

    debugPrint("Loading: ", 100, 100)
  end
  --
  -- Elthammar note: There was a broke thing here preventing me to start
  --RM:prefix = "" 
  -- I killed it and changed prefix in resourceManagerd instead
  RM:loadAnimation("assets/GUI/Defeat_screen_")  
  RM:loadAnimation("assets/GUI/Victory_screen_")

  Sound:init()  

  math.randomseed( os.time() )

  if preloadEverything then
    local enemy

    enemy = require "enemyQuit1"
    enemy:initialize()

    enemy = require "enemyQuit2"
    enemy:initialize()

    enemy = require "enemyQuit3"
    enemy:initialize()

    require("player"):initialize()


    VNSystem:loadScene("00_0", nil, nil, true)

    VNSystem:loadScene("01_0", nil, nil, true)

    VNSystem:loadScene("02_0", nil, nil, true)
    VNSystem:loadScene("02_1", nil, nil, true)

    VNSystem:loadScene("03_0", nil, nil, true)

    VNSystem:loadScene("04_0", nil, nil, true)
    VNSystem:loadScene("04_1", nil, nil, true)
    VNSystem:loadScene("04_2", nil, nil, true)

    VNSystem:loadScene("05_0", nil, nil, true)
  end



  -- Preload these so that choice is more impactful, (and credits screen really shouldn't have a load xD
  VNSystem:loadScene("04_1", nil, nil, true)
  VNSystem:loadScene("04_2", nil, nil, true)
  VNSystem:loadScene("05_0", nil, nil, true)


  RM.prefix = ""

  RM:loadAnimation("assets/GUI/pause_screen_")


  guiOverlays = { -- TODO: probably move this out of global scope and such but ehss
    comboUp = RM:loadAnimation("assets/GUI/Menu_Overlay_Up_"),
    comboDown = RM:loadAnimation("assets/GUI/Menu_Overlay_Down_"),
    comboLeft = RM:loadAnimation("assets/GUI/Menu_Overlay_Left_"),
    comboRight = RM:loadAnimation("assets/GUI/Menu_Overlay_Right_"),

    kill = RM:loadAnimation("assets/GUI/Choice_kill_"),
    spare = RM:loadAnimation("assets/GUI/Choice_spare_"),
  }



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
  if input:pressed("systemStart") and 
  Gamestate.current() ~= stateMain and
  Gamestate.current() ~= stateGameOver and
  Gamestate.current() ~= statePause then

    return Gamestate.push(statePause)
  end


  -- Input timers
  local largestPercentage = 0
  for action, inputTimer in pairs(inputTimers) do
    if input:down(action) then
      inputTimer.acc = inputTimer.acc + dt
    else
      inputTimer.acc = 0
    end

    inputTimer.percentage = math.min(inputTimer.acc / GUI_TIME_FOR_INPUT, GUI_TIME_FOR_INPUT)
    inputTimer.triggered = inputTimer.acc >= GUI_TIME_FOR_INPUT

    if inputTimer.percentage > largestPercentage then
      largestPercentage = inputTimer.percentage
    end
  end
  dbg_inputTimerPercentage = largestPercentage



  -- TEST vvvvvvvvvvvvvv
  dt = dt * slomo
  -- TEST ^^^^^^^^^^^^^^

--  lovebird.update()

  if Gamestate.current() ~= statePause then
    HUMPTimer.update(dt)
  end

  --Sound:update(dt)  -- NOTE: not quite fully tested, but should work fine
  callOrError(Gamestate.update, dt)
end


function love.draw()
  love.graphics.scale(scale.x, scale.y) -- Scale hack


  callOrError(Gamestate.draw)


  if dbg_debugEnabled then
    love.graphics.setColor(1, 0.75, 1, 0.75)
    love.graphics.print("Debug Mode (toggle with 0)", x, 50)

    love.graphics.setColor(1, 1, 1, 1)

    if dbg_print_animation_frames and player.ac and enemy.ac then
      dbgPrintAnimFrames()
    end

    if dbg_renderInputTimers then
      love.graphics.rectangle("fill", 0, H - 50, 100 * dbg_inputTimerPercentage, 50)
      love.graphics.line(100, H - 50, 100, H)
    end
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

  love.graphics.setNewFont(FONT_PATH, FONT_SIZE)

  love.graphics.setColor(1.0, 1.0, 1.0)
end
--



function GameReload()
  print("\n-------------------------------------------------------------\nRELOADING\n-------------------------------------------------------------\n")
  reload "util"
  reload "global_consts"
  reload "settings"
  reload "shakeEffect"

  Timer = reload("timer.timer")
  SM    = reload("statemachine.statemachine")
  AC    = reload("animation.animationCollection")

  Sound:muteMusic()
  Sound = reload("resourceManager.soundManager")
  Sound:init()


  -- NOTE: player and enemy needs to be reloaded _before_ stateBattle! they are initialized there

  stateBattle = reload("gamestates.stateBattle")
  statePause  = reload("gamestates.statePause")
  stateMain   = reload("gamestates.stateMain")
  stateVN     = reload("gamestates.stateVN")
  stateGameOver     = reload("gamestates.stateGameOver")

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
  if key == "0" then
    dbg_debugEnabled = not dbg_debugEnabled
  end


  if dbg_debugEnabled then
    if key == "t" and enemy then
      enemy.dbg_trigger_offensive_action = not enemy.dbg_trigger_offensive_action

    elseif key == "m" then
      Sound:muteMusic()

    elseif key == "1" then
      debugPrint("Loading: Debug", 100, 100)
      require("mobdebug").start() 
      print("debug ---------------")


    elseif key == "2" then
      callOrError(GameReload)

    elseif key == "3" and enemy and player then -- Reset animations, could proably be moved
      if player.sm then
        player.sm:switch("idle")
      end

      if enemy.sm then
        enemy.sm:switch("idle")
      end

    elseif key == "4" then
      slomo = slomo == 1 and dbgSlomoFactor or 1

    elseif key == "5" then
      slomo = slomo == 1 and speedUpFactor or 1
    end
  end
end


function love.resize(w, h)
  scale.x = love.graphics.getWidth()/1920  -- scale hack
  scale.y = love.graphics.getHeight()/1080 -- scale hack
end


function love.joystickadded( joystick )
  gJoy = love.joystick.getJoysticks()[1]

  input = baton.new({
      controls = {
        left   = {'key:left' , "key:a", 'axis:leftx-', 'button:dpleft'},
        right  = {'key:right', "key:d", 'axis:leftx+', 'button:dpright'},
        up     = {'key:up'   , "key:w", 'axis:lefty-', 'button:dpup'},
        down   = {'key:down' , "key:s", 'axis:lefty+', 'button:dpdown'},
        attack = {'key:space',                         'button:a'},
        -- guard  = {"key:g"    ,                         "button:rightshoulder", "axis:triggerright+"},
        parry  = {"key:g"    ,                         "button:x"},
        -- dodge  = {"key:d"    ,                         "button:x"},
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
    })
end


function love.joystickremoved()
  gJoy = love.joystick.getJoysticks()[1]
end




















