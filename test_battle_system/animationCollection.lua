
local Animation = require "animation"
local AC = {}

function AC:new()
  obj = {}
  
  setmetatable(obj, self)
  self.__index = self
  
  obj.curAnim = nil
  obj.animations = {}
  
  return obj
end

function AC:addAnimation(name, animation, setAsCurrent)
  do -- Error checking, name is string, animation is Animation, name not already in collection
    assert(type(name) == "string", "AnimationCollection:newAnimation(): name must be string!")
    assert(getmetatable(animation) == Animation, "AnimationCollection:newAnimation(): animation must be Animation!")
  
    if self.animations[name] then
      error("Animation already exists in collection")
      --return nil, "Animation already exists" -- Error?
    end 
  end
  --

  self.animations[name] = animation
  
  if setAsCurrent or self.curAnim == nil then
    self.curAnim = animation
  end
end


function AC:setAnimation(name, looping)
  if self.animations[name] == nil then
    error("name does not refer to an animation in the collection!")
  end
  
  self.curAnim:stop() -- NOTE: this might actually be better to not have here, double check when doing QA on animation switching
  self.curAnim = self.animations[name]:play()
  self.curAnim.looping = looping or false
end


function AC:update(dt)
  self.curAnim:update(dt)
end

function AC:draw()
  self.curAnim:draw()
end


return AC