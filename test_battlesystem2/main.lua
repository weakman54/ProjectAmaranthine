
require "strict"


Timer  = require "hump.timer"
Signal = require "hump.signal"


require "enemy"
require "player"

local Animation = require "animation"
local AC = require "animationCollection"


local background



function love.load(arg)
  if arg[#arg] == "-debug" then require("mobdebug").start() end

  background = love.graphics.newImage("assets/background.png")
  
  initializeEnemy()
  initializePlayer()
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