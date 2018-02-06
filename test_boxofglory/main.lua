
local TheBox = require "TheBox"

local bg = love.graphics.newImage("background.png")

function love.load(arg)
  
end


function love.update(dt)
  local x, y = TheBox:tl()
  
  x = x + math.random(-1, 1)
  y = y + math.random(-1, 1)
  
  TheBox:tl(x, y)
end


function love.draw()
  love.graphics.setColor(255, 255, 255)
  love.graphics.draw(bg)
  
  love.graphics.setColor(TheBox.color)
  love.graphics.polygon("fill", TheBox.pts)
end


function love.keypressed(key)
  if key == "escape" then
    love.event.quit()
  end
end