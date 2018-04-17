

local VNSystem = require "VNSystem"


local stateVN = {}



function stateVN:init()
end

function stateVN:enter(data)
  VNSystem:loadScene(data.scene, data.line)
end

function stateVN:leave()
end



function stateVN:update(dt)
  VNSystem:update(dt)
end

function stateVN:draw()
  love.graphics.print("VN state", 100, 100)
end

function stateVN:keypressed()
end



return stateVN