

local RM = require "resourceManager.resourceManager"


local stateMain = {}


local logo


function stateMain:init()
  RM.prefix = ""
  logo = RM:loadImage("assets/EveREnd logo.png")
end

function stateMain:enter()
end

function stateMain:leave()
end



function stateMain:update(dt)
end

function stateMain:draw()
  love.graphics.draw(logo.data, 0, -200)
  
  love.graphics.printf("press space to start, escape to exit\nr - start battlesystem", 0, H - 100, W, 'center')
end

function stateMain:keypressed(key, scancode, isrepeat)
  if key == "space" then
    Gamestate.switch(stateVN)

  elseif key == "r" then
    Gamestate.switch(stateBattle)
    
  end
end



return stateMain