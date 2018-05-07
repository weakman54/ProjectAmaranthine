

local VNSystem = reload("VNSystem")


local stateVN = {}



function stateVN:init()

end

function stateVN:enter(data)
  local scene = buildScene("assets/VN/", 1)
  VNSystem:loadScene(reload("assets/VN/sceneScript01"))
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