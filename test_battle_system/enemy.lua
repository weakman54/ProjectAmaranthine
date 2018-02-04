
local Animation = require "animation"
local AnimationCollection   = require "animationCollection"


local enemy = {}
enemy.animCollection = AnimationCollection:new()


function enemy:update(dt)
  self.animCollection:update(dt)
end

function enemy:draw()
  self.animCollection:draw()
end


function enemy:loadAnimations()
  self.animCollection:addAnimation("idle"  , Animation:new( "animations/enemy_idle"), true)
  self.animCollection:addAnimation("attack", Animation:new( "animations/enemy_attack"))
  self.animCollection:addAnimation("guard" , Animation:new( "animations/enemy_guard"))
end


return enemy