
--function clear() love.graphics.clear(0, 0, 0) end
--lprint = love.graphics.print
--lpresent = love.graphics.present

function debugPrint(str, x, y, keep)
  if not keep then love.graphics.clear(0, 0, 0) end
  love.graphics.print(str, x, y)
  love.graphics.present()
end



function filterArray(array, filterF)
  local out = {}

  for i, v in ipairs(array) do
    if filterF(array, i, v) then
      table.insert(out, v)
    end
  end
end


function sourceIsStopped(source)
  return not source:isPlaying() and source:tell() == 0
end


function countAll(table)
  local s = 0
  for k, v in pairs(table) do
    s = s + 1
  end
  return s
end


function dumpToFile(o, f, depth, codeMarker)
  if o == nil then -- Error checking. NOTE: uses error instead of assert to be able to use the error level functionality
    error("dumpToFile(): Must supply object to be dumped!", 2)

  elseif f == nil or type(f) ~= "userdata" or f.write == nil then
    error("dumpToFile(): Must supply a file object to dump to!", 2)

  elseif type(o) == "function" or type(o) == "userdata" then
    error("Cannot dump type: " .. type(o) .. "!", 2)

  end
  --

  local function rf(o, f, depth, codeMarker)
    depth = depth or 0

    if o == nil then 
      return 

    elseif  type(o) == "number"  then
      f:write(o)

    elseif type(o) == "boolean" then
      f:write(o and "true" or "false") -- ASSUMTION: already checked for nil


    elseif type(o) == "string"  then
      if codeMarker == o:sub(1, 1) then
        f:write(o:sub(2))
      else
        f:write('"' .. o .. '"')
      end

    elseif type(o) == "table" then
      f:write("{\n")
      depth = depth + 1

      for k, v in pairs(o) do
        local key = '["' .. k .. '"]'

        if type(k) == "number" then key = "[" .. k .. "]"  
        elseif type(k) == "string" then key = k 
        end

        f:write(string.rep("  ", depth) .. key .. " = ")
        dumpToFile(v, f, depth, codeMarker)
        f:write(",\n")
      end

      depth = depth - 1
      f:write(string.rep("  ", depth) .. "}")
    end
  end


  return rf(o, f, depth, codeMarker)
end



function playDelayed(sound, time)
  HUMPTimer.after(time, function() Sound:play(sound) end)
end