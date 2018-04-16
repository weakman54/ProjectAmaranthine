
-- TODO: make it possible to load image data and so on, atm only loading through filename is possible

local dbg_print = true

local Animation = require "animation.animation"


local resourceManager = {}


resourceManager.cache = {}
local cache = resourceManager.cache




local function walkDirectory(path, stuff)
  stuff = stuff or {}

  local dirs = love.filesystem.getDirectoryItems(path)

  for _, thing in ipairs(dirs) do
    local targetPath = path .. "/" .. thing


    if love.filesystem.getInfo(targetPath, "directory") then
      walkDirectory(targetPath, stuff)

    else
      table.insert(stuff, targetPath)
      if dbg_print then print(targetPath) end


    end
  end
end
--

walkDirectory("assets")

local dir = love.filesystem.getDirectoryItems("assets/Quit")

for _, thing in ipairs(dir) do
end



local function resFromCache(filename)
  return 
end

function resourceManager:genericLoader(f, filename, ...)
  if not cache[filename] then 
    cache[filename] = {filename = filename, data = f(filename, ...)}
  end

  return cache[filename]
end


function resourceManager:loadImage(filename)
  return self:genericLoader(love.graphics.newImage, filename)
end

function resourceManager:loadAnimation(filenameprefix, postfix) -- TODO: generalize this function with patterns or something
  local anim = Animation:new()

  postfix = postfix or ".png"
  local i = 1
  
  if dbg_print then print("\nresourceManager: loading animation") end

  while true do
    local t = string.format("%05d", i)
    local filename = filenameprefix .. t .. postfix

    if dbg_print then print("resourceManager: trying to load frame: " .. filename) end

    if love.filesystem.getInfo(filename) then
      if dbg_print then print("resourceManager: loading frame: " .. filename) end
      anim:_importFrame(self:loadImage(filename))
      i = i + 1

    else 
      if dbg_print then print("resourceManager: could not load frame: " .. filename)
        break
      end
    end
  end
  
  return {filename = filename, data = anim}
end


function resourceManager:loadSource(filename)
  return self:genericLoader(love.audio.newSource, filename)
end


--function resourceManager:loadFont(filename) -- TODO: think about font format, to ease size changing
--  return self:genericLoader(love.graphics.newFont, filename)
--end



return resourceManager












