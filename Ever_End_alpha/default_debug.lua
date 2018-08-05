

dbg_debugEnabled = false


if dbg_debugEnabled then
--require("mobdebug").start() -- Run this line if debug mode should be enabled (only in zerobrane)
end


dbg_openConsole = false and dbg_debugEnabled


dbg_sceneToLoad = "00_0"
dbg_panelToLoad = 1

dbg_skipMainMenu = false



dbg_dtMultiplier = 1
dbg_dtSlowFactor = .5
dbg_dtFastFactor = 200
dbg_renderDtMultiplier = true and dbg_debugEnabled



-- Battle state stuff ---------
function dbg_battleResetStats()
  if not player or not enemy then return end

  enemy:reset()
  player:reset()
end

function dbg_battleResetAnimations()
  if not player or not enemy then return end

  if player.sm then
    player.sm:switch("idle")
  end

  if enemy.sm then
    enemy.sm:switch("idle")
  end
end


function dbg_VNResetToSetting()
  if not VNSystem then return end
  VNSystem:loadScene(dbg_sceneToLoad, dbg_panelToLoad)
end



function dbg_resetVNOrBattle()
  if Gamestate.current() == stateBattle then
    dbg_battleResetStats()
    dbg_battleResetAnimations()

  elseif Gamestate.current() == stateVN then
    dbg_VNResetToSetting()
  end
end




-- NOTE: Comment out functions that should not run, all functions prefixed with dbg_ _should_ be checked for existance before trying to run
-- Preload stuff
dbg_loadOnlyEssentials = true and dbg_debugEnabled

dbg_doNotLoadSound = false and dbg_debugEnabled


-- Debug draw stuff ----
function dbg_draw()
  love.graphics.setColor(1, 0.75, 1, 0.75)
  love.graphics.print("Debug Mode (toggle with 0)", x, 50)


  if dbg_renderAnimationFrames then   dbg_renderAnimationFrames()    end
  if dbg_renderInputTimers then dbg_renderInputTimers() end


  love.graphics.setColor(1, 1, 1, 1)
end
--

--[[
function dbg_renderAnimationFrames()
  -- Make sure player and enemy exists and has ac so that we can actually draw them
  local playerEnemyExists = player and enemy and player.ac and enemy.ac
  if not playerEnemyExists then return end


  -- Reset graphics
  love.graphics.push()
  love.graphics.reset() -- RESETS Font(size?) as well, not documented? might be mistaken
  love.graphics.scale(scale.x, scale.y) -- Scale hack

  love.graphics.setColor(1.0, 1.0, 1.0)


  local topMargin = 40

  love.graphics.rectangle("fill", 0, 0, W, topMargin)

  love.graphics.setColor(0.0, 0.0, 0.0)

  love.graphics.print("player: " .. player.ac:curName() .. ": " .. player.ac:curFrame(), 10, 10)

  love.graphics.print("enemy: "  .. enemy.ac:curName()  .. ": " .. enemy.ac:curFrame(), 10, topMargin/2)


  -- "pop" graphics
  love.graphics.pop() -- does not re-reset font?
  love.graphics.setNewFont(FONT_PATH, FONT_SIZE)
  love.graphics.setColor(1.0, 1.0, 1.0)
end
--]]

---[[
dbg_inputTimerPercentage = 0
function dbg_renderInputTimers()
  love.graphics.rectangle("fill", 0, H - 50, 100 * dbg_inputTimerPercentage, 50)
  love.graphics.line(100, H - 50, 100, H)
end
--]]



-- Keypressed callback ------
function dbg_keypressed(key, scancode, isrepeat) 
  -- TODO: make more generic? have a list of keys and corresponding callbacks maybe?
  -- makes it easier to add new debug things close to the context where they are used,
  -- tradeoff being that it's harder to track down all the usages of it (search all files ofc, but it's more unclear still)

  -- TODO: regardless of above consideration, debug usages of keypressed need to be better marked (currently there are a bunch of gamestates that have keypress debug stuff)

  if key == "0" then
    dbg_debugEnabled = not dbg_debugEnabled
  end


  if dbg_debugEnabled then 
    if key == "1" then
      debugPrint("Loading: Debug", 100, 100)
      require("mobdebug").start() 
      print("debug ---------------")


    elseif key == "m" then
      Sound:muteMusic()


    elseif key == "2" then
      callOrError(GameReload)


    elseif key == "3" and enemy and player then -- Reset animations, could proably be moved
      dbg_battleResetAnimations()

    elseif key == "t" and enemy then
      enemy.dbg_trigger_offensive_action = not enemy.dbg_trigger_offensive_action


    elseif key == "r" then
      dbg_resetVNOrBattle()


    elseif key == "4" then
      dbg_dtMultiplier = dbg_dtMultiplier == 1 and dbg_dtSlowFactor or 1

    elseif key == "5" then
      dbg_dtMultiplier = dbg_dtMultiplier == 1 and dbg_dtFastFactor or 1
    end
  end
end











