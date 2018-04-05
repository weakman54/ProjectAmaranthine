
-- Utility stuff TODO: move into proper place! vvvvvvvvvvvvvvvv
function removeValue(array, value) 
  for i=#array, 1, -1 do 
    if array[i] == value then 
      table.remove(array, i) 
    end 
  end 
end
-- Utility stuff ^^^^^^^^^^^^^^^^^


local Animation = require "animation"


local curScene = require "testscene"
local curLine = 1
local waitForInput = false

local resources = {}
local curDrawing = {} 

local background

local functions -- Need to declare first so I can access in functions' functions itself
functions = {  
  waitForInput = function()
    waitForInput = true
    return true 
  end,
  --

  loadAnim = function (handle, filenames, args)    
    assert(resources[handle] == nil, "You can't load a resource with the same name twice!")
    args = args or {}


    local anim = Animation:new()
    anim:setFramerate(args.framerate or 30)
    anim:play(args.startFrom)
    anim:setLooping(args.looping)
--    anim:setFramerate(args.framerate or 30):play(args.startFrom):setLooping(args.looping)

    for _, filename in ipairs(filenames) do

      anim:importFrame{
        image = love.graphics.newImage(filename),
      }
    end


    resources[handle] = {
      data = anim,
      pos = args.pos or {x = 0, y = 0},
      offset = args.offset or {x = 0, y = 0},
      rot = args.rot or 0,
      scale = args.scale or {x = 1, y = 1},
    }
  end,
  loadImage = function(handle, filename, args)
    args.looping = false
    functions.loadAnim(handle, {filename}, args)
  end,
  --


  setBG = function(handle)
    background = handle
  end,
  --

  show = function(handle) -- args?
    table.insert(curDrawing, handle)    
  end,
  hide = function(handle)
    removeValue(curDrawing, handle)
  end,
  --


  setPosition = function(handle, x, y)
    resources[handle].pos.x, resources[handle].pos.y = x, y
  end,
  setOffset = function(handle, x, y)
    resources[handle].offset.x, resources[handle].offset.y = x, y
  end,
  --
}
--


function love.load(arg)
  -- BOILERPLATE vvvvvvvvvvv
  love.graphics.setNewFont(48)

  if arg[#arg] == "-debug" then
    love.graphics.print("Debug Load...", 100, 100)
    love.graphics.present()
    require("mobdebug").start() 
  end

  love.graphics.print("Loading...", 100, 100)
  love.graphics.present()
  -- BOILERPLATE ^^^^^^^^
end


function love.update(dt)  
  for i=curLine, #curScene do
    local line = curScene[i]
    local f = functions[line[1]]
    assert(f, "function " .. line[1] .. ", code line " .. i .. ", does not exist, did you misspell something?")
    local shouldBreak = f(unpack(line, 2))

    if shouldBreak then break end

    curLine = curLine + 1
  end

  for _, handle in ipairs(curDrawing) do -- Currently updates all of em, even if they are only one frame, probably inconsequential though
    local anim = resources[handle].data
    anim:update(dt)
  end    
end


function love.draw()
  if background then
    local thing = resources[background]
    thing.data:loveDraw(thing.pos.x, thing.pos.y, thing.rot, thing.scale.x, thing.scale.y, thing.offset.x, thing.offset.y)
  end

  love.graphics.circle("fill", 100, 100, 10)

  for _, handle in ipairs(curDrawing) do
    local thing = resources[handle]
    thing.data:loveDraw(thing.pos.x, thing.pos.y, thing.rot, thing.scale.x, thing.scale.y, thing.offset.x, thing.offset.y)
  end
end


function love.keypressed(key)
  if waitForInput then
    curLine = curLine + 1
    waitForInput = false
  end

  if key == "escape" then
    love.event.quit()

  elseif key == "" then

  end
end






















