

local Timer = {}


function Timer:new()
  local obj = {}
  
  setmetatable(obj, self)
  self.__index = self
  
  obj._acc = 0
  
  return obj
end


function Timer:update(dt)
  self._acc = self._acc + dt
end

function Timer:reached(time)
  return self._acc >= time
end

function Timer:before(time)
  return self._acc < time
end

function Timer:between(min, max)
  return self:reached(min) and not self:reached(max)
end

function Timer:reset()
  self._acc = 0
end


return Timer