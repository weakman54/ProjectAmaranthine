
local Animation = require "animation"
local AnimationCollection   = require "animationCollection"

local player = {}
player.animCollection = AnimationCollection:new()


function player:update(dt)
  self.animCollection:update(dt)
end

function player:draw()
  self.animCollection:draw()
end



function player:loadAnimations()
  self.animCollection:addAnimation("idle"  , Animation:new( "animations/player_idle"), true)
  self.animCollection:addAnimation("attack", Animation:new( "animations/player_attack"))
  self.animCollection:addAnimation("guard" , Animation:new( "animations/player_guard"))
end


return player