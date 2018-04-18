

local enemy = require "enemy"


local stateBattle = {}



function stateBattle:init()
  enemy:initialize()
end

function stateBattle:enter()
end

function stateBattle:leave()
end



function stateBattle:update(dt)
  enemy:update(dt)
end

function stateBattle:draw()
  love.graphics.print("Battle state", 100, 100)
  enemy:draw()
end

function stateBattle:keypressed()
end



return stateBattle  