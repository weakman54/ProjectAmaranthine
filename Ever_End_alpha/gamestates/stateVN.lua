

local VNSystem = require "VNSystem"


local stateVN = {}



function stateVN:init()

end

function stateVN:enter(data)
  local dirName = "assets/VN/"
  local dir = love.filesystem.getDirectoryItems(dirName)
  
  local scenedirName = dirName .. lume.filter(dir, function(name) return name:find(string.format("scene%02d", 1)) end)[1]
  
  local scenedir = love.filesystem.getDirectoryItems(scenedirName)
    
  for k, v in ipairs(scenedir) do
    print(v, v:find("p19"))
  end
  
  local panelT = lume.filter(scenedir, function(name) return name:find("p19") end)
  
  for k, v in ipairs(panelT) do
    print(v)
  end
end

function stateVN:leave()
end



function stateVN:update(dt)
--  VNSystem:update(dt)
end

function stateVN:draw()
  love.graphics.print("VN state", 100, 100)
end

function stateVN:keypressed()
end



return stateVN