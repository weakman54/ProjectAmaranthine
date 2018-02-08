
local Camera = require "hump.camera"
local vec = require "hump.vector"
local Timer = require "hump.timer"

local WIDTH, HEIGHT = love.graphics.getDimensions()
local DIRS = {w = vec( 0, -1), a = vec(-1,  0), s = vec( 0,  1), d = vec( 1,  0)}


local cam = Camera(0, 0)

local speed = 200
local rotSpeed = math.pi/2

local curTween
local tweenDur = 0.1
local tweenMeth = "in-out-quad"

local bg = love.graphics.newImage("End_attack_00005.png")


function love.load()
  cam.x, cam.y = WIDTH/2, HEIGHT/2
end


function love.update(dt)
  Timer.update(dt)
  
  local modifiedSpeed = speed * dt
  for key, dirVec in pairs(DIRS) do
    if love.keyboard.isDown(key) then
      cam:move((dirVec * modifiedSpeed):unpack())
    end
  end
  
  if love.keyboard.isDown("e") then
    cam:rotate(rotSpeed * dt)
    
  elseif love.keyboard.isDown("q") then
    cam:rotate(-rotSpeed * dt)
  end
end



function love.draw()
  cam:attach()
  
  love.graphics.draw(bg, 0, 0, nil, nil, nil, 200, 200)
  
  cam:detach()
end


function love.mousepressed()
  local target = {}
  
  target.x, target.y = 1277-205, 737-205
  
  if cam.x == target.x then
    target.x = WIDTH/2
    target.y = HEIGHT/2
    
    target.scale = 1
    target.rot = 0
  else
    target.scale = 1/0.75
    target.rot = 12 * (math.pi/180)
  end
  
  if curTween then Timer.cancel(curTween) end
  curTween = Timer.tween(tweenDur, cam, target, tweenMeth)
end


















