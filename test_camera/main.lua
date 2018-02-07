
local Camera = require "hump.camera"
local vec = require "hump.vector"
local Timer = require "hump.timer"

local WIDTH, HEIGHT = love.graphics.getDimensions()
local DIRS = {w = vec( 0, -1), a = vec(-1,  0), s = vec( 0,  1), d = vec( 1,  0)}


local randRects = {}
local cam = Camera(0, 0)

local speed = 200
local rotSpeed = math.pi/2


local tweenDur = 0.1
local tweenMeth = "in-out-quad"


function love.load()
  cam.x, cam.y = WIDTH/2, HEIGHT/2
  
--  Timer.tween(tweenDur, cam, {x = WIDTH/2  + 100, y = HEIGHT/2 + 100} , tweenMeth)
--  Timer.tween(tweenDur, cam.y, , tweenMeth)
  
  for i=1, 100 do
    table.insert(randRects, {"fill", math.random(0-100, WIDTH-100), math.random(0-100, HEIGHT-100), math.random(10, 100), math.random(10, 100)})
    randRects[#randRects].color = {math.random(1, 255), math.random(1, 255), math.random(1, 255)}
  end
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
  
  for _, rect in ipairs(randRects) do
    love.graphics.setColor(rect.color)
    love.graphics.rectangle(unpack(rect))
  end
  
  cam:detach()
end


function love.mousepressed()
  local target = {}
  target.x, target.y = cam:mousePosition()
  
  Timer.tween(tweenDur, cam, target, tweenMeth)
end


















