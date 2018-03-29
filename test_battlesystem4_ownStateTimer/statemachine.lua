
local SM = {}


function SM:new()
  local obj = {}

  setmetatable(obj, self)
  self.__index = self


  obj.states = {}
  obj.curState = nil


  return obj
end


function SM:update(dt)
  self.curState:update(dt)
end


function SM:add(name, state)
  state.parent = self
  state.owner = self.owner
  self.states[name] = state
  
  if self.curState == nil then
    self:switch(name)
  end
end


function SM:switch(to)
  if self.states[to] then

    self.curState = self.states[to]
    self.curState:enter()
  end
end



return SM