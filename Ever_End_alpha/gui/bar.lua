
local vec = require "hump.vector" -- TODO: change to own lib

local GUIBar = {}

function GUIBar:new(pos, dim)
  local obj = {}
  
  setmetatable(obj, self)
  self.__index = self
  
  obj.pos = pos or vec(0, 0)
  obj.dim = dim or vec(100, 10)
  
  obj.padding = 2
  
  obj.innerColor = {255, 255, 255}
  obj.outerColor = {000, 000, 000}
  
  obj.min = 0
  obj.max = 1
  obj.current = obj.min + obj.max/2
  
  return obj
end


function GUIBar:setTrackTarget(target, valueName, min, max)
  assert(target and target[valueName], "You must supply a valid target!")
  self.target = target
  self.targetValue = valueName
  self.current = self.target[self.targetValue]
  
  self.min = min or self.min
  self.max = max or self.max
  assert(self.min <= self.max, "GUIBar: min is larger than max!")
end


function GUIBar:getRange()
  return self.max - self.min
end

function GUIBar:getPercent()
  return self.current / self:getRange()
end


function GUIBar:update(dt)
  if self.target then
    self.current = self.target[self.targetValue]
  end
  
  self.current = math.max(self.min, math.min(self.current, self.max)) -- NOTE: Clamps values inside the Bar, we might actuall want to not do this at some point
end

function GUIBar:loveDraw()
  love.graphics.setColor(self.outerColor)
  love.graphics.rectangle("fill", self.pos.x, self.pos.y, self.dim.x, self.dim.y)
  
  
  local innerWidth = (self.dim.x - self.padding*2) * self:getPercent()
  love.graphics.setColor(self.innerColor)
  love.graphics.rectangle("fill", self.pos.x + self.padding, self.pos.y + self.padding, innerWidth, self.dim.y - self.padding*2)
  love.graphics.setColor(255, 255, 255)
end


return GUIBar