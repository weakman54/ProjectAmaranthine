local VNSystem = reload("VNSystem")


local stateVN = {}



function stateVN:init()

--  buildScene("assets/VN/", "00_0")  
--  buildScene("assets/VN/", "01_0")  

--  buildScene("assets/VN/", "02_0")
--  buildScene("assets/VN/", "02_1")

--  buildScene("assets/VN/", "03_0")

--  buildScene("assets/VN/", "04_0")
--  buildScene("assets/VN/", "04_1")  
--  buildScene("assets/VN/", "04_2")

  VNSystem:loadScene(dbg_sceneToLoad, dbg_panelToLoad)
end


function stateVN:enter(previous, data)
  if data == "RESETPLZ" then --hack
    VNSystem:loadScene(dbg_sceneToLoad, dbg_panelToLoad)
  end
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



return stateVN