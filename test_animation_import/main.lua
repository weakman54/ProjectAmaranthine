
local Animation = require "animation"
local AnimationCollection   = require "animationCollection"


local background
local playerAnim
local enemyAnim


local attackBtn = "space"

local guardBtn = "g"



function love.load(arg)
  if arg[#arg] == "-debug" then require("mobdebug").start() end

  background = love.graphics.newImage("animations/battle background.png")

  playerAnim = AnimationCollection:new()

  playerAnim:addAnimation("idle"  , Animation:new( "animations/player_idle"), true)
  playerAnim:addAnimation("attack", Animation:new( "animations/player_attack"))
  playerAnim:addAnimation("guard" , Animation:new( "animations/player_guard"))
  
  
  enemyAnim = AnimationCollection:new()
  
  enemyAnim:addAnimation("idle"  , Animation:new( "animations/enemy_idle"), true)
  enemyAnim:addAnimation("attack", Animation:new( "animations/enemy_attack"))
  enemyAnim:addAnimation("guard" , Animation:new( "animations/enemy_guard"))

end

function love.update(dt)
  playerAnim:update(dt)
  enemyAnim:update(dt)
end

function love.draw()
  love.graphics.draw(background, -250, -250) 
  
  enemyAnim:draw()
  playerAnim:draw()
end



function love.keypressed(key)
  if key == "escape" then
    love.event.quit()

  elseif key == attackBtn then
    playerAnim:setAnimation("attack")
    enemyAnim:setAnimation("guard")

  elseif key == guardBtn then
    playerAnim:setAnimation("guard")
    enemyAnim:setAnimation("attack")

  else
    playerAnim:setAnimation("idle")
    enemyAnim:setAnimation("idle")

  end
end