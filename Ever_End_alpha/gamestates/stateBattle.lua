
flipHack = false

local vec = require "Vector"
local GUIBar = require "gui.bar"
local RM = require "resourceManager.resourceManager"




local stateBattle = {}


stateBattle.background = nil -- TODO: check if this is useful like this


player = reload("player")


local healthPos = vec(123, 952)
local spPos = vec(207, 990)

-- OLD GUIBar code, not fully revised: vvvvvvvvvvvvvvvvvvvvvvvv
local GUIPlayerHealth = GUIBar:new(vec() , vec(420, 64))
GUIPlayerHealth.outerColor = {255/255, 109/255, 109/255, 0} -- NOTE: setting to same color just in case alpha does not work
GUIPlayerHealth.innerColor = {255/255, 109/255, 109/255}
-- angle -15.8

local GUIPlayerSP     = GUIBar:new(vec() , vec(365, 55))
GUIPlayerSP.outerColor = {153/255, 243/255, 242/255, 0}
GUIPlayerSP.innerColor = {153/255, 243/255, 242/255}
-- angle -8.2


local GUIEnemyHealth  = GUIBar:new(vec(1200, 200), vec(300, 30))
--GUIEnemyHealth.innerColor = {255, 000, 000}
-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

local Gas




function stateBattle:init()
  skipNextFrame = true


  debugPrint("Loading battle...")
  player:initialize()


  RM.prefix = ""

  self.background = RM:loadAnimation("assets/Battle_background/background_")
  self.background.data:setLooping(true)
  self.background.data:play()

  self.playerGUIBase = RM:loadAnimation("assets/GUI/gui_base_")
  self.playerGUIMask = RM:loadAnimation("assets/GUI/gui_mask_")

  self.enemyHealthBox = RM:loadAnimation("assets/GUI/Background_Box_")
  self.enemyHealthBar = RM:loadAnimation("assets/GUI/Enemy_HPbar_")
  
  
    Gas  = RM:loadAnimation("assets/FX/Gas_")
  Gas.data:play()
  Gas.data:setLooping()
end

function stateBattle:enter(prev, enemyString)
  enemy  = reload(enemyString or "enemyQuit1") -- TODO: fix default enemy here...
  enemy:initialize() -- Hack I guess
  skipNextFrame = true
  -- TODO: make reset conditional (or push states, not sure which atm)
  player:reset()
  enemy:reset()

  if enemy.music then Sound:play(enemy.music) end


-- OLD GUIBar code, not fully revised: vvvvvvvvvvvvvvvvvvvvvvvv
  GUIPlayerHealth:setTrackTarget(player, "HP", 0, player.maxHP)
  GUIPlayerSP:setTrackTarget(player, "SP", 0, player.maxSP)

  GUIEnemyHealth:setTrackTarget(enemy, "HP", 0, enemy.maxHP)
  -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
end


local blinkAcc = 0
local blinkSpeed = 1

function stateBattle:update(dt)
  self.background.data:update(dt)

  player:update(dt)
  enemy:update(dt)

  -- Gas hack vvvv
  Gas.data:update(dt)
  -- Gas hack ^^^^^^

  -- OLD GUIBar code, not fully revised: vvvvvvvvvvvvvvvvvvvvvvvv
  GUIPlayerHealth:update(dt)
  GUIPlayerSP:update(dt)

  
  if enemy.name == "Quit2" then
    blinkAcc = blinkAcc + dt
    GUIPlayerSP.innerColor = {1, math.sin(math.pi * blinkAcc * blinkSpeed), 1, 1}
  end

  GUIEnemyHealth:update(dt)
  -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
end

function stateBattle:draw()

  self.background.data:loveDraw(x, y, r, sx, sy, 200, 200)

  local barPos = -2320 * GUIEnemyHealth:getPercent()
  self.enemyHealthBar.data:loveDraw(barPos, y, r, sx, sy, 200, 200)
  self.enemyHealthBox.data:loveDraw(x, y, r, sx, sy, 200, 200)


  -- HACK RESET BELOW
  if flipHack then
    love.graphics.origin()
    love.graphics.scale(-scale.x, scale.y) -- Scale hack
    love.graphics.translate(-1920, 0)
  end



  enemy:draw()
  player:draw()

-- RESET STUFF (?)
  love.graphics.origin()
  love.graphics.scale(scale.x, scale.y) -- Scale hack



  -- Gas hack vvvv
  if enemy.name == "Quit2" then
    Gas.data:loveDraw()
  end
  -- Gas hack ^^^^^^^^^^^^



  self.playerGUIBase.data:loveDraw(x, y, r, sx, sy, 200, 200)

  -- OLD GUIBar code, not fully revised: vvvvvvvvvvvvvvvvvvvvvvvv
  love.graphics.translate(healthPos.x, healthPos.y)
  love.graphics.rotate(-15.8 * math.pi/180)  
  GUIPlayerHealth:loveDraw()


  -- RESET STUFF (?)
  love.graphics.origin()
  love.graphics.scale(scale.x, scale.y) -- Scale hack

  love.graphics.translate(spPos.x, spPos.y)
  love.graphics.rotate(-8.2 * math.pi/180)
  GUIPlayerSP:loveDraw()
  love.graphics.setColor({1, 1, 1, 1})


  love.graphics.origin()
  love.graphics.scale(scale.x, scale.y) -- Scale hack


  self.playerGUIMask.data:loveDraw(x, y, r, sx, sy, 200, 200)

--  GUIEnemyHealth:loveDraw() NOT DRAWIN THIS, just using the percentage capabilities
-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
end

function stateBattle:keypressed(key) -- TODO: move to dbg_keypressed
  if key == "r" then
    enemy:reset()
    player:reset()
  end
end


function stateBattle:leave()
  flipHack = false
end



return stateBattle  