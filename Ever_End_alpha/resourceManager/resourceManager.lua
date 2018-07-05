
-- TODO: make it possible to load image data and so on, atm only loading through filename is possible
local dbg_ignoreDDS = true and dbg_debugEnabled -- NOTE: This requires debugEnabled to be set from start if it should load _everything_ as png!



local Animation = require "animation.animation"



function getContainingFolder(fname)
  local ret
  for word in string.gmatch(fname, "([%w_ ]*)[\\/]") do 
    ret = word
  end
  return ret
end

function splitFilename(fullname, extension)
  return string.match(fullname, "(.*[/\\])([%w_]*)%.(.*)") 
end





local resourceManager = {}

resourceManager.dbg_print = false
resourceManager.dbg_render = true

resourceManager.dbg_useHackCounter = true
local hackLoadCounter = 0


resourceManager.cache = {}

resourceManager.prefix = ""



function resourceManager:checkLoaded(filename)
  return self.cache[filename]
end


local nFD = love.filesystem.newFileData
local nID = love.image.newImageData
local nCID = love.image.newCompressedData


--function resourceManager:genericLoader(f, filename, ...)
--  filename = self.prefix .. filename
----  if self.dbg_print then print("GENERIC: trying to load resource: " .. filename) end

--  if not self.cache[filename] then
--    local resource = {filename = filename}


--    if filename:sub(-3) == "png" then -- HACK, needed to load imageData to keep a reference, cause Love 11...
--      resource.imgData = nID(nFD(filename))
--    end

--    if filename:sub(-3) == "dds" then -- HACK, needed to load imageData to keep a reference, cause Love 11...
--      resource.imgData = nCID(nFD(filename))
--    end


--    resource.data = f(resource.imgData, ...)

--    self.cache[filename] = resource
--  end

--  return self.cache[filename]
--end


function resourceManager:loadImage(filename) -- NOTE: moved generic loader code over here, because it wasn't generic...
  filename = self.prefix .. filename


  if not self.cache[filename] then
    local resource = {filename = filename}


    if filename:sub(-3) == "png" then -- HACK, needed to load imageData to keep a reference, cause Love 11...
      resource.imgData = nID(nFD(filename))
    end

    if filename:sub(-3) == "dds" then -- HACK, needed to load imageData to keep a reference, cause Love 11...
      resource.imgData = nCID(nFD(filename))
    end


    resource.data = love.graphics.newImage(resource.imgData)


    local path, file, ext = splitFilename(filename)
    local metaDataPath = path .. "metaData.lua"
    local drawData = {}

    if love.filesystem.getInfo(metaDataPath) then
      local shortname = file .. "." .. ext
      local metaData = require(path .. "metaData")
      drawData = metaData[shortname]
    end

    resource.drawData = drawData -- TODO: load this from file!


    self.cache[filename] = resource
  end

  return self.cache[filename]
--  return self:genericLoader(love.graphics.newImage, filename)
end

function resourceManager:loadAnimation(filenameprefix, postfix, framerate) -- TODO: generalize this function with patterns or something
  local anim = Animation:new(framerate or DEFAULT_FRAMERATE)


--  postfix = postfix or ".png"
  postfix = postfix or ".dds" -- Default to dds
  local i = 1

  if self.dbg_print then print("\nresourceManager: loading animation") end

  while true do
    local t = string.format("%05d", i)
    local filename = filenameprefix .. t .. postfix

--    if self.dbg_print then print("resourceManager: trying to load frame: [" .. self.prefix .. "]" .. filename) end

    if love.filesystem.getInfo(self.prefix .. filename) and
    not dbg_ignoreDDS then 

      if self.dbg_print then print("resourceManager: loading frame: [" .. self.prefix .. "]" .. filename) end
      if self.dbg_render and not self:checkLoaded(self.prefix .. filename) then
        if self.dbg_useHackCounter then
          hackLoadCounter = hackLoadCounter + 1 
          debugPrint("loading" .. string.rep(".", hackLoadCounter % 4), 100, 100)
        else
          debugPrint("loading animation frame:\n[" .. self.prefix .. "]" .. filename, 100, 100)        
        end
      end

      anim:_importFrame(self:loadImage(filename))
      i = i + 1

    else -- Couldn't load default (dds), try again with png     

      local t = string.format("%05d", i)
      local filename = filenameprefix .. t .. '.png' -- hardcoded 

--    if self.dbg_print then print("resourceManager: trying to load frame: [" .. self.prefix .. "]" .. filename) end

      if love.filesystem.getInfo(self.prefix .. filename) then -- NOTE: need prefix here as well, getting a bit cluttered..
        if self.dbg_print then print("resourceManager: loading frame: [" .. self.prefix .. "]" .. filename) end
        if self.dbg_render and not self:checkLoaded(self.prefix .. filename) then
          if self.dbg_useHackCounter then
            hackLoadCounter = hackLoadCounter + 1 
            debugPrint("loading" .. string.rep(".", hackLoadCounter % 4), 100, 100)
          else
            debugPrint("loading animation frame:\n[" .. self.prefix .. "]" .. filename, 100, 100)        
          end
        end


        anim:_importFrame(self:loadImage(filename))
        i = i + 1
      else
        assert( i > 1, "resourceManager: could not load frame: [" .. self.prefix .. "]" .. filename .. " at all!")
        --      if self.dbg_print then print("resourceManager: could not load frame: [" .. self.prefix .. "]" .. filename) end
        break
      end
    end
  end


  return {filename = self.prefix .. filenameprefix, data = anim} -- NOTE: uses filenameprefix as filename here, might be wierd. NOTE2: Also, need to add path prefix manually here as well
end


--function resourceManager:loadSource(filename)
--  return self:genericLoader(love.audio.newSource, filename)
--end


--function resourceManager:loadFont(filename) -- TODO: think about font format, to ease size changing
--  return self:genericLoader(love.graphics.newFont, filename)
--end



do -- Stuff that should be moved
  local function walkDirectory(path, stuff)
    stuff = stuff or {}

    local dirs = love.filesystem.getDirectoryItems(path)

    for _, thing in ipairs(dirs) do
      local targetPath = path .. "/" .. thing


      if love.filesystem.getInfo(targetPath, "directory") then
        walkDirectory(targetPath, stuff)

      else
        table.insert(stuff, targetPath)
        if self.dbg_print then print(targetPath) end


      end
    end
  end
--

--walkDirectory("assets")

  local dir = love.filesystem.getDirectoryItems(resourceManager.prefix .. "Quit")

  for _, thing in ipairs(dir) do
--  print("#", thing)
  end
end
--


return resourceManager
















