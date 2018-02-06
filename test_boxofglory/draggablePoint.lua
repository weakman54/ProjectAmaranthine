
local intersect = require "wutil-lua.wintersect"

local DraggablePoint = {}
DraggablePoint.__index = DraggablePoint

function DraggablePoint:new(inData)
  local obj = {}
  setmetatable(obj, DraggablePoint)
  
  obj.x = (inData and inData.x) or 100
  obj.y = (inData and inData.y) or 100
  obj.width  = (inData and inData.width ) or 20
  obj.height = (inData and inData.height) or 20
  obj.isDragged = false
  obj.color = {255, 255, 255}
  
  obj.printColor = {128, 0, 255}
  obj.printPos = true
  
  return obj
end

function DraggablePoint:draw()
  love.graphics.setColor(self.color)
  love.graphics.rectangle("fill", self.x - self.width/2, self.y - self.height/2, self.width, self.height)
  
  if self.printPos then
    love.graphics.setColor(self.printColor)
    love.graphics.print("(" .. self.x .. ", " .. self.y .. ")", self.x, self.y)
  end
end

function DraggablePoint:mousepressed(x, y)
  if intersect.point_rect_intersect(x, y, self.x - self.width/2, self.y - self.height/2, self.x + self.width/2, self.y + self.height/2) then
    self.isDragged = true
  end
end

function DraggablePoint:mousereleased()
  self.isDragged = false
end

function DraggablePoint:mousemoved(x, y)
  if self.isDragged then
    self.x = x
    self.y = y
  end
end


return DraggablePoint