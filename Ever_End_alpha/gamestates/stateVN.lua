local VNSystem = reload("VNSystem")


local stateVN = {}



function stateVN:init()
  --  buildScene("assets/VN/", "01_0")  
  
--  buildScene("assets/VN/", "02_0")
--  buildScene("assets/VN/", "02_1")
  
  buildScene("assets/VN/", "03_0")
  
--  buildScene("assets/VN/", "04_0")
--  buildScene("assets/VN/", "04_1")  
--  buildScene("assets/VN/", "04_2")



  VNSystem:loadScene("01_0")
end

function stateVN:enter(data)

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