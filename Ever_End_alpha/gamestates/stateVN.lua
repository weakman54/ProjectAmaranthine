

local VNSystem = reload("VNSystem")


local stateVN = {}



function stateVN:init()

end

function stateVN:enter(data)
  local scene = buildScene("assets/VN/", "01_0")
  
  local s1 = reload("assets/VN/sceneScript01_0")
--  local s2 = reload("assets/VN/sceceScript02_0")
  
  VNSystem:loadScene(s1)
end

function stateVN:leave()
end



function stateVN:update(dt)
  VNSystem:update(dt)
end

function stateVN:draw()
  love.graphics.print("VN state", 100, 100)
  VNSystem:draw()
end

function stateVN:keypressed(key)
  VNSystem:keypressed(key)
end



return stateVN