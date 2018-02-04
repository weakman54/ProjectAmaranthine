
local Animation = {}

function Animation:new(animationData)
  if type(animationData) == "string" then
    animationData = require(animationData)
  end

  if type(animationData) ~= "table" then
    error("Plz supply animData as string or table")
  end

  local obj = animationData -- TODO: maybe make obj as {} here? otherwise whatevs

  setmetatable(obj, self)
  self.__index = self

  obj.curTime = 0
  obj.curFrameI = 1
  obj.curFrame  = animationData.frameData[obj.curFrameI]
  obj.numFrames = #animationData.frameData
  obj.looping = false
  obj.playing = true

  return obj
end


function Animation:update(dt)
  if not self.playing then return end

  self.curTime = self.curTime + dt

  if self.curTime >= self.curFrame.frameTime then
    self:increment()
    self.curTime = 0 --self.curTime - self.curFrame.frameTime -- TODO: This needs to be looked at more properly...
  end
end

function Animation:increment()
  self:setFrame(self.curFrameI + 1)
end
function Animation:setFrame(i)
  if i > self.numFrames and not self.looping then
    self.curFrameI = self.numFrames -- NOTE, this might need rethinking
    self.playing = false
  else
    self.curFrameI = ((i-1) % self.numFrames) + 1
  end
  
  self.curFrame = self.frameData[self.curFrameI]
end


function Animation:draw()
  local cf = self.curFrame
  love.graphics.draw(self.texture, cf.quad, self.curFrame.screenPosX, self.curFrame.screenPosY, nil, nil, nil, self.curFrame.pivotX, self.curFrame.pivotY)
end


function Animation:play(loop)
  self.playing = true
  self.looping = loop or false -- Redundant, but clearer
  
  return self -- convenience, can probably remove later
end

function Animation:pause()
  self.playing = false
end

function Animation:stop()
  self.playing = false
  self:setFrame(1)
end


return Animation
