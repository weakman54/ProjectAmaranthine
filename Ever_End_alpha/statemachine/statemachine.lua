

local SM = {}


local NULLSTATE = {canSwitch = function() return true end}


function SM:new()
  local obj = setmetatable({}, self)
  self.__index = self


  obj.states = {}
  obj.curState = NULLSTATE


  return obj
end


function SM:update(dt)
  self.curState:update(dt)
end


function SM:add(name, state)  
  self.states[name] = state
  state.name = name

  if not state.canSwitch then
    state.canSwitch = function() return true end -- This is a bit of a hack, but works, so eh
  end

--  if self.curState == NULLSTATE then
--    self:switch(name)
--  end
end

function SM:switch(to, ...)
  local target = self.states[to]
  assert(target, "Statemachine:switch(): State " .. to .. " does not exist in the Statemachine")

  if not target.canSwitch() then return end
  
  
  if self.curState.exit then self.curState:exit() end

  self.curState = self.states[to]

  if self.curState.enter then self.curState:enter(...) end

end


function SM:is(name)
  assert(self.states[name], "State " .. name .. " does not exist!") -- DEBUG
  return self.curState.name == name
end



return SM