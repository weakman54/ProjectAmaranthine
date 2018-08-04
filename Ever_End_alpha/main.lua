

-- Debug stuff vvvvv
dbg_debugEnabled = false


if dbg_debugEnabled then
--require("mobdebug").start() -- Run this line if debug mode should be enabled (only in zerobrane)
end


local dbg_openConsole = false and dbg_debugEnabled

local dbg_dtMultiplier = 1
local dbg_dtSlowFactor = .5
local dbg_dtFastFactor = 200
local dbg_renderDtMultiplier = true and dbg_debugEnabled



-- Battle state stuff ---------
function dbg_battleResetStats()
  if not player or not enemy then return end

  enemy:reset()
  player:reset()
end

function dbg_battleResetAnimations()
  if not player or not enemy then return end

  if player.sm then
    player.sm:switch("idle")
  end

  if enemy.sm then
    enemy.sm:switch("idle")
  end
end


function dbg_VNResetToSetting()
  if not VNSystem then return end
  VNSystem:loadScene(sceneToLoad, panelToLoad)
end



function dbg_resetVNOrBattle()
  if Gamestate.current() == stateBattle then
    dbg_battleResetStats()
    dbg_battleResetAnimations()

  elseif Gamestate.current() == stateVN then
    dbg_VNResetToSetting()
  end
end




-- NOTE: Comment out functions that should not run, all functions prefixed with dbg_ _should_ be checked for existance before trying to run
-- Preload stuff
local dbg_loadOnlyEssentials = true and dbg_debugEnabled


-- Debug draw stuff ----
function dbg_draw()
  love.graphics.setColor(1, 0.75, 1, 0.75)
  love.graphics.print("Debug Mode (toggle with 0)", x, 50)


  if dbg_renderAnimationFrames then   dbg_renderAnimationFrames()    end
  if dbg_renderInputTimers then dbg_renderInputTimers() end


  love.graphics.setColor(1, 1, 1, 1)
end
--

--[[
function dbg_renderAnimationFrames()
  -- Make sure player and enemy exists and has ac so that we can actually draw them
  local playerEnemyExists = player and enemy and player.ac and enemy.ac
  if not playerEnemyExists then return end


  -- Reset graphics
  love.graphics.push()
  love.graphics.reset() -- RESETS Font(size?) as well, not documented? might be mistaken
  love.graphics.scale(scale.x, scale.y) -- Scale hack

  love.graphics.setColor(1.0, 1.0, 1.0)


  local topMargin = 40

  love.graphics.rectangle("fill", 0, 0, W, topMargin)

  love.graphics.setColor(0.0, 0.0, 0.0)

  love.graphics.print("player: " .. player.ac:curName() .. ": " .. player.ac:curFrame(), 10, 10)

  love.graphics.print("enemy: "  .. enemy.ac:curName()  .. ": " .. enemy.ac:curFrame(), 10, topMargin/2)


  -- "pop" graphics
  love.graphics.pop() -- does not re-reset font?
  love.graphics.setNewFont(FONT_PATH, FONT_SIZE)
  love.graphics.setColor(1.0, 1.0, 1.0)
end
--]]

---[[
local dbg_inputTimerPercentage = 0
function dbg_renderInputTimers()
  love.graphics.rectangle("fill", 0, H - 50, 100 * dbg_inputTimerPercentage, 50)
  love.graphics.line(100, H - 50, 100, H)
end
--]]



