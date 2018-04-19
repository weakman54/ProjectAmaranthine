

local player = require "player"
local enemy = require "enemy"


local stateBattle = {}


local background -- TODO: check if this is useful like this



function stateBattle:init()
  player:initialize()
  enemy:initialize()
  
  background = love.graphics.newImage("assets/background.png")
end

function stateBattle:enter()
end

function stateBattle:leave()
end



function stateBattle:update(dt)
  player:update(dt)
  enemy:update(dt)
end

function stateBattle:draw()
  love.graphics.draw(background, x, y, r, sx, sy, 200, 200)
  love.graphics.print("Battle state", 100, 100)
  enemy:draw()
  player:draw()
end

function stateBattle:keypressed()
end



return stateBattle  