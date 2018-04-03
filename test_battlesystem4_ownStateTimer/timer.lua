

-- TODO: make persistent to avoid creating new one all the time, needs reset() + pause state

local Timer = {}


function Timer:new()
  local obj = {}
  
  setmetatable(obj, self)
  self.__index = self
  
  obj.acc = 0
  
  return obj
end


function Timer:update(dt)
  self.acc = self.acc + dt
end

function Timer:reached(time)
  return self.acc >= time
end

function Timer:reset()
  self.acc = 0
end


return Timer