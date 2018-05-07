
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

  if not background then return end

  RM.prefix = path
  ret.bg = string.format("$RM:loadAnimation('%s')", background:sub(1, -10))


--  print(ret.bg)
--  ret.moments[1] = {transitionTrigger = "waitForInput"}

  for _, item in ipairs(panelList) do -- TODO: this entire section needs cleanup...

    local momentNum = tonumber(item:sub(11, 12))

    ret.moments[momentNum] = ret.moments[momentNum] or {transitionTrigger = "waitForInput", anims = {}, drawData = {}, sounds = {}}

    local t = ret.moments[momentNum]

    local name = item:sub(14, -11)
    t.anims[name] = string.format("$RM:loadAnimation('%s')", item:sub(1, -10))
    table.insert(t.drawData, {anim = name})
--    print(name, ret[name])
  end

  return ret
end



function buildScene(path, num)
  local ret = {}

  local dirList = love.filesystem.getDirectoryItems(path)
  local scenePath = path .. lume.filter(dirList, function(name) return name:find(string.format("scene%02d", num)) end)[1]

  local scenePrefix = string.format("s%02d_", num)

  -- Get all things in the directory
  local  sceneDirList = love.filesystem.getDirectoryItems(scenePath)

  local loopNum = #sceneDirList * 5 -- HACK: this is to ensure all panels are loaded even if there are "deleted" numbers, could be solved in a much better manner...

  for i=1, loopNum do -- HARDCODED: start num is 1, shouldn't have to change tbh
    local panel = buildPanel(scenePath, scenePrefix, i)
    if panel then
--      print(i)
      table.insert(ret, panel)
    end
  end


  -- NOTE: I'm having this in here, cause its easier, should probably be moved for a cleaner separation of duty
  local file = assert(io.open( ("%ssceneScript%02d.lua"):format(path, num), "w" ))

  print(string.format("%ssceneScript%02d.lua", path, num, "w"), ("RM.prefix = '%s'"):format(scenePath))
  file:write("\nlocal RM = require 'resourceManager.resourceManager'\n")
  file:write(("RM.prefix = '%s/'\n\n"):format(scenePath))
  file:write("return ")
  dumpToFile(ret, file, nil, "$")

  io.close(file)

--  return ret
end



function drawPanel(panel, momentI)
  panel.bg.data:loveDraw()

  local curMoment = panel.moments[momentI]
  for _, t in ipairs(curMoment.drawData) do
    local sprite = curMoment.anims[t.anim]
    sprite.data:loveDraw(t.x, t.y)
  end
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
  self:setMomentI(momentI or 1)
end

function VNSystem:setMomentI(momentI)
  self.curMomentI = momentI or 1
  self.curMoment = self.curPanel.moments[self.curMomentI]

  for _, t in ipairs(self.curMoment.drawData) do
    if t.tween then
      local dur, target, method, after = unpack(t.tween)
      HUMPTimer.tween(dur, t, target, method, after)
    end
  end
end


function VNSystem:update(dt)

end


function VNSystem:draw()
  if self.curPanel then
    drawPanel(self.curPanel, self.curMomentI)
  end
end



function VNSystem:loadScene(scene, panelI, momentI)
  assert(scene, "VNSystem: You must supply which scene to switch to!")

  self.curScene = scene
  self:setPanelI(panelI or 1, momentI or 1)
end





return VNSystem