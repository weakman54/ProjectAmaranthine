
require "player"
require "enemy"

local vec = require "hump.vector" -- TODO: replace with own lib

local GUIBar = require "guiBar"


local stateBattle = {}


local background
hackground = false


local GUIPlayerHealth = GUIBar:new(vec(300, 900) , vec(300, 30))
GUIPlayerHealth.innerColor = {255, 000, 000}

local GUIPlayerSP     = GUIBar:new(vec(300, 940) , vec(300, 30))
GUIPlayerSP.innerColor = {000, 255, 255}


local GUIEnemyHealth  = GUIBar:new(vec(1200, 200), vec(300, 30))
GUIEnemyHealth.innerColor = {255, 000, 000}


function stateBattle:init()
  love.graphics.clear(000, 000, 000)
  love.graphics.print("Loading...", 100, 100)
  love.graphics.present()

  background = love.graphics.newImage("assets/background.png")

  player:initialize()
  enemy:initialize()
end

function stateBattle:enter()
  player:reset()
  enemy:reset()

  GUIPlayerHealth:setTrackTarget(player, "health", 0, player.maxhealth)
  GUIPlayerSP:setTrackTarget(player, "SP", 0, player.maxSP)

  GUIEnemyHealth:setTrackTarget(enemy, "health", 0, enemy.maxhealth)
end


function stateBattle:update(dt)
  -- SCALE HACK
  scale.x = love.graphics.getWidth()/1920
  scale.y = love.graphics.getHeight()/1080

  player:update(dt)
  enemy:update(dt)

  GUIPlayerHealth:update(dt)
  GUIPlayerSP:update(dt)

  GUIEnemyHealth:update(dt)
end

function stateBattle:draw()
  love.graphics.scale(scale.x,scale.y)

  if not hackground then
    love.graphics.draw(background, nil, nil, nil, nil, nil, 250, 250)
  end


  enemy:draw ()
  player:draw()


  GUIPlayerHealth:loveDraw()
  GUIPlayerSP:loveDraw()

  GUIEnemyHealth:loveDraw()
end


function stateBattle:keypressed(key)
  if key == "r" then
    enemy:reset()
    player:reset()
  end
end


return stateBattle