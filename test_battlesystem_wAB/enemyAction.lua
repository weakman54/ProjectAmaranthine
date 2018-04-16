

local EnemyAction

function EnemyAction:new()
  local obj = {}
  
  setmetatable(obj, self)
  self.__index = self
  
  
  obj._frames = {}
  obj._curFrameI = 1
  obj._curTime = 0
  obj._frameDuration = 0 
  
  obj._stance = "high"
  obj._damage = 2
  obj._blockable = true
  obj._blockDamagePrecent = 20
  obj._feedbackEffect = feedbackEffect:new

  return obj
 end 
 
 function EnemyAction:update(dt)
   local
   
   return
 end