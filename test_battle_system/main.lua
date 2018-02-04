
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

  love.graphics.setNewFont(30)

  -- Background -----------
  background = love.graphics.newImage("animations/battle background.png")

  -- Enemy ------------------
  table.insert(updating, enemy)
  table.insert(drawing , enemy)
  enemy:loadAnimations()
  enemy.enemy = player

  -- Player -----------------
  table.insert(updating, player)
  table.insert(drawing , player)
  player:loadAnimations()
  player.enemy = enemy
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
    player:attack()

  elseif key == guardBtn then
    player:guard()

  end
end


function love.keyreleased(key)
  if key == guardBtn then
    player:idle()
  end
end
