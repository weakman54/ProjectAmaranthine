
local RM = require "resourceManager.resourceManager"


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


--  print(ret.bg)
--  ret.moments[1] = {transitionTrigger = "waitForInput"}

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
  local file = assert(io.open( ("%ssceneScript%s.lua"):format(path, num), "w" ))

--  print(string.format("%ssceneScript%s.lua", path, num, "w"), ("RM.prefix = '%s'"):format(scenePath))
  file:write("\nlocal RM = require 'resourceManager.resourceManager'\n")
  file:write(("RM.prefix = '%s/'\n\n"):format(scenePath))
  file:write("return ")
  dumpToFile(ret, file, nil, "$")

  io.close(file)

--  return ret
end








local VNSystem = {}

-- TODO: fix curDrawing
-- TODO: do functions


local things = {}
local curDrawing = {}


function VNSystem:setPanelI(panelI, momentI)
  -- TODO: handle non-existant panels! (do we need to?)
  if type(panelI) ~= "number" or panelI <= 0 then error("Couldn't set panel index, wrong type or negative!", 2) end
  if not self.curScene then error("There is not scene!", 2) end

  self.curPanelI = panelI or 1
  self.curPanel = self.curScene[self.curPanelI]

  assert(self.curPanel, "Tried to go to a non-existent panel: " .. self.curPanelI)

  self:setMomentI(momentI or 1)
end

function VNSystem:setMomentI(momentI)
  self.curMomentI = momentI or 1
  self.curMoment = self.curPanel.moments[self.curMomentI]

  if not self.curMoment then return false end

  local transTrigType = self.curMoment.transitionTrigger[1] 
  if transTrigType == "timer" then
    local time = self.curMoment.transitionTrigger[2]
    HUMPTimer.after(time, function() VNSystem:incrementMomentI() end)
  end

  -- Start any tweens
  for _, t in ipairs(self.curMoment.drawData) do
    if t.tween then
      local dur, target, method, after = unpack(t.tween)
      HUMPTimer.tween(dur, t, target, method, after)
    end
  end

  local bgtween = self.curMoment.drawData.bg and self.curMoment.drawData.bg.tween -- HARDCODED: only does tweens, need changing if we ever add more ways to change stuff
  local bg = self.curPanel.bg

  if bgtween then
    local dur, target, method, after = unpack(bgtween)
    HUMPTimer.tween(dur, bg, target, method, after)
  end

  return true


  -- Play soundeffects/start sound play timers
--  for _, sound in ipairs(self.curMoment.drawData) do
--    if sound.delay

end

function VNSystem:incrementMomentI()
  -- NOTE: not thought over, needs testing...

  -- ASSUMPTION: there is a loaded moment when running this...
  local sceneToGoto = self.curMoment.transitionTrigger.gotoScene
  if sceneToGoto then
    self:loadScene(sceneToGoto)
  end


  local changedMoment = self:setMomentI(self.curMomentI + 1)
  if changedMoment then return end

  self:setPanelI(self.curPanelI + 1)
end



function VNSystem:update(dt)
  if input:pressed("attack") and self.curMoment.transitionTrigger[1] == "waitForInput" then
    local sceneAtKey = self.curMoment.transitionTrigger[key]
    if sceneAtKey then
      self.curMoment.transitionTrigger.gotoScene = sceneAtKey
    end
    self:incrementMomentI()
  end
end



function VNSystem:drawPanel(panel, momentI)
  local t = panel.bg
  panel.bg.anim.data:loveDraw(t.x, t.y, t.r, t.sx, t.sy, t.ox, t.oy)

  if not self.curMoment then return end

  for _, t in ipairs(self.curMoment.drawData) do
    local sprite = self.curMoment.anims[t.anim]
    sprite.data:loveDraw(t.x, t.y, t.r, t.sx, t.sy, t.ox or 200, t.oy or 200)
  end
end


function VNSystem:draw()
  if self.curPanel then
    self:drawPanel(self.curPanel, self.curMomentI)
  end
end



function VNSystem:keypressed(key)

end



function VNSystem:loadScene(scene, panelI, momentI)
  assert(scene, "VNSystem: You must supply which scene to switch to!")

  local t = reload(("assets/VN/sceneScript%s"):format(scene)) -- NOTE: This feels pretty hack, but eh

  self.curScene = t
  self:setPanelI(panelI or 1, momentI or 1)
end





return VNSystem