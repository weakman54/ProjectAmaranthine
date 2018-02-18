
local SM = {}

function SM:new()
  local obj = {}
  
  setmetatable(obj, self)
  self.__index = self
  
  obj.states = {}
  obj.currentState = ""
  
  return obj
end

function SM:switch(to)
  if self.currentState == "" then self.currentState = to return true end
  if to == self.currentState then return false end
  
  if self.states[self.currentState][to] then
    self.currentState = to
    return true
  end
  
  return false
end

return SM
  