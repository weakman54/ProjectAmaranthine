
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
  -- These were used to refer to these things, which is useful info, but made it into closures instead, which is "cleaner"
  -- However, having this info available is probably not a bad idea
  -- Maybe add them as underscore vars?
--  state.parent = self 
--  state.owner = self.owner

  self.states[name] = state
  state.name = name
  
  if not state.canSwitch then
    state.canSwitch = function() return true end -- This is a bit of a hack, but works, so eh
  end
  
  if self.curState == nil then
    self:switch(name)
  end
end


function SM:switch(to)
  local target = self.states[to]
  assert(target, "State " .. to .. " not implemented!") -- DEBUG
  if target and target.canSwitch() then
    
    if self.curState and self.curState.exit then
      self.curState:exit()
    end

    self.curState = self.states[to]
    self.curState:enter()
  end
end


function SM:is(name)
  assert(self.states[name], "State " .. name .. " does not exist!") -- DEBUG
  return self.curState.name == name
end



return SM