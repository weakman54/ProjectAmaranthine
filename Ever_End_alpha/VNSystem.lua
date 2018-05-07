
local RM = require "resourceManager.resourceManager"


function buildPanel(path, panelPrefix, panelNumber)
  local ret = {
    moments = {
      {transitionTrigger = "waitForInput"}
      }
  }

  panelPrefix = string.format("%sp%03d_", panelPrefix, panelNumber)

  -- Get all things in the directory
  local dirList = love.filesystem.getDirectoryItems(path)

  -- Filter out the panel specific files
  local panelList = lume.filter(dirList, function(name) return name:find(panelPrefix .. "m")  end)
  local background = lume.filter(dirList, function(name) return name:find(panelPrefix .. "bg")  end)[1]

  if not background then return end

  RM.prefix = path
  ret.bg = string.format("$RM:loadAnimation('%s')", background:sub(1, -10))


--  print(ret.bg)

  for _, item in ipairs(panelList) do
    local name = item:sub(10, -11)
    ret[name] = string.format("$RM:loadAnimation('%s')", item:sub(1, -10))
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



local VNSystem = {}

-- TODO: fix curDrawing
-- TODO: do functions


local things = {}
local curDrawing = {}


VNSystem.curLineI = 1
VNSystem.curScene = nil

function VNSystem:executeLine(line)
  local f = functions(line[1])
  assert(f, "function " .. line[1] .. ", line " .. self.curLineI .. ", does not exist, did you misspell something?") --NOTE: uses curLine for error messages, could be "cleaner" probably

  return f(unpack(line, 2))
end

function VNSystem:update(dt)
  local curLine = self.curScene[self.curLineI]

  local retVal = self:executeLine(curLine)

  if retVal then return end

  self.curLineI = self.curLineI + 1
end


function VNSystem:draw()
end



--function VNSystem:loadScene(scene, line)
--  assert(scene, "VNSystem: You must supply which scene to switch to!")
--  -- TODO: require scene.lua
--  -- TODO: load all images
--  self.curScene = scene
--  self.curLine = line or 1
--end




return VNSystem