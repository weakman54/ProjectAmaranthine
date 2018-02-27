
local stateBattle = {}

local background

function stateBattle:init()
  background = love.graphics.newImage("assets/background.png")
end

function stateBattle:enter()
end


function stateBattle:update(dt)
  player:update(dt)
  enemy:update(dt)
end

function stateBattle:draw()
  love.graphics.draw(background, nil, nil, nil, nil, nil, 250, 250)

  enemy:draw(nil, nil, nil, nil, nil, 250, 250)
  player:draw(nil, nil, nil, nil, nil, 250, 250)
end

function stateBattle:keypressed(key)
  player:keypressed(key)
end

function stateBattle:keyreleased(key)
  player:keyreleased(key)
end


return stateBattle