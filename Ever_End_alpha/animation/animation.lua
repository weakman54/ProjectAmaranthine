

local Animation = {}


function Animation:new(framerate)
  local obj = {}

  setmetatable(obj, self)
  self.__index = self

  obj._frames = {}
  obj._curFrameI = 1
  obj._curTime = 0
  obj._frameDuration = 0

  obj._playing = false
  obj._looping = false

  obj._name = ""


  obj.dbg_render = false
  
  if framerate then obj:setFramerate(framerate) end
  

  return obj
end



function Animation:update(dt)
  assert(#self._frames > 0      , "Animation:update(): The Animation " .. self._name .. " does not have any frames!") 
  assert(self._frameDuration > 0, "Animation:update(): The Animation " .. self._name .. " does not have a set framerate!")

  if not self._playing then return end


  self._curTime = self._curTime + dt

  if self._curTime >= self._frameDuration then
    self:_increment()
    self._curTime = self._curTime - self._frameDuration -- NOTE: This feels "bad" but it seems like we're losing a lot of time if this is set to 0 every frame...
  end
end


function Animation:loveDraw(...)
  love.graphics.draw(self:_getCurImage(), ...)
  if self.dbg_render then 
    local frame = self:_getCurFrame()
    love.graphics.print("Animation: " .. self._name .. ": " .. self._curFrameI .. ": " .. frame.filename)
  end
end



-- Frame import ---------------
function Animation:_importFrame(resource)
  -- TODO: Better ERROR
  assert(type(resource) == "table"      , "Animation:_importFrame(resource): Animation " .. self._name .. ": resource must be table!")
  assert(resource.data:type() == "Image", "Animation:_importFrame(resource): Animation " .. self._name .. " resource.data must be image!")

  table.insert(self._frames, resource)  
end


-- Frame manipulation functions -----------------
function Animation:_increment()
  self:_setFrameI(self._curFrameI + 1)
end
function Animation:_setFrameI(index)
  assert(index > 0, "Animation:setFrame(): " .. self._name .. ": Tried to set a negative frame index")

  self._curFrameI = index

  if self._curFrameI <= #self._frames then return end -- Within [1, #_frames], no additional fixing needed

  if self._looping then -- Above #_frames
    self._curFrameI = 1

    self:doEvent("looped")

  else
    self._curFrameI = #self._frames -- NOTE: should look at this, might be better to set to 0, or predefined
    self._playing = false -- NOTE: manipulating stuff outside of "setters"

    self:doEvent("ended")
  end
end

function Animation:_getFrame(index) 
  return assert(self._frames[index], "Animation:_getFrame(): " .. self._name .. " tried to index a non-existent frame: " .. index)
end
function Animation:_getCurFrame()
  return self:_getFrame(self._curFrameI)
end

function Animation:_getImage(index)
  return self:_getFrame(index).data
end
function Animation:_getCurImage()
  return self:_getCurFrame().data
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
function Animation:setFramerate(fps)
  self._frameDuration = 1/fps
end


-- NOTE: pretty untested right now!
function Animation:duration()
  return #self._frames * self._frameDuration
end


function Animation:type()
  return "Animation"
end


function Animation:setName(name)
  self._name = name
end



-- Event Callback caller
-- This is it's own function to help make this more generic,
-- overwrite it to work the way you want
function Animation:doEvent(event, ...) 
  self.event = event
end




return Animation



















