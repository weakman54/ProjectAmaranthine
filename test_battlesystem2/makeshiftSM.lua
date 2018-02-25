
require "strict"

local SM = {}

function SM:new(initialName, initial)
  local obj = {}

  setmetatable(obj, self)
  self.__index = self

  obj.states = initial
  obj._currentStateName = initialName

  return obj
end

function SM:switch(toName)
  local fromName = self._currentStateName
  
  self:_currentState():exit(toName)
  
  self.currentStateName = toName
  
  self:_currentState():enter(fromName)

--  if self._currentStateName == "none" then
--    self._currentStateName = toName 
--    self:_currentState():enter(fromStateName)
--    return tru
--  end

--  if self:canSwitchTo(toName) then
--    self:_currentState():exit(toName)
--    self._currentStateName = toName
--    self:_currentState():enter(fromStateName)
--    return true
--  end
end

function SM:_currentState()
  return self.states[self._currentStateName]
end




function SM:is(stateName)
  return stateName == self._currentStateName
end

function SM:isnot(stateName)
  return stateName ~= self._currentStateName
end

return SM
