


local Animation = require "animation.animation"



local AC = {}


function AC:new()
  local obj = setmetatable({}, self)
  self.__index = self


  obj._animations = {}
  obj._curAnim = nil
  obj._curName = nil
  obj._framerate = nil -- ?

  obj._name = ""


  return obj
end


function AC:addAnimation(name, animation)
  do -- Error checking
    assert(type(name) == "string", "AnimationCollection:newAnimation(): " .. self._name .. "; name must be string! is: " .. type(name))
    assert(getmetatable(animation.data) == Animation, "AnimationCollection:newAnimation(): " .. self._name .. "; animation " .. name .. " must be Animation!")

    assert(not self._animations[name], "AnimationCollection:newAnimation(): " .. self._name .. "; Animation " .. name .. " already exists in collection")
  end
  --
  
  self._animations[name] = animation
  
  if self._framerate and self._framerate > 0 then
    animation.data:setFramerate(self._framerate)
  end
  
  if self._name and self._name ~= "" then
    animation.data:setName(self._name .. "_" .. name)
  else
    animation.data:setName(name) -- Maybe not set the name to this if no AC name?
  end
  
  if self._curAnim == nil then
    self:setAnimation(name)
  end
end
--


function AC:checkInCollection(name, f)
  f = f or ""
  assert(type(name) == "string", "AnimationCollection " .. self._name .. ": " .. f .. " name must be string! is: " .. type(name))
  assert(self._animations[name] ~= nil, "AnimationCollection " .. self._name .. ": " .. f .. " Animation " .. name .. " is not in the collection!")
end
--


function AC:setAnimation(name, looping)
  self:checkInCollection(name, "setAnimation()")

  -- Stop currently playing Animation before switching
  -- NOTE: this might not be useful/wanted, needs testing/QA
  if self._curAnim then self._curAnim.data:stop() end
  
  
  self._curName = name
  self._curAnim = self._animations[name]
  self._curAnim.data:play()
  self._curAnim.data:setLooping(looping)
end
  
  
function AC:update(dt)
  self._curAnim.data:update(dt)
end
  
function AC:loveDraw(...)
  self._curAnim.data:loveDraw(...)
end



function AC:has(animation)
  return self._animations[animation] ~= nil
end



-- Proxy functions --------------
function AC:setFramerate(fps)
  self._framerate = fps
  
  for _, animation in pairs(self._animations) do
    animation.data:setFramerate(fps)
  end
end

function AC:pause()
  self._curAnim.data:pause()
end

function AC:play()
  self._curAnim.data:play()
end

function AC:curEvent()
  return self._curAnim.data.event
end

function AC:curFrame()
  return self._curAnim.data._curFrameI
end

function AC:curName()
  return self._curName
end

function AC:curDuration()
  return self._curAnim.data:duration()
end




function AC:getAnimation(name)
  assert(self:has(name), "does not have anim: " .. name)
  return self._animations[name]
end




return AC


