-- Keypressed callback ------
function dbg_keypressed(key, scancode, isrepeat) 
  -- TODO: make more generic? have a list of keys and corresponding callbacks maybe?
  -- makes it easier to add new debug things close to the context where they are used,
  -- tradeoff being that it's harder to track down all the usages of it (search all files ofc, but it's more unclear still)

  -- TODO: regardless of above consideration, debug usages of keypressed need to be better marked (currently there are a bunch of gamestates that have keypress debug stuff)

  if key == "0" then
    dbg_debugEnabled = not dbg_debugEnabled
  end


  if dbg_debugEnabled then 
    if key == "1" then
      debugPrint("Loading: Debug", 100, 100)
      require("mobdebug").start() 
      print("debug ---------------")


    elseif key == "m" then
      Sound:muteMusic()


    elseif key == "2" then
      callOrError(GameReload)


    elseif key == "3" and enemy and player then -- Reset animations, could proably be moved
      dbg_battleResetAnimations()

    elseif key == "t" and enemy then
      enemy.dbg_trigger_offensive_action = not enemy.dbg_trigger_offensive_action


    elseif key == "r" then
      dbg_resetVNOrBattle()


    elseif key == "4" then
      dbg_dtMultiplier = dbg_dtMultiplier == 1 and dbg_dtSlowFactor or 1

    elseif key == "5" then
      dbg_dtMultiplier = dbg_dtMultiplier == 1 and dbg_dtFastFactor or 1
    end
  end
end
-- Debug stuff ^^^^^^






-- Reload error management stuff (should be moved) vvvvvvvv
skipNextFrame = true -- HACK: set when loading things, since dt will be large due to lag

function reload(thing)
  if type(thing) ~= "string" then error("reload(): Must pass a string to reload! (passed type: " .. type(thing) .. ")", 2) end
  package.loaded[thing] = nil

--  skipNextFrame = true -- TODO/NOTE: should probably remove this since its too granular UNTESTED

  return require(thing)
end



-- NOTE: This function does not work well with multiple returns atm
function callOrError(f, ...)
  local stateError = require "gamestates.stateError"

  local function msgh(msg)
    Gamestate.switch(stateError, msg)
  end

  local ok, ret = xpcall(f, msgh, ...)

  if not ok then
    return ok, ret
  end

  return ret
end
-- Reload error management stuff ^^^^^^^^^^^^^^^^^^^^^^




-- require stuff -----------------------
-- Libs ----
Gamestate = require "hump.gamestate"
HUMPTimer = require "hump.timer"
lume = require "lume.lume"


--lovebird = require "lovebird.lovebird"
--table.insert(lovebird.whitelist, "*.*.*.*") -- Still testing...


local RM = require "resourceManager.resourceManager" -- NOTE  bit of a special case, these are needed to load assets
local VNSystem = require "VNSystem"


-- Input vvvvvvvvvvvvvvvvvvv
local baton = require "baton.baton"

function newInputControlsTable()
  return {
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

      systemStart = {"key:escape", "key:return",     "button:start"},    
      systemBack  = {"key:x"     ,                   "button:back"},               

    },
    pairs = {
      move = {'left', 'right', 'up', 'down'}
    },
    joystick = love.joystick.getJoysticks()[1], -- TODO: figure out how to set/get this info without having to create a whole new table each time...
  }
end
--

input = baton.new(newInputControlsTable())


inputTimers = {
  comboDown = {},
  comboUp = {},
  comboLeft = {},
  comboRight = {},
}

function updateInputTimers(dt)
  dbg_inputTimerPercentage = 0
  for action, inputTimer in pairs(inputTimers) do
    if input:down(action) then
      inputTimer.acc = inputTimer.acc + dt
    else
      inputTimer.acc = 0
    end

    inputTimer.percentage = math.min(inputTimer.acc / GUI_TIME_FOR_INPUT, GUI_TIME_FOR_INPUT)
    inputTimer.triggered = inputTimer.acc >= GUI_TIME_FOR_INPUT

    -- Debug
    if inputTimer.percentage > dbg_inputTimerPercentage then
      dbg_inputTimerPercentage = inputTimer.percentage
    end
  end
end


function initializeGUIOverlays()
  RM.prefix = ""
  guiOverlays = { -- TODO: probably move this out of global scope and such but eh
    comboUp = RM:loadAnimation("assets/GUI/Menu_Overlay_Up_"),
    comboDown = RM:loadAnimation("assets/GUI/Menu_Overlay_Down_"),
    comboLeft = RM:loadAnimation("assets/GUI/Menu_Overlay_Left_"),
    comboRight = RM:loadAnimation("assets/GUI/Menu_Overlay_Right_"),

    kill = RM:loadAnimation("assets/GUI/Choice_kill_"),
    spare = RM:loadAnimation("assets/GUI/Choice_spare_"),
  }
