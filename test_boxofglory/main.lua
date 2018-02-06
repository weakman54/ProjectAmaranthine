
local TheBox = require "TheBox"
local DraggablePoint = require "draggablePoint"


local bg = love.graphics.newImage("background.png")
local dragPoints = {
  DraggablePoint:new{x = 100, y = 100},
  DraggablePoint:new{x = 200, y = 100},
  DraggablePoint:new{x = 200, y = 200},
  DraggablePoint:new{x = 100, y = 200},
}


local mask = false


function love.load(arg)

end


function love.update(dt)
  TheBox.pts[1] = dragPoints[1].x
  TheBox.pts[2] = dragPoints[1].y

  TheBox.pts[3] = dragPoints[2].x
  TheBox.pts[4] = dragPoints[2].y

  TheBox.pts[5] = dragPoints[3].x
  TheBox.pts[6] = dragPoints[3].y

  TheBox.pts[7] = dragPoints[4].x
  TheBox.pts[8] = dragPoints[4].y
end


function love.draw()
  -- This needs more fiddling, but we might not even use it so eh
--  love.graphics.setColor(000, 255, 000)
--  love.graphics.rectangle("fill", 50, 50, 100, 400)
  
  love.graphics.setColor(000, 000, 000)
  
  
  if mask then
--    love.graphics.setColor(000, 000, 000)
    love.graphics.rectangle("fill", 0, 0, love.graphics.getDimensions())
    love.graphics.stencil(TheBox.draw, "replace", 1)
    love.graphics.setStencilTest("greater", 0)
  end

  love.graphics.setColor(255, 255, 255)
  love.graphics.draw(bg)
  
  
  if not mask then TheBox.draw() end -- Feels a bit hacky, but eh, works for now


  love.graphics.setStencilTest()


  for _, point in ipairs(dragPoints) do
    point:draw()
  end
end


function love.keypressed(key)
  if key == "escape" then
    love.event.quit()
    
  elseif key == "m" then
    mask = not mask
    
  end
end


function love.mousepressed(x, y)
  for _, point in ipairs(dragPoints) do
    point:mousepressed(x, y)
  end
end
function love.mousemoved(x, y)
  for _, point in ipairs(dragPoints) do
    point:mousemoved(x, y)
  end
end
function love.mousereleased()
  for _, point in ipairs(dragPoints) do
    point:mousereleased()
  end
end












