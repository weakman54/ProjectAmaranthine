
-- TODO: make it possible to load image data and so on, atm only loading through filename is possible

local dbg_print = false
local dbg_render = true

local Animation = require "animation.animation"


local resourceManager = {}


resourceManager.cache = {}
local cache = resourceManager.cache


resourceManager.prefix = "assets/"




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

--walkDirectory("assets")

local dir = love.filesystem.getDirectoryItems(resourceManager.prefix .. "Quit")

for _, thing in ipairs(dir) do
--  print("#", thing)
end


local nFD = love.filesystem.newFileData
local nID = love.image.newImageData


function resourceManager:genericLoader(f, filename, ...)
  filename = self.prefix .. filename
--  if dbg_print then print("GENERIC: trying to load resource: " .. filename) end

  if not cache[filename] then
    local resource = {filename = filename}

    if filename:sub(-3) == "png" then -- HACK, needed to load imageData to keep a reference, cause Love 11...
      resource.imgData = nID(nFD(filename))
      filename = resource.imgData
    end

    resource.data = f(filename, ...)

    cache[filename] = resource
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

--    if dbg_print then print("resourceManager: trying to load frame: [" .. self.prefix .. "]" .. filename) end

    if love.filesystem.getInfo(self.prefix .. filename) then -- NOTE: need prefix here as well, getting a bit cluttered..
      if dbg_print then print("resourceManager: loading frame: [" .. self.prefix .. "]" .. filename) end
      if dbg_render then debugPrint("loading animation frame:\n[" .. self.prefix .. "]" .. filename, 100, 100) end

      anim:_importFrame(self:loadImage(filename))
      i = i + 1

    else
      assert( i > 1, "resourceManager: could not load frame: [" .. self.prefix .. "]" .. filename .. " at all!")
--      if dbg_print then print("resourceManager: could not load frame: [" .. self.prefix .. "]" .. filename) end
      break
    end
  end


  return {filename = self.prefix .. filenameprefix, data = anim} -- NOTE: uses filenameprefix as filename here, might be wierd. NOTE2: Also, need to add path prefix manually here as well
end


function resourceManager:loadSource(filename)
  return self:genericLoader(love.audio.newSource, filename)
end


--function resourceManager:loadFont(filename) -- TODO: think about font format, to ease size changing
--  return self:genericLoader(love.graphics.newFont, filename)
--end



return resourceManager