end

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
-- Input ^^^^^^^^^^^^^^^^^^




------------------------------------------------------------------------------------------
-- Reload --------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
function GameReload(opts)
  skipNextFrame = true

  if opts and opts.isreload then
    print("\n-------------------------------------------------------------\nRELOADING\n-------------------------------------------------------------\n")
  end

  reloadGlobalDataFiles()
  reloadOwnNoDependencyLibs()
  reloadGamestates() -- NOTE: probably should not reload stateError in GameReload, since its called in callOrError

  reload "VNSystem"


  if opts then
    if opts.loadSound then
      reloadAndInitializeSound()
    end


    if opts.loadAssets == "normal" then
      loadNormalAssets()
    elseif opts.loadAssets == "all" then
      loadAllAssets()
    end
  end



--  RM.dbg_render = false -- Don't show loading screens, they take long to just render...
  Gamestate.switch(stateMain)
end


-- Asset loading ---------
-- NOTE: assets mostly refer to images/animations, sound is _not_ considered an "asset" in this sense.
-- most if not all functions dealing with loading sound has "sound" in their names

local preloadEverything = false -- TODO: make into setting


function loadAllAssets()
  -- NOTE/TODO: this function doesn't load quite all the assets by itself yet
  -- assets are also often loaded indirectly, by loading the script that loads the assets, which is currently unavoidable
  skipNextFrame = true

  require("enemyQuit1"):initialize()
  require("enemyQuit2"):initialize()
  require("enemyQuit3"):initialize()

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


function loadNormalAssets() -- TODO: think up a better name (=P)
  -- NOTE: only load stuff that is small and/or should not have a loading screen
  skipNextFrame = true

  RM.prefix = ""

  RM:loadAnimation("assets/GUI/pause_screen_")
  RM:loadAnimation("assets/GUI/Defeat_screen_")  
  RM:loadAnimation("assets/GUI/Victory_screen_")

  VNSystem:loadScene("04_1", nil, nil, true)
  VNSystem:loadScene("04_2", nil, nil, true)
  VNSystem:loadScene("05_0", nil, nil, true)
end
--



-- Script reloading --------
function reloadGlobalDataFiles()
  reload "util"
  reload "global_consts"
  reload "settings"

  reload "shakeEffect"
end
--

function reloadOwnNoDependencyLibs()
  Timer = reload "timer.timer"

  SM    = reload "statemachine.statemachine"
  AC    = reload "animation.animationCollection"
end
--

function reloadGamestates()
  -- NOTE: requires dependencies, load libs and global data files first
  stateMain     = reload("gamestates.stateMain")
  stateVN       = reload("gamestates.stateVN")
  stateBattle   = reload("gamestates.stateBattle")
  statePause    = reload("gamestates.statePause")
  stateGameOver = reload("gamestates.stateGameOver")
end
--


-- Reload and reinitialize -----
function reloadAndInitializeSound()
  skipNextFrame = true

  if Sound then Sound:muteMusic() end -- Make sure to stop any playing music TODO: fix sound manager timers and so on to work with pause/stop 
  Sound = reload("resourceManager.soundManager") -- NOTE: does not re-initialize Sound, TODO: fix "rescan assets" function for both Sound and RM

  Sound:init()
end





-- Other stuff: ----------
scale = {x = 1, y = 1} -- scale hack
scale.x = love.graphics.getWidth()/1920  -- scale hack
scale.y = love.graphics.getHeight()/1080 -- scale hack


-- global joystick var, probably not needed...
gJoy = love.joystick.getJoysticks()[1] -- TODO: look over this proper


-- TEST vvvvvvvvvvvvvvvvvv
flipHack = false
-- TEST ^^^^^^^^^^^^^^^^^^





