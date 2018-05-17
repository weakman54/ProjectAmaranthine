local VNSystem = reload("VNSystem")


local stateVN = {}


local sceneToLoad = "03_0"
local panelToLoad = 7


function stateVN:init()

--    buildScene("assets/VN/", "01_0")  

--  buildScene("assets/VN/", "02_0")
--  buildScene("assets/VN/", "02_1")

--  buildScene("assets/VN/", "03_0")

--  buildScene("assets/VN/", "04_0")
--  buildScene("assets/VN/", "04_1")  

  VNSystem:loadScene(sceneToLoad, panelToLoad)
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
  if key == "r" then
    VNSystem:loadScene(sceneToLoad, panelToLoad)
  else
--    VNSystem:keypressed(key)
  end
end



return stateVN