

local Animation = require "animation"
local AC = require "animationCollection"


local battle = {}

battle.player = {
  state = "idle",
  ac = AC:new()
}
battle.opponent = {
  state = "idle",
  ac = AC:new()
}



return battle