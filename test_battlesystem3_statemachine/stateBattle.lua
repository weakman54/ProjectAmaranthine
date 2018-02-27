
local vec = require "hump.vector" -- TODO: replace with own lib

local GUIBar = require "guiBar"


local stateBattle = {}


local background

local GUIPlayerHealth = GUIBar:new(vec(300, 900), vec(300, 30))
local GUIEnemyHealth  = GUIBar:new(vec(1200, 200), vec(300, 30))


function stateBattle:init()
  background = love.graphics.newImage("assets/background.png")
end

function stateBattle:enter()
  GUIPlayerHealth:setTrackTarget(player, "health", 0, player.maxhealth)
  GUIEnemyHealth:setTrackTarget(enemy, "health", 0, enemy.maxhealth)
end


function stateBattle:update(dt)
  player:update(dt)
  enemy:update(dt)

  GUIPlayerHealth:update(dt)
  GUIEnemyHealth:update(dt)
end

function stateBattle:draw()
  love.graphics.draw(background, nil, nil, nil, nil, nil, 250, 250)

  enemy:draw (nil, nil, nil, nil, nil, 250, 250)
  player:draw(nil, nil, nil, nil, nil, 250, 250)

  GUIPlayerHealth:loveDraw()
  GUIEnemyHealth:loveDraw()
end

function stateBattle:keypressed(key)
  player:keypressed(key)
end

function stateBattle:keyreleased(key)
  player:keyreleased(key)
end


return stateBattle