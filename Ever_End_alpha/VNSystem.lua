
local RM = require "resourceManager.resourceManager"



dbg_VNSystem_DrawIndexes = true
dbg_VNSystem_DrawAnims = false



function buildPanel(path, panelPrefix, panelNumber)
  local ret = {
    moments = {
    }
  }

  panelPrefix = string.format("%sp%03d_", panelPrefix, panelNumber)

  -- Get all things in the directory
  local dirList = love.filesystem.getDirectoryItems(path)

  -- Filter out the panel specific files
  local panelList  = lume.filter(dirList, function(name) return name:find(panelPrefix .. "m" )  end)
  local background = lume.filter(dirList, function(name) return name:find(panelPrefix .. "bg")  end)[1]
  --  print(#panelList, background)

  if not background then return end

  RM.prefix = path
  ret.bg = {anim = string.format("$RM:loadAnimation('%s')", background:sub(1, -10))}



  for _, item in ipairs(panelList) do -- TODO: this entire section needs cleanup...

    local momentNum = tonumber(item:sub(13, 14))


    ret.moments[momentNum] = ret.moments[momentNum] or {transitionTrigger = {"waitForInput"}, anims = {}, drawData = {}, sounds = {}}

    local t = ret.moments[momentNum]

    local name = item:sub(16, -11)
    t.anims[name] = string.format("$RM:loadAnimation('%s')", item:sub(1, -10))
    table.insert(t.drawData, {anim = name})
    --    print(name, ret[name])
  end

  if not ret.moments[1] then
    table.insert(ret.moments, {transitionTrigger = {"waitForInput"}, anims = {}, drawData = {}, sounds = {}})
  end

  return ret
end



function buildScene(path, num)
  local ret = {}

  local dirList = love.filesystem.getDirectoryItems(path)
  local sceneRel = lume.filter(dirList, function(name) return name:find(string.format("scene%s", num)) end)[1]

  assert(sceneRel, "buildScene(): Could not find scenefolder: " .. string.format("scene%s", num))

  local scenePath = path .. sceneRel
  --  print(scenePath)

  local scenePrefix = string.format("s%s_", num)
  --  print(scenePrefix)

  -- Get all things in the directory
  local  sceneDirList = love.filesystem.getDirectoryItems(scenePath)
  --  print(#sceneDirList)

  local loopNum = #sceneDirList * 5 -- HACK: this is to ensure all panels are loaded even if there are "deleted" numbers, could be solved in a much better manner...

  for i=1, loopNum do -- HARDCODED: start num is 1, shouldn't have to change tbh
    local panel = buildPanel(scenePath, scenePrefix, i)
    if panel then
      --      print(i)
      table.insert(ret, panel)
    end
  end


  -- END MARKER PANEL
  --  ret[#ret + 1] = "END"


  -- NOTE: I'm having this in here, cause its easier, should probably be moved for a cleaner separation of duty
  local file = assert(io.open( ("%sgenerated/sceneScript%s.lua"):format(path, num), "w" ))

  --  print(string.format("%ssceneScript%s.lua", path, num, "w"), ("RM.prefix = '%s'"):format(scenePath))
  file:write("\nlocal RM = require 'resourceManager.resourceManager'\n")
  file:write(("RM.prefix = '%s/'\n\n"):format(scenePath))
  file:write("return ")
  dumpToFile(ret, file, nil, "$")

  io.close(file)

  --  return ret
end





local VNSystem = {}

VNSystem.Timer = HUMPTimer.new() -- TODO: fix this!
-- vnsystem stop/cancel/dontrun:
-- stop all sources, mute music, cancel timers
-- pause:
-- sounds are already paused, and update is not run on this, so should work out with timers too?



function VNSystem:setPanelI(panelI, momentI, supressTrigger)
  -- TODO: handle non-existant panels! (do we need to?)
  if type(panelI) ~= "number" or panelI <= 0 then error("Couldn't set panel index, wrong type or negative!", 2) end
  if not self.curScene then error("There is not scene!", 2) end
  for i = 0, 100 do -- MAGIC NUMBER: number of panels to look forward
    self.curPanelI = (panelI or 1) + i
    self.curPanel = self.curScene[self.curPanelI]
    if self.curPanel then break end
  end

  assert(self.curPanel, "Tried to go to a non-existent panel: " .. self.curPanelI)

  self:setMomentI(momentI or 1, supressTrigger)
end

function VNSystem:setMomentI(momentI, supressTrigger)
  if self.waitTimer then  -- TODO: fix this bug (which? xD it's fixed though..)
    HUMPTimer.cancel(self.waitTimer)
  end

  self.curMomentI = momentI or 1
  self.curMoment = self.curPanel.moments[self.curMomentI]

  if not self.curMoment then return false end
  if supressTrigger then return false end

  local moment = self.curMoment

  local transTrigType = moment.transitionTrigger[1] 
  if transTrigType == "timer" then
    local time = moment.transitionTrigger[2]
    self.waitTimer = HUMPTimer.after(time, function() VNSystem:incrementMomentI() end)
  end




  for _, t in ipairs(moment.drawData) do
    -- Start and loop all moment animations ASSUMPTION: all animations for VN system are simple looping anims
    if not moment.anims then error("There is no anims table! scene: " .. self.curSceneName .. ", panel: " .. tostring(self.curPanelI) .. ", moment: " .. tostring(self.curMomentI)) end
    if type(t.anim) ~= "string" then error("anim is wrong type! type:" .. type(t.anim) .. ", scene: " .. self.curSceneName .. ", panel: " .. tostring(self.curPanelI) .. ", moment: " .. tostring(self.curMomentI)) end
    if not moment.anims[t.anim] then error("Couldn't find anim " .. t.anim .. " in anims! scene: " .. self.curSceneName .. ", panel: " .. tostring(self.curPanelI) .. ", moment: " .. tostring(self.curMomentI)) end
    local anim = moment.anims[t.anim].data
    anim:play()
    anim:setLooping(t.looping)-- NOTE: defaults to looping

    -- Start any tweens
    if t.tween then
      local dur, target, method, after = unpack(t.tween)
      HUMPTimer.tween(dur, t, target, method, after)
    end

    -- Start any shake effects
    if t.shake then
      shakeEffect(t, unpack(t.shake))
    end
  end


  local bg = self.curPanel.bg
  -- Start and loop bg animation see assumption above
  local anim = bg.anim.data
  anim:play()
  anim:setLooping(true)

  -- Start any bg tweens
  local bgtween = moment.drawData.bg and moment.drawData.bg.tween -- HARDCODED: only does tweens, need changing if we ever add more ways to change stuff

  if bgtween then
    local dur, target, method, after = unpack(bgtween)
    HUMPTimer.tween(dur, bg, target, method, after)
  end



--  Play soundeffects/start sound play timers
  for _, soundData in ipairs(moment.sounds) do
    Sound:play(soundData[1], soundData[2])
  end


  -- Start or stop any music
  if moment.music then
    if moment.music[1] == "stop" then
      Sound:muteMusic()

    else
      Sound:play(moment.music[1], moment.music[2])
    end
  end


  return true
end

function VNSystem:incrementMomentI()
  -- NOTE: not thought over, needs testing...

  -- ASSUMPTION: there is a loaded moment when running this...
  local sceneToGoto = self.curMoment.transitionTrigger.gotoScene
  if sceneToGoto then
    if sceneToGoto == "MainMenu" then
      return Gamestate.switch(stateMain)  
    end
    return self:loadScene(sceneToGoto)
  end 
  -- ASSUMPTION: there is a loaded moment when running this...
  local enemyToGoTo = self.curMoment.transitionTrigger.enemyToGoTo
  if enemyToGoTo then
    return Gamestate.switch(stateBattle, enemyToGoTo)
  end

  local changedMoment = self:setMomentI(self.curMomentI + 1)

  -- If there are no more moments, go to next panel
  if not changedMoment then
    self:setPanelI(self.curPanelI + 1)
  end
end



function VNSystem:update(dt)
  -- ASSUMPTION: for these things in the beginning:  curMoment exists
  if self.curMoment.choice then -- HACK for current version as well, only does kill/spare option...
    if inputTimers.comboLeft.triggered then
      self.curMoment.transitionTrigger.gotoScene = "04_1" -- Spare option
      self:incrementMomentI()

    elseif inputTimers.comboRight.triggered then
      self.curMoment.transitionTrigger.gotoScene = "04_2" -- Kill option
      self:incrementMomentI()
    end

  elseif input:pressed("attack") and self.curMoment.transitionTrigger[1] == "waitForInput" then 
    -- JBOB SOUND HERE
    Sound:play("Click")
    self:incrementMomentI()

    -- Go Back
    -- elseif input:pressed("parry") and self.curPanelI ~= 1 then
--     self:setPanelI(self.curPanelI - 1)
  end


  self.curPanel.bg.anim.data:update(dt)

  if not self.curMoment then return end

  for _, t in ipairs(self.curMoment.drawData) do
    local sprite = self.curMoment.anims[t.anim]
    sprite.data:update(dt)
  end
end



function VNSystem:drawPanel(panel, momentI)
  local t = panel.bg
  local c = {t.red or 1, t.green or 1, t.blue or 1, t.alpha or 1}
  love.graphics.setColor(c)
  panel.bg.anim.data:loveDraw(t.x, t.y, t.rotation, t.xScale, t.yScale, t.xOffset or 200, t.yOffset or 200)

  if not self.curMoment then return end

  for _, t in ipairs(self.curMoment.drawData) do
    local sprite = self.curMoment.anims[t.anim]
    local c = {t.red or 1, t.green or 1, t.blue or 1, t.alpha or 1}
    love.graphics.setColor(c)
    sprite.data:loveDraw(t.x, t.y, t.rotation, t.xScale, t.yScale, t.xOffset or 200, t.yOffset or 200)
  end


  if self.curMoment.choice then
    for _, name in ipairs{"comboLeft", "comboRight"} do
      local overlay = (name == "comboRight") and guiOverlays["kill"] or guiOverlays["spare"]
      local inputPercentage = inputTimers[name].percentage

      love.graphics.setColor(1, 1, 1, inputPercentage)
      overlay.data:loveDraw(x, y, r, sx, sy, 200, 200)
      love.graphics.setColor(1, 1, 1)
    end
  end

  love.graphics.setColor(1, 1, 1, 1)
end


function VNSystem:draw()
  if self.curPanel then
    self:drawPanel(self.curPanel, self.curMomentI)
  end


  if dbg_debugEnabled then
    if dbg_VNSystem_DrawIndexes then
      love.graphics.setColor(0, 0, 0, 0.6)
      love.graphics.rectangle("fill", 0, 0, 900, 70)

      love.graphics.setColor(1, 1, 1, 0.6)
      love.graphics.print("scene: " .. tostring(self.curSceneName) .. "; panel: " .. (self.curPanelI) .. "; moment: " .. tostring(self.curMomentI), 5, 5)

      love.graphics.setColor(1, 1, 1)
    end

    if dbg_VNSystem_DrawAnims then
      -- TODO: maybe not necessary
    end
  end
end



function VNSystem:loadScene(scene, panelI, momentI, supressTrigger)
  assert(scene, "VNSystem: You must supply which scene to switch to!")

  local t = reload(("assets/VN/sceneScript%s"):format(scene)) -- NOTE: This feels pretty hack, but eh

  self.curSceneName = scene
  self.curScene = t
  self:setPanelI(panelI or 1, momentI or 1, supressTrigger)
end




return VNSystem