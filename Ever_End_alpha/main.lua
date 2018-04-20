
require "util"
require "global_consts"

-- Lib
local Gamestate = require "hump.gamestate"
local baton = require "baton.baton"


-- States
--local stateMain = require "gamestates.stateMain"
local stateBattle = require "gamestates.stateBattle"


-- Other stuff:
local scale = {x = 1, y = 1} -- scale hack


-- TEST vvvvvvv
local RM = require "resourceManager.resourceManager"

local AnimationCollection = require "animation.animationCollection"
local ac = AnimationCollection:new()  
ac:setFramerate(30)


local Sound = require "resourceManager.soundManager"


--local enemy = require "enemy"
-- TEST ^^^^^^^^


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

  math.randomseed( os.time() )
--

  -- TEST vvvvvvvvvvvvvvvvvv
--  debugPrint("Loading: Sounds", 100, 100)
--  Sound:init()

--  test = love.audio.newSource("assets/sound/Collapse4.ogg", "static")
--  print(test)
--  test = love.audio.newSource("assets/sound/Collapse4.ogg", "static")
--  print(test)

--  debugPrint("Loading: Animations", 100, 100)
--  RM.prefix = "assets/Quit/Quit_"

--  ac:addAnimation("attack_high1_windup", RM:loadAnimation("attack-high1-windup_"))
--  ac:addAnimation("attack_low1_windup", RM:loadAnimation("attack-low1-windup_"))

--  enemy:initialize()
  --TEST ^^^^^^^^^^^

  Gamestate.switch(stateBattle)
end


function love.update(dt)
  input:update()

  if input:pressed("systemStart") then love.event.quit() end

  -- TEST vvvvvvvvvvvvvv
--  ac:update(dt)
  Sound:update(dt)
  -- TEST ^^^^^^^^^^

  Gamestate.update(dt)
end


function love.draw()
  love.graphics.scale(scale.x, scale.y) -- Scale hack

-- TEST vvvvvvvvvvv
--  ac:loveDraw() --  TEST
  -- ^^^^^^

  Gamestate.draw()
end


function love.keypressed(key, scancode, isrepeat)
  -- TEST vvvvvvvvvvvvv
--  ac:setAnimation("attack_low1_windup") -- 
  Sound:play("Collapse4")
  -- TEST ^^^^^^^^^^^^^^^¨

--  test:play()

  -- NOTE: cannot use input library in keypressed! use it in update instead!
  if scancode == "`" then
    love._openConsole()
  end
end


function love.resize(w, h)
  scale.x = love.graphics.getWidth()/1920  -- scale hack
  scale.y = love.graphics.getHeight()/1080 -- scale hack
end






































