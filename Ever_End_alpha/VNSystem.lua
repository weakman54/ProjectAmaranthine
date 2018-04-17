

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



function VNSystem:loadScene(scene, line)
  -- TODO: require scene.lua
  -- TODO: load all images
  self.curScene = scene
  self.curLine = line or 1
end




return VNSystem