local SM = {}

local NULLSTATE = {canSwitch = function() return true end, update = function() error("Statemachine: Tried to call update() on NULLSTATE, make sure to switch to an actual state before updating!") end}


function SM:new()
  local obj = setmetatable({}, self)
  self.__index = self


  obj.states = {}
  obj.curState = NULLSTATE


  return obj
end


function SM:update(dt)
  -- TODO: add exists check to make the SM more generic (Actually, maybe even make a generic list of callbacks?)
  self.curState:update(dt)
end

function SM:draw()
  if self.curState.draw then self.curState:draw() end
end


function SM:add(name, state)  
  self.states[name] = state
  state.name = name

  -- TODO: remove this and add to the check in switch to check against this not existing instead
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

  -- TODO: add exists check (non-existing function means true)
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