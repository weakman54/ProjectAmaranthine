
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