
flipHack = false

local vec = require "hump.vector" -- TODO: replace with own vector
local GUIBar = require "gui.bar"


local stateBattle = {}


local background -- TODO: check if this is useful like this


-- OLD GUIBar code, not fully revised: vvvvvvvvvvvvvvvvvvvvvvvv
local GUIPlayerHealth = GUIBar:new(vec(300, 900) , vec(300, 30))
GUIPlayerHealth.innerColor = {255, 000, 000}

local GUIPlayerSP     = GUIBar:new(vec(300, 940) , vec(300, 30))
GUIPlayerSP.innerColor = {000, 255, 255}


local GUIEnemyHealth  = GUIBar:new(vec(1200, 200), vec(300, 30))
GUIEnemyHealth.innerColor = {255, 000, 000}
-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

local reloaded = true


function stateBattle:init()
  reloaded = true

  debugPrint("Loading battle...")
  player:initialize()
  enemy:initialize()

  background = love.graphics.newImage("assets/background.png")
  loading = false
end

function stateBattle:enter()
  reloaded = true
  -- TODO: make reset conditional (or push states, not sure which atm)
  player:reset()
  enemy:reset()


-- OLD GUIBar code, not fully revised: vvvvvvvvvvvvvvvvvvvvvvvv
  GUIPlayerHealth:setTrackTarget(player, "HP", 0, player.maxHP)
  GUIPlayerSP:setTrackTarget(player, "SP", 0, player.maxSP)

  GUIEnemyHealth:setTrackTarget(enemy, "HP", 0, enemy.maxHP)
  -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
end

function stateBattle:leave()
end



function stateBattle:update(dt)
  player:update(dt)
  enemy:update(dt)

  -- OLD GUIBar code, not fully revised: vvvvvvvvvvvvvvvvvvvvvvvv
  GUIPlayerHealth:update(dt)
  GUIPlayerSP:update(dt)

  GUIEnemyHealth:update(dt)
  -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
end

function stateBattle:draw()
  love.graphics.draw(background, x, y, r, sx, sy, 200, 200)
  love.graphics.print("Battle state", 100, 100)


  enemy:draw()
  player:draw()


  -- OLD GUIBar code, not fully revised: vvvvvvvvvvvvvvvvvvvvvvvv
  GUIPlayerHealth:loveDraw()
  GUIPlayerSP:loveDraw()

  GUIEnemyHealth:loveDraw()
  -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
end

function stateBattle:keypressed()
end



return stateBattle  