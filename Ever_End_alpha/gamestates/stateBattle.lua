

local vec = require "Vector"
local GUIBar = require "gui.bar"



local stateBattle = {}


player = reload("player") -- NOTE: player needs to reload here atm since it's being reloaded as part of stateBattle
-- TODO: can be cleaned up probably...


local healthPos = vec(123, 952)
local spPos = vec(207, 990)


-- OLD GUIBar code, not fully revised: vvvvvvvvvvvvvvvvvvvvvvvv
local GUIPlayerHealth = GUIBar:new(vec() , vec(420, 64))
GUIPlayerHealth.outerColor = {255/255, 109/255, 109/255, 0} -- NOTE: setting to same color as inner just in case alpha does not work
GUIPlayerHealth.innerColor = {255/255, 109/255, 109/255}
-- angle -15.8

local GUIPlayerSP     = GUIBar:new(vec() , vec(365, 55))
GUIPlayerSP.outerColor = {153/255, 243/255, 242/255, 0}
GUIPlayerSP.innerColor = {153/255, 243/255, 242/255}
-- angle -8.2


local GUIEnemyHealth  = GUIBar:new(vec(1200, 200), vec(300, 30))
--GUIEnemyHealth.innerColor = {255, 000, 000}
-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


-- Used for the gas in Quit2 battle, bit of a HACK atm...
local Gas



function stateBattle:loadAssets()
  local RM = require "resourceManager.resourceManager"
  
  skipNextFrame = true
  RM.prefix = ""

  self.background = RM:loadAnimation("assets/Battle_background/background_")
  self.background.data:setLooping(true)
  self.background.data:play()

  self.playerGUIBase = RM:loadAnimation("assets/GUI/gui_base_")
  self.playerGUIMask = RM:loadAnimation("assets/GUI/gui_mask_")

  self.enemyHealthBox = RM:loadAnimation("assets/GUI/Background_Box_")
  self.enemyHealthBar = RM:loadAnimation("assets/GUI/Enemy_HPbar_")


  -- QUIT2 Gas (HACKish)
  Gas  = RM:loadAnimation("assets/FX/Gas_")
  Gas.data:play()
  Gas.data:setLooping()
end





function stateBattle:init()
  debugPrint("Loading battle...")
  player:initialize()

  self:loadAssets()
end


function stateBattle:enter(prev, enemyString)
  flipHack = false


  enemy  = reload(enemyString or "enemyQuit1") -- TODO: fix default enemy here...
  enemy:initialize() -- Hack I guess

  if enemy.music then Sound:play(enemy.music) end



  -- TODO: make reset conditional (or push states, not sure which atm) (why?)
  player:reset()
  enemy:reset()


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


  -- OLD GUIBar code, not fully revised: vvvvvvvvvvvvvvvvvvvvvvvv
  GUIPlayerHealth:update(dt)
  GUIPlayerSP:update(dt)


  GUIEnemyHealth:update(dt)


  -- Quit2 HACK
  if enemy.name == "Quit2" then 
    blinkAcc = blinkAcc + dt
    GUIPlayerSP.innerColor = {1, math.sin(math.pi * blinkAcc * blinkSpeed), 1, 1}

    Gas.data:update(dt)

  else
    GUIPlayerSP.innerColor = {153/255, 243/255, 242/255}

  end
  -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
end




function stateBattle:draw()
  self.background.data:loveDraw(x, y, r, sx, sy, 200, 200)


  local barPos = -2320 * GUIEnemyHealth:getPercent()
  self.enemyHealthBar.data:loveDraw(barPos, y, r, sx, sy, 200, 200)
  self.enemyHealthBox.data:loveDraw(x, y, r, sx, sy, 200, 200)


  -- FlipHACK vvvvvvvv
  if flipHack then
    love.graphics.origin()
    love.graphics.scale(-scale.x, scale.y) -- Scale hack
    love.graphics.translate(-1920, 0)
  end


  enemy:draw()
  player:draw()


  love.graphics.origin()
  love.graphics.scale(scale.x, scale.y) -- Scale hack
  -- FlipHACK ^^^^^^^^^^^^


  -- Quit2 Hack
  if enemy.name == "Quit2" then
    Gas.data:loveDraw()
  end



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

  -- Reset
  love.graphics.origin()
  love.graphics.scale(scale.x, scale.y) -- Scale hack



  self.playerGUIMask.data:loveDraw(x, y, r, sx, sy, 200, 200)

--  GUIEnemyHealth:loveDraw() NOTE: this is not drawn, just using the percentage capabilities
-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
end



function stateBattle:leave()
  flipHack = false
end



return stateBattle  


