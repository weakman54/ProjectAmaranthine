


local stateMain = {}



function stateMain:init()
end

function stateMain:enter()
end

function stateMain:leave()
end



function stateMain:update(dt)
end

function stateMain:draw()
  love.graphics.print("Main state", 100, 100)
end

function stateMain:keypressed()
end



return stateMain