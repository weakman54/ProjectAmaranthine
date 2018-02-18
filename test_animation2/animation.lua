
require "strict"

local Animation = {}


function Animation:new()
  local obj = {}

  setmetatable(obj, self)
  self.__index = self

  obj._frames = {}
  obj._curFrameI = 1
  obj._curTime = 0
  obj.frameDuration = 0 -- This needs to be reworked, but I'll keep this as "accessible" for now

  obj._playing = false
  obj._looping = false

  return obj
end


function Animation:update(dt)
  assert(#self._frames > 0, "Animation:update(): The animation does not have any frames!") -- Is this needed?
  if not self._playing then return end

  self._curTime = self._curTime + dt


  -- A bit of a hack, but keeps it generic, could probably be handled better though
  local curFrame = self:_getCurFrame()
  if curFrame.duration then self.frameDuration = curFrame.duration end 
  --------


  if self._curTime >= self.frameDuration then
    self:_increment()
    self._curTime = 0 -- This needs looking at, should it be _curTime = _curTime - frameDuration?
  end
end


-- Frame manipulation functions
function Animation:_increment()
  self:_setFrameI(self._curFrameI + 1)
end
function Animation:_setFrameI(index)
  assert(index > 0, "Animation:setFrame(): Tried to set a negative frame index")

  self._curFrameI = index

  if self._curFrameI <= #self._frames then return end -- Within [1, #_frames], no additional fixing needed

  if self._looping then -- (And above #_frames)
    self._curFrameI = 1

    self:doEvent("looped")

  else
    self._curFrameI = #self._frames -- NOTE: should look at this, might be better to set to 0, or predefined
    self._playing = false -- NOTE: manipulating stuff outside of "setters"

    self:doEvent("ended")
  end
end

function Animation:_getFrame(index) 
  return assert(self._frames[index], "Animation:_getFrame(): tried to index a non-existent frame")
end
function Animation:_getCurFrame()
  return self:_getFrame(self._curFrameI)
end

function Animation:_getImage(index)
  return self:_getFrame(index).image
end
function Animation:_getCurImage()
  return self:_getCurFrame().image
end



-- Controls -----------------------------------------------------
function Animation:play(from)
  if from then
    self:_setFrameI(from)
    self._curTime = 0 -- NOTE: this might need changing
  end
  
  self._playing = true

  self:doEvent("played", from or self._curFrameI)

  return self -- enables "chaining", for example: foo:play():setLooping()
end
function Animation:pause()
  self._playing = false
--  self._curTime = 0 -- Should this be here?

  self:doEvent("paused")

  return self
end
function Animation:stop()
  self._playing = false
  self._curTime = 0
  self._curFrameI = 1

  self:doEvent("stopped")

  return self
end

function Animation:togglePlaying()
  if self._playing then
    self:pause()

  else
    self:play()
  end
end


function Animation:setLooping(value)
  if value == nil then value = true end
  
  self._looping = value

  return self
end


-- other stuff ---------------------------
function Animation:importFrame(frame)
  assert(type(frame) == "table", "Animation:importFrame(): frame must be a <table>!")
  assert(frame.image, "Animation:importFrame(): frame.image must exist!") 
  -- TODO: additional checks?

  table.insert(self._frames, frame)
  -- TODO: initialization?
end


function Animation:loveDraw(...)
  love.graphics.draw(self:_getCurImage(), ...)
end



-- Event Callback caller
-- This is it's own function to help make this more generic,
-- overwrite it to work the way you want
function Animation:doEvent(event, ...)
  
--  local thing = {...} 
--  thing = thing[1] or ""
--  table.insert(gText, event .. " " .. thing) -- Vararg hack atm, temporary anyway
end



return Animation