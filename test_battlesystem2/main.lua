
require "strict"


Timer = require"hump.timer"

require "enemy"
require "player"

local Animation = require "animation"
local AC = require "animationCollection"


local background



function love.load(arg)
  if arg[#arg] == "-debug" then require("mobdebug").start() end
--  local dir = "assets"
--  local files = love.filesystem.getDirectoryItems(dir)
--  for i, file in ipairs(files) do
--    print(string.format([[anim:importFrame{
--    image = love.graphics.newImage("assets/%s"),
--    duration = 0.4,
--  }]], file))
--  end

  background = love.graphics.newImage("assets/background.png")


  local anim

  anim = Animation:new()
--  print(Animation, getmetatable(anim))
  enemy.ac:addAnimation("attack_windup", anim)

  anim:importFrame{
    image = love.graphics.newImage("assets/enemy_attack-windup_0001.png"),
    duration = 0.4,
  }


  anim = Animation:new()
  enemy.ac:addAnimation("attack", anim)

  anim:importFrame{
    image = love.graphics.newImage("assets/enemy_attack_0001.png"),
    duration = 0.4,
  }
  anim:importFrame{
    image = love.graphics.newImage("assets/enemy_attack_0002.png"),
    duration = 0.4,
  }


  anim = Animation:new()
  enemy.ac:addAnimation("guard", anim)

  anim:importFrame{
    image = love.graphics.newImage("assets/enemy_guard_0001.png"),
    duration = 0.4,
  }
  anim:importFrame{
    image = love.graphics.newImage("assets/enemy_guard_0002.png"),
    duration = 0.4,
  }
  anim:importFrame{
    image = love.graphics.newImage("assets/enemy_guard_0003.png"),
    duration = 0.4,
  }


  anim = Animation:new()
  enemy.ac:addAnimation("idle", anim)

  anim:importFrame{
    image = love.graphics.newImage("assets/enemy_idle_0001.png"),
    duration = 0.4,
  }
  anim:importFrame{
    image = love.graphics.newImage("assets/enemy_idle_0002.png"),
    duration = 0.4,
  }


  anim = Animation:new()
  player.ac:addAnimation("attack", anim)

  anim:importFrame{
    image = love.graphics.newImage("assets/player_attack_0001.png"),
    duration = 0.4,
  }


  anim = Animation:new()
  player.ac:addAnimation("dodge_high", anim)

  anim:importFrame{
    image = love.graphics.newImage("assets/player_dodge-high_0001.png"),
    duration = 0.4,
  }


  anim = Animation:new()
  player.ac:addAnimation("dodge_low", anim)

  anim:importFrame{
    image = love.graphics.newImage("assets/player_dodge-low_0001.png"),
    duration = 0.4,
  }


  anim = Animation:new()
  player.ac:addAnimation("guard", anim)

  anim:importFrame{
    image = love.graphics.newImage("assets/player_guard_0001.png"),
    duration = 0.4,
  }
  anim:importFrame{
    image = love.graphics.newImage("assets/player_guard_0002.png"),
    duration = 0.4,
  }


  anim = Animation:new()
  player.ac:addAnimation("idle", anim)

  anim:importFrame{
    image = love.graphics.newImage("assets/player_idle_0001.png"),
    duration = 0.4,
  }
  anim:importFrame{
    image = love.graphics.newImage("assets/player_idle_0002.png"),
    duration = 0.4,
  }
  
  
  

  player:setState("idle")
  enemy:setState("idle")
end


function love.update(dt)
  Timer.update(dt)
  
  player:update(dt)
  enemy:update(dt)
end


function love.draw()
  love.graphics.draw(background, nil, nil, nil, nil, nil, 250, 250)
  
  enemy:draw(nil, nil, nil, nil, nil, 250, 250)
  player:draw(nil, nil, nil, nil, nil, 250, 250)
end


function love.keypressed(key)
--  print(key)
  if key == "escape" then love.event.quit() return end

  player:keypressed(key)
end

function love.keyreleased(key)
  player:keyreleased(key)
end