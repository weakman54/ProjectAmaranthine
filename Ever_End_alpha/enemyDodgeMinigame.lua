
local sm = enemy.sm
local ac = enemy.ac

return {
  enter = function(self)
    ac:pause()
  end,

  update = function(self, dt)
  end,

  exit = function (self)
    ac:play()
  end,
}