------------------------------------------------------------------------------------------
-- Load ----------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
function love.load(arg)

  if dbg_openConsole then love._openConsole() end -- TODO: ensure love running on windows? (shouldn't be needed given that this is set through code)


  math.randomseed( os.time() )


  reloadGlobalDataFiles() -- util and global consts special case, usages are noted below as *


  -- NOTE/TODO: state of these could be modified during runtime, so they should be contained in a function somewhere instead so that they could be repeated
  love.mouse.setVisible( false )
  love.graphics.setNewFont(FONT_PATH, FONT_SIZE) -- NOTE*: requires global_consts for font path and size




  do -- Starting loadscreens
    if arg[#arg] == "-debug" then
      debugPrint("Loading: Debug", 100, 100) -- NOTE*: requires util for debugPrint
      require("mobdebug").start() 
    end

    debugPrint("Loading: ", 100, 100) -- NOTE*: requires util for debugPrint
  end
  --


  initializeGUIOverlays() -- NOTE: this is a bit out of place, but atm this is the best place for it


  local assetsToLoad = preloadEverything and "all" or "normal"
  if dbg_loadOnlyEssentials then assetsToLoad = nil end -- a bit HACKy, but is a bit more readable (?)


  GameReload({isreload = false, loadSound = true, loadAssets = assetsToLoad})


  Gamestate.switch(stateMain)
end





------------------------------------------------------------------------------------------
-- Update --------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
function love.update(dt)
  -- reload HACK: Skip frame if stuff has been loaded, since dt will be large
  if skipNextFrame then 
    skipNextFrame = false 
    return 
  end


--  lovebird.update()


  -- Input stuff ----------
  input:update()


  -- Change to pause menu, except from places where it doesn't make sense. NOTE: statePause must be in this list, to avoid infinite recursion! TODO: fix a check in statePause to make sure this doesn't happen?
  if input:pressed("systemStart") and 
  Gamestate.current() ~= stateMain and
  Gamestate.current() ~= stateGameOver and
  Gamestate.current() ~= statePause then

    return Gamestate.push(statePause)
  end


  -- Input timers ----
  updateInputTimers(dt)


  -- TEST vvvvvvvvvvvvvv
  dt = dt * dbg_dtMultiplier -- NOTE: dt multiplied below this point! vvvvvvvvvvvvvv
  -- TEST ^^^^^^^^^^^^^^


  if Gamestate.current() ~= statePause then
    HUMPTimer.update(dt)
  end


  callOrError(Gamestate.update, dt)
end



------------------------------------------------------------------------------------------
-- Draw ----------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
function love.draw()
  love.graphics.scale(scale.x, scale.y) -- Scale hack

  callOrError(Gamestate.draw)


  if dbg_debugEnabled then dbg_draw() end
end
--



------------------------------------------------------------------------------------------
-- Misc. Love callbacks ------------------------------------------------------------------
------------------------------------------------------------------------------------------
function love.keypressed(key, scancode, isrepeat)
  -- NOTE: cannot use input library in keypressed! use it in update instead!
  
  -- NOTE: no gamestates get keypressed callbacks except stateError, since any non debug input should be handled by the input library
  if Gamestate.current() == stateError then -- NOTE: stateError is a bit of a special case, and could probably be cleaned up a bit as well (keypress wise)
    Gamestate.keypressed(key, scancode, isrepeat)
  end


  dbg_keypressed(key, scancode, isrepeat)
end
--


-- use resize callback to make sure scaling is proper
function love.resize(w, h)
  scale.x = love.graphics.getWidth()/1920  -- scale hack
  scale.y = love.graphics.getHeight()/1080 -- scale hack
end
--


-- Joystick --
function love.joystickadded( joystick )
  gJoy = love.joystick.getJoysticks()[1]

  input = baton.new(newInputControlsTable())
end
--

function love.joystickremoved()
  gJoy = love.joystick.getJoysticks()[1]

  input = baton.new(newInputControlsTable())
end
--




















