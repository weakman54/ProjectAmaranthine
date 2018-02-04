
local Animation = require "animation"
local AnimationCollection   = require "animationCollection"

local player = require "player"
local enemy  = require "enemy"


local updating = {}
local drawing  = {}


local background


local attackBtn = "space"
local guardBtn = "g"



function love.load(arg)
  if arg[#arg] == "-debug" then require("mobdebug").start() end

  -- Background -----------
  background = love.graphics.newImage("animations/battle background.png")

  -- Player -----------------
  table.insert(updating, player)
  table.insert(drawing , player)
  player:loadAnimations()
  
  -- Enemy ------------------
  table.insert(updating, enemy)
  table.insert(drawing , enemy)
  enemy:loadAnimations()
end


function love.update(dt)
  for _, thing in ipairs(updating) do
    thing:update(dt)
  end
end


function love.draw()
  love.graphics.draw(background, -250, -250) 
  
  for _, thing in ipairs(drawing) do
    thing:draw()
  end
end



function love.keypressed(key)
  if key == "escape" then
    love.event.quit()

  elseif key == attackBtn then
    player.animCollection:setAnimation("attack")

  elseif key == guardBtn then
    player.animCollection:setAnimation("guard")

  else
    player.animCollection:setAnimation("idle")

  end
end