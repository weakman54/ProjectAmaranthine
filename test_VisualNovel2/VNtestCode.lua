local deciding = false

decisionState = function(tableOfChoices)
  deciding = true
  return true
end
--

tableOfChoices = {changeScene, "sceneName",1} 

if input:pressed("heal")






local Choice

function Choice:new()
  local obj = {}
  
  setmetatable(obj, self)
  self.__index = self
  obj._acc = 0
  
  return obj
end



  decisionState = function(tableOfChoices)
    deciding = true
    return true
  end
  --
  
  choice = function(