
flipHack = false

local vec = require "hump.vector" -- TODO: replace with own vector
local GUIBar = require "gui.bar"
local RM = require "resourceManager.resourceManager"

local stateBattle = {}


stateBattle.background = nil -- TODO: check if this is useful like this


player = reload("player")
enemy  = reload("enemyQuit3")


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

--  background = love.graphics.newImage("assets/background.png")
  self.background = RM:loadAnimation("assets/Battle_background/background_")
  self.background.data:setLooping(true)
  self.background.data:play()
end

function stateBattle:enter(prev, enemyString)
  enemy  = reload(enemyString or "enemyQuit1")
  enemy:initialize() -- Hack I guess
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



function stateBattle:update(dt)
  self.background.data:update(dt)
  
  player:update(dt)
  enemy:update(dt)

  -- OLD GUIBar code, not fully revised: vvvvvvvvvvvvvvvvvvvvvvvv
  GUIPlayerHealth:update(dt)
  GUIPlayerSP:update(dt)

  GUIEnemyHealth:update(dt)
  -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
end

function stateBattle:draw()
  -- HACK RESET BELOW
  if flipHack then
    love.graphics.origin()
    love.graphics.scale(-scale.x, scale.y) -- Scale hack
    love.graphics.translate(-1920, 0)
  end

  --love.graphics.draw(background, x, y, r, sx, sy, 200, 200)
  self.background.data:loveDraw(x, y, r, sx, sy, 200, 200)

  enemy:draw()
  player:draw()

-- RESET STUFF (?)
  love.graphics.origin()
  love.graphics.scale(scale.x, scale.y) -- Scale hack



  -- OLD GUIBar code, not fully revised: vvvvvvvvvvvvvvvvvvvvvvvv
  GUIPlayerHealth:loveDraw()
  GUIPlayerSP:loveDraw()

  GUIEnemyHealth:loveDraw()
  -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  love.graphics.print("Battle state", 100, 100)

end

function stateBattle:keypressed(key)
  if key == "r" then
    enemy:reset()
    player:reset()
  end
end


function stateBattle:leave()
  flipHack = false
end



return stateBattle  