

local VNSystem = reload("VNSystem")


local stateVN = {}



function stateVN:init()
  VNSystem:loadScene("03_0")
end

function stateVN:enter(data)
--  local scene = buildScene("assets/VN/", "01_0")  
--  buildScene("assets/VN/", "03_0")

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