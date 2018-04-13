
local Timer = {}


function Timer:new()
  local obj = {}

  setmetatable(obj, self)
  self.__index = self

  obj:reset()

  return obj
end

function Timer:reset() -- NOTE that these two are different, not sure if this is good idea or not but eh...
  self._paused = false
  self._acc = 0
end
function Timer:stop()
  self._paused = true
  self._acc = 0
end

function Timer:start()
  self._paused = false
end
function Timer:pause()
  self._paused = true
end


function Timer:update(dt)
  if not self._paused then
    self._acc = self._acc + dt
  end
end


function Timer:reached(time)
  return self._acc >= time
end

function Timer:between(min, max)
  return self._acc >= min and self._acc <= max
end


return Timer