

local Animation = require "animation"


local AC = {}


function AC:new()
  local obj = {}
  setmetatable(obj, self)
  self.__index = self
  
  obj.animations = {}
  
  obj.curAnim = nil
  obj.curName = nil
  
  obj.name = ""
  
  return obj
end


function AC:addAnimation(name, animation, setAsCurrent, looping)
  do -- Error checking, name is string, animation is Animation, name not already in collection
    assert(type(name) == "string", "AnimationCollection:newAnimation(): name must be string!")
    assert(getmetatable(animation) == Animation, "AnimationCollection:newAnimation(): animation must be Animation!")

    assert(not self.animations[name], "Animation already exists in collection")
    --return nil, "Animation already exists" -- Error?
  end 
  --

  self.animations[name] = animation
  animation.name = self.name .. "_" .. name

  if setAsCurrent or self.curAnim == nil then
    self:setAnimation(name, looping)
  end
end


function AC:setAnimation(name, looping)
  self:checkInCollection(name)
  
  if name == self.curName then -- This animation is already playing, don't change (NOTE: not thought through)
    self.curAnim.looping = looping or false -- redundant but clear (Also not thought through, tired, probably hacky)
    return
  end

  -- TODO: maybe make a NULL Animation
  if self.curAnim then self.curAnim:stop() end-- NOTE: this might actually be better to not have here, double check when doing QA on animation switching
  
  self.curName = name
  self.curAnim = self.animations[self.curName]
  
  self.curAnim = self.animations[name]
  self.curAnim:play():setLooping(looping)
end


function AC:checkInCollection(name)
  assert(type(name) == "string", "AnimationCollection: name must be string!")
  assert(self.animations[name] ~= nil, "AnimationCollection: Animation " .. name .. " is not in the collection!")
end


function AC:update(dt)
  self.curAnim:update(dt)
end
  
function AC:loveDraw(...)
  self.curAnim:loveDraw(...)
end



function AC:has(animation)
  return self.animations[animation] ~= nil
end



-- Other stuff
function AC:overrideDoEvent(newFunc)
  for name, animation in pairs(self.animations) do
    animation.doEvent = newFunc
  end
end


return AC






