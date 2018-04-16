local Enemy

function Enemy:new()
  local obj = {}
  
  setmetatable(obj, self)
  self.__index = self
  
  
  obj._frames = {}
  obj._curFrameI = 1
  obj._curTime = 0
  obj._frameDuration = 0 
  
  obj._Actions = {} --[[enemyAction, probWeight]]
  obj._stance = "high"
  

  return obj
 end 
 
 function Enemy:update(dt)