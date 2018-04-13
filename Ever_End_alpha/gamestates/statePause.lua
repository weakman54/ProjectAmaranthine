


local statePause = {}



function statePause:init()
end

function statePause:enter()
end

function statePause:leave()
end



function statePause:update(dt)
end

function statePause:draw()
  love.graphics.print("Pause state", 100, 100)
end

function statePause:keypressed()
end



return statePause