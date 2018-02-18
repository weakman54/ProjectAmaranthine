
require "strict"

local Animation = require "Animation"
local AnimationCollection = require "AnimationCollection"

gText = {}
local AnimColl


function love.load(arg)
  if arg[#arg] == "-debug" then require("mobdebug").start() end -- Zerobrane debugging


  local myAnim = Animation:new()
  myAnim:importFrame{
    image = love.graphics.newImage("assets/frame_0000.png"),
    duration = 0.4,
  }
  myAnim:importFrame{
    image = love.graphics.newImage("assets/frame_0001.png"),
    duration = 0.4,
  }
  myAnim:importFrame{
    image = love.graphics.newImage("assets/frame_0002.png"),
    duration = 0.4,
  }
  myAnim:importFrame{
    image = love.graphics.newImage("assets/frame_0003.png"),
    duration = 0.4,
  }

  AnimColl = AnimationCollection:new()
  AnimColl:addAnimation("Attack", myAnim)
end


function love.update(dt)
  AnimColl:update(dt)
end


function love.draw()
  love.graphics.setColor(255, 255, 255)
--  love.graphics.draw(x, y, r, sx, sy, ox, oy, kx, ky)
  AnimColl:loveDraw(nil, nil, nil, nil, nil, 200, 200)

  for i, text in ipairs(gText) do
    love.graphics.setColor(255, 0, 255)
    love.graphics.print(text, 20, 15 * i)
  end
end



function love.keypressed(key)
  if key == "escape" then
    love.event.quit()

--  elseif key == "" then


--  elseif key == "l" then
--    myAnim:setLooping(not myAnim._looping)

--  elseif key == "space" then
--    myAnim:togglePlaying()

--  elseif key == "s" then
--    myAnim:stop()
    
--  elseif key == "r" then
--    myAnim:play(1)

  end
end















