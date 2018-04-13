
-- Lib
local Gamestate = require "hump.gamestate"
local ResourceManager = require "resourceManager.resourceManager"


-- States
local stateMain = require "gamestates.stateMain"
local baton = require "baton.baton"


-- Other stuff:
local scale = {x = 1, y = 1} -- scale hack


local anim -- TEST

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

  -- TEST
  anim = ResourceManager:loadAnimation("assets/Quit/Quit_attack-high1-windup_") -- TEST
  anim.data:setFramerate(30)
  anim.data:play()
  anim.data:setLooping()
  --TEST

  Gamestate.switch(stateMain)
end


function love.update(dt)
  input:update()

  if input:pressed("systemStart") then love.event.quit() end

  anim.data:update(dt) -- TESTs

  Gamestate.update(dt)
end


function love.draw()
  love.graphics.scale(scale.x, scale.y) -- Scale hack

  anim.data:loveDraw() --  TEST

  Gamestate.draw()
end


function love.keypressed(key, scancode, isrepeat)
  -- NOTE: cannot use input library in keypressed! use it in update instead!
  if scancode == "`" then
    love._openConsole()
  end
end


function love.resize(w, h)
  scale.x = love.graphics.getWidth()/1920  -- scale hack
  scale.y = love.graphics.getHeight()/1080 -- scale hack
end






































