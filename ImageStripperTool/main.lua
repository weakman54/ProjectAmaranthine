
lurker = require("lurker")
lurker.protected = false -- Using my own error handling, which doesn't completely neuter love to the point of non-usability


local nFD  = love.filesystem.newFileData
local nID  = love.image.newImageData


local filesToProcess = {}
local metaData = {}
local progress = 0




function findFirstPixelLeft(ID)
  for x = 0, ID:getWidth()-1 do
    for y = 0, ID:getHeight()-1 do
      local r, g, b, a = ID:getPixel( x , y )
      if a ~= 0 then return x end
    end
  end
end

function findFirstPixelRight(ID)
  for x = ID:getWidth()-1, 0, -1  do
    for y = 0, ID:getHeight()-1 do
      local r, g, b, a = ID:getPixel( x , y )
      if a ~= 0 then return x end
    end
  end
end

function findFirstPixelTop(ID)
  for y = 0, ID:getHeight()-1 do
    for x = 0, ID:getWidth()-1 do
      local r, g, b, a = ID:getPixel( x , y )
      if a ~= 0 then return y end
    end
  end
end

function findFirstPixelBottom(ID)
  for y = ID:getHeight()-1, 0, -1  do
    for x = 0, ID:getWidth()-1 do
      local r, g, b, a = ID:getPixel( x , y )
      if a ~= 0 then return y end
    end
  end
end

function findFirstPixels(ID)
  return findFirstPixelLeft(ID), findFirstPixelTop(ID), findFirstPixelRight(ID), findFirstPixelBottom(ID)
end
--


-- Convert a lua table into a lua syntactically correct string
function table_to_string(tbl)
  local result = "{"
  for k, v in pairs(tbl) do
    -- Check the key type (ignore any numerical keys - assume its an array)
    if type(k) == "string" then
      result = result.."\n[\""..k.."\"]".." = "
    end

    -- Check the value type
    if type(v) == "table" then
      result = result..table_to_string(v)
    elseif type(v) == "boolean" then
      result = result..tostring(v)
    elseif type(v) == "number" then
      result = result .. v
    else
      result = result.."\""..v.."\""
    end
    result = result..", "
  end
  -- Remove leading commas from the result
  if result ~= "{" then
    result = result:sub(1, result:len()-1)
  end
  return result.."\n}"
end



function love.load()
end


function love.update(dt)
  lurker.update()

  progress = #filesToProcess
  if #filesToProcess > 0 then
    local file = table.remove(filesToProcess)

    local x1, y1, x2, y2 =  findFirstPixels(file.data)
    assert(x1 and y1 and x2 and y2, "Eh? " .. file.filename)
    
    local width, height = x2 - x1 + 1, y2 - y1 + 1
    local newID = love.image.newImageData(width, height)
    newID:paste(file.data, 0, 0, x1, y1, width, height)

    newID:encode("png", file.filename)

    metaData[file.filename] = {x = x1, y = y1, width = width, height = height}
  end



--  if currentImgT and justDropped then  -- This needs to be in update since lurker doesn't check filedropped...
--    justDropped = false
--    local x1, y1, x2, y2 =  findFirstPixels(currentImgT.data)
--    local width, height = x2 - x1, y2 - y1
--    local newID = love.image.newImageData(width, height)
--    newID:paste(currentImgT.data, 0, 0, x1, y1, width, height)

--    newID:encode("png", "newImage.png")

--    otherImage = love.graphics.newImage(newID)
--  end
end



function love.draw()
  love.graphics.print(progress, 10, 10)
end


function love.keypressed(key)
  if key == "s" then
    love.filesystem.write("metaData.lua", "return " .. table_to_string(metaData))
  end
end


function matchLocalFilename(fullname, extension)
  return string.match(fullname, "[/\\]([%w_]*%." .. extension .. ")") 
end



function love.filedropped(file)
  local fullfname = file:getFilename()
  local fname = matchLocalFilename(fullfname, "png") -- TODO: make sure this match is proper

  if not fname then print("did not get proper name? " .. tostring(fullfname)) return end

  print("file dropped: " .. tostring(fname))


  local data
  if file:open('r') then
    data = file:read()    -- watch out! this slurps the whole file in one go.
    file:close() 
  else
    print("WARNING: Could not open file: " .. tostring(fullfname))
    --return?
  end


  local success, imageData = pcall(function() return nID(nFD(data, 'img', 'file')) end)

  justDropped = success
  if success then 
    table.insert(filesToProcess, {data = imageData, filename = fname})
  else
    print("WARNING: Could not make into image: " .. tostring(fullfname))
  end
end



function love.directorydropped( dir )
  print("dir", dir)
  local dirList = love.filesystem.getDirectoryItems(dir)
  for _, item in ipairs(dirList) do
    print(item)
  end
--  print(file, file:getFilename())
end