
local sm = player.sm
local ac = player.ac

return {
  enter = function(self, data)
    self.stance = data.stance
    self.timing = data.timing
    
    ac:setAnimation("dodge_" .. self.stance .. "_" .. self.timing)
    
    self.timer = Timer:new()
  end,

  update = function(self, dt)
    self.timer:update(dt)
    
    if self.timer:reached(player.dodgeDuration) the
  end,
}