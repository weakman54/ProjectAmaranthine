local VNSystem = reload("VNSystem")


local stateVN = {}


local sceneToLoad = "02_1"
local panelToLoad = 1

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
--  Sound:muteMusic()
end



function stateVN:update(dt)
  VNSystem:update(dt)
end

function stateVN:draw()
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