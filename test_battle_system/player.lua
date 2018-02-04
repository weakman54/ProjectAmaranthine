
local Animation = require "animation"
local AnimationCollection   = require "animationCollection"

local player = {}
player.animCollection = AnimationCollection:new()
player.health = 5


-- TODO: make this proper later
local attackBtn = "space"
local guardBtn = "g"



function player:loadAnimations()
  self.animCollection:addAnimation("idle"  , Animation:new( "animations/player_idle"), true, true)
  self.animCollection:addAnimation("attack", Animation:new( "animations/player_attack"))
  self.animCollection:addAnimation("guard" , Animation:new( "animations/player_guard"))

  self.animCollection:setDefault("idle")
end


function player:takeDamage()
  if self.animCollection.curName ~= "guard" then -- eh... HACK, I guess.. (yeah, I'm getting desensitized at this point...)
    self.health = self.health - 1
  end
end



function player:update(dt)
  if love.keyboard.isDown(guardBtn) then
    self.animCollection:setAnimation("guard", true)
    self.animCollection:setDefault("guard")
    print("¤")
  else
    self.animCollection:setDefault("idle")
--    print("#", self.animCollection.curAnim.looping)
--    self.animCollection.hold = false -- HACK: Implement more proper way to do "hold animation while button is held"
  end

  self.animCollection:update(dt)
end


function player:draw()
  self.animCollection:draw()
  
  if self.dead then
    love.graphics.print("dead", 900, 200)
  else
    love.graphics.print(self.health, 900, 200)
  end
end


function player:attack()
  player.animCollection:setAnimation("attack")
  player.enemy:takeDamage()
end

function player:guard()
--  player.animCollection:setAnimation("guard")
end

function player:idle()
    player.animCollection:setAnimation("idle") -- HACK, remove entire function really...
end






return player