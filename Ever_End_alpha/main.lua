

--local hotRod = {}

--hotRod._cache = {}
----  package.loaded[name]

--function hotRod:load(filename, as)
--  if not self._cache[as] then
--    local ok, chunk = pcall(love.filesystem.load, filename)
--    if not ok then return ok, chunk end

--    self._cache[as] = {chunk = chunk, modtime = 0, filename = filename}
--  end



--  local ok, res = pcall(self.cache[filename].chunk)

--  return ok, res
--end


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
local Gamestate = require "hump.gamestate"
local baton = require "baton.baton"
local Sound = require "resourceManager.soundManager"
local RM = require "resourceManager.resourceManager"


-- States
local stateMain = require "gamestates.stateMain"
local stateBattle = require "gamestates.stateBattle"


-- Other stuff:
local scale = {x = 1, y = 1} -- scale hack


-- TEST vvvvvvvvvvvvvvvvvv
local enemy = require("enemy")

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

  enemy:initialize()


  Gamestate.switch(stateBattle)

end


function love.update(dt)
  if reloaded then 
    reloaded = false 
    return 
  end

  input:update()

--  if input:pressed("systemStart") then love.event.quit() end

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


--  if not ok then love.graphics.print("Error loading enemy: " .. enemy) end
  if enemy.dbg_trigger_offensive_action then
    love.graphics.circle("fill", 300, 300, 100)
  end
end


function love.keypressed(key, scancode, isrepeat)
  -- TEST vvvvvvvvvvvvvvv
  -- TEST ^^^^^^^^^^^^^^^

  -- NOTE: cannot use input library in keypressed! use it in update instead!
  if scancode == "`" then
    love._openConsole()
  end

  if key == "t" then
    enemy.dbg_trigger_offensive_action = not enemy.dbg_trigger_offensive_action

  elseif key == "+" then
    stateBattle = reload("gamestates.stateBattle")
    RM.dbg_render = false
    Gamestate.switch(stateBattle)
  end
end


function love.resize(w, h)
  scale.x = love.graphics.getWidth()/1920  -- scale hack
  scale.y = love.graphics.getHeight()/1080 -- scale hack
end






































