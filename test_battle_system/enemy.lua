
local Animation = require "animation"
local AnimationCollection   = require "animationCollection"


local enemy = {}
enemy.animCollection = AnimationCollection:new()
enemy.health = 5

enemy.attackCurrentTime = 0 -- (s)
enemy.attackTargetTime = 3 -- (s)
enemy.lastAttackFrameI = 0

function enemy:update(dt)
  if self.animCollection.curName ~= "attack" then
    self.attackCurrentTime = self.attackCurrentTime + dt
  end
  
  if self.animCollection.curName == "attack" then -- EUGH
    if self.animCollection.curAnim.curFrameI == 3 and self.lastAttackFrameI ~= 3 then -- pmgetfbbqwhatthehellisheregoingon!!?!?!?!???!111?!?++ 
      self.enemy:takeDamage()
    end
    self.lastAttackFrameI = self.animCollection.curAnim.curFrameI
  end
      
  if self.attackCurrentTime >= self.attackTargetTime then
    self:attack()
  end
  
  self.animCollection:update(dt)
end

function enemy:draw()
  self.animCollection:draw()
  
  if self.dead then
    love.graphics.print("dead", 1600, 400)
  else
    love.graphics.print(self.health, 1600, 400)
  end
end


function enemy:takeDamage()
  
--  print(self.animCollection.curName)
  
  if self.animCollection.curName == "attack" then -- HACK!
    if self.animCollection.curAnim.curFrameI >= 3 then -- BLEUGHHARHEFH
      return
    elseif self.animCollection.curAnim.curFrameI == 2 then -- HAAAAACKKKALKAK
      self.health = self.health - 3
    else
      self.health = self.health - 1
    end
    
    self.animCollection:setAnimation("idle")
  else
    self:block()
    return
  end
  
  if self.health <= 0 then
    self.dead = true
  end
end


function enemy:block()
  self.animCollection:setAnimation("guard")
  self.attackCurrentTime = 0
end

function enemy:attack()
  self.attackCurrentTime = 0
  
  self.animCollection:setAnimation("attack")
end



function enemy:loadAnimations()
  self.animCollection:addAnimation("idle"  , Animation:new( "animations/enemy_idle"), true)
  self.animCollection:addAnimation("attack", Animation:new( "animations/enemy_attack"))
  self.animCollection:addAnimation("guard" , Animation:new( "animations/enemy_guard"))
  
  self.animCollection:setDefault("idle")
end


return enemy