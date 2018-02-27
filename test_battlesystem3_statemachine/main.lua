
require "strict"


require "minimalistSoundManager"
Timer  = require "hump.timer"
Signal = require "hump.signal"


require "enemy"
require "player"

local Animation = require "animation"
local AC = require "animationCollection"


local background



function love.load(arg)
  love.graphics.setNewFont(48)  

  if arg[#arg] == "-debug" then 
    love.graphics.print("Debugload...", 100, 100)
    love.graphics.present()
    require("mobdebug").start()
  end

  love.graphics.print("Loading...", 100, 100)
  love.graphics.present()

  background = love.graphics.newImage("assets/background.png")

  enemy:initialize()
  player:initialize()
end


function love.update(dt)
  Timer.update(dt)

  player:update(dt)
  enemy:update(dt)
end


function love.draw()
  love.graphics.draw(background, nil, nil, nil, nil, nil, 250, 250)

  enemy:draw(nil, nil, nil, nil, nil, 250, 250)
  player:draw(nil, nil, nil, nil, nil, 250, 250)
end


function love.keypressed(key)
--  print(key)
  if key == "escape" then love.event.quit() return end

  player:keypressed(key)
end

function love.keyreleased(key)
  player:keyreleased(key)
end