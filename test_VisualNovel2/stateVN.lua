
local stateVN = {}


local Animation = require "animation"


local curScene = require "testscene"
local curLine = 1
local waitForInput = false

local resources = {}
local curDrawing = {} 

local background

executing = true -- Kinda hack atm, but eh, works

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

    for _, filename in ipairs(filenames) do

      anim:importFrame{
        image = love.graphics.newImage(filename),
      }
    end


    resources[handle] = {
      type = "animation",
      data = anim,
      pos = args.pos or {x = 0, y = 0},
      offset = args.offset or {x = 0, y = 0},
      rot = args.rot or 0,
      scale = args.scale or {x = 1, y = 1},
      color = args.color or {255, 255, 255},
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

  doTween = function(handle, duration, target, method, after, ...)
    local subject = resources[handle]

    Timer.tween(duration, subject, target, method, after, ...)
  end,

  pauseExecution = function(duration)
    executing = false

    if duration then
      Timer.after(duration, function() executing = true curLine = curLine + 1 end)
    end

    return true
  end,


  loadSoundEffect = function(handle, filename)
    assert(resources[handle] == nil, "You can't load a resource with the same name twice!")

    resources[handle] = {
      type = "soundEffect",
      data = love.audio.newSource(filename, "static")
    }
  end,
--
  loadMusic = function(handle, filename)
    assert(resources[handle] == nil, "You can't load a resource with the same name twice!")

    resources[handle] = {
      type = "music",
      data = love.audio.newSource(filename)
    }
  end,
  --

  play = function(handle)
    resources[handle].data:play()
  end,
  pause = function(handle)
    resources[handle].data:pause()
  end,
  stop = function(handle)
    resources[handle].data:stop()
  end,
  --


  addText = function(handle, string, args)  
    assert(resources[handle] == nil, "You can't load a resource with the same name twice!") -- Keeping this for now, but will remove it if feels like other (below) works better
    args = args or {}

    if resources[handle] ~= nil then -- Feels like this would work better?
      functions["removeText"](handle)
    end

    resources[handle] = {
      type = "text",
      data = string,
      pos = args.pos or {x = 0, y = 0},
      offset = args.offset or {x = 0, y = 0},
      rot = args.rot or 0,
      scale = args.scale or {x = 1, y = 1},
      color = args.color or {255, 255, 255},

      width = args.width or 200, -- MAGIC NUMBER: default width, arbitrary choice, could probably find a better default
      align = args.align or "left",
    }

    table.insert(curDrawing, handle)
  end,
  removeText = function(handle)
    assert(resources[handle].type == "text", "You can't 'removeText' something that is not text!")
    removeValue(curDrawing, handle)
    resources[handle] = nil
  end,
  --

  setFont = function(handle, filename, size) -- TODO: research speed of this, should not be very heavy, but is not a "lightweight" resource either...
    assert(resources[handle] == nil, "You can't load a resource with the same name twice!")
    resources[handle] = {
      type = "font",
      data = filename,
    }

    love.graphics.setNewFont(filename, size)
  end,
  --


  changeScene = function(name, lineNumber)
    curScene = require(name)
    curLine = lineNumber or 1 
    return true
  end,
  --
  
  gotoBattle = function(battleState)
    Gamestate.switch(stateBattle)
  end,
  --
}
--


function stateVN:update(dt)
  Timer.update(dt)

  if executing then -- Should probably refactor to something like this
    for i=curLine, #curScene do
      local line = curScene[i]
      local f = functions[line[1]]
      assert(f, "function " .. line[1] .. ", code line " .. i .. ", does not exist, did you misspell something?")
      local shouldBreak = f(unpack(line, 2))

      if shouldBreak then break end

      curLine = curLine + 1
    end
  end

  for _, handle in ipairs(curDrawing) do -- Currently updates all of em, even if they are only one frame, probably inconsequential though
    local thing = resources[handle]
    if thing.type == "animation" then
      thing.data:update(dt) -- TODO: clean this up a bit, in fact, proably should clean the entire resource manager up a bit once I'm done hacking in all the features..
    end
  end    
end


function stateVN:draw()
  if background then
    local thing = resources[background]
    love.graphics.setColor(thing.color)
    thing.data:loveDraw(thing.pos.x, thing.pos.y, thing.rot, thing.scale.x, thing.scale.y, thing.offset.x, thing.offset.y)
  end

  love.graphics.circle("fill", 100, 100, 10)

  for _, handle in ipairs(curDrawing) do
    local thing = resources[handle]

    love.graphics.setColor(thing.color)

    if thing.type == "text" then
      love.graphics.printf(thing.data, thing.pos.x, thing.pos.y, thing.width--[[?]], thing.align, thing.rot, thing.scale.x, thing.scale.y, thing.offset.x, thing.offset.y)
    else
      thing.data:loveDraw(thing.pos.x, thing.pos.y, thing.rot, thing.scale.x, thing.scale.y, thing.offset.x, thing.offset.y)
    end
  end
end


function stateVN:keypressed(key)
  if waitForInput then
    curLine = curLine + 1
    waitForInput = false
  end

  if key == "escape" then
    love.event.quit()

  elseif key == "" then

  end
end


return stateVN

