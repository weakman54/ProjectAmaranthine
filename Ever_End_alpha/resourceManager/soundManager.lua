
local dbg_print = false
local dbg_render = true


local SoundManager = {}


local sfx = {}

local playing = {}


local function spawnNewSFX(handle, opts)
  local tfx = sfx[handle]
  local src = love.audio.newSource(tfx.filename, "static")

  src:setLooping(opts and opts.loop or false)

--  table.insert(tfx.sources, src) -- NOTE: this might be useful, so I'll keep it here, but for now I'll do the simple solution

  if opts and opts.delay then
    HUMPTimer.after(opts.delay, function() src:play() playing[src] = src end)
  else
    src:play()
    playing[src] = src
  end
  
  return src
end


function SoundManager:init()
  local sfxRoot = "assets/sound"
  local musRoot = "assets/music"

  local sfxDir = love.filesystem.getDirectoryItems(sfxRoot)
  local musDir = love.filesystem.getDirectoryItems(musRoot)

  for _, shortname in ipairs(sfxDir) do
    local longname = sfxRoot .. "/" .. shortname
    local handle = shortname:sub(1, -5)

    if dbg_render then debugPrint("Loading: sfx\n" .. longname, 100, 100) end
    if dbg_print then print("Loading: sfx: " .. longname .. " as " .. handle) end

    sfx[handle] = {filename = longname, sources = {}}
  end

  -- TODO: music
end

function SoundManager:update()  
  local remove = {}
  for _, source in pairs(playing) do
    if sourceIsStopped(source) then
      table.insert(remove, source)
    end
  end

  for _, source in ipairs(remove) do
    playing[source] = nil
  end     
end

function SoundManager:play(handle, opts)
  if sfx[handle] then
    spawnNewSFX(handle, opts)
  else
    error("SoundManager: trying to play a sound that does not exist: " .. handle)
  end
end


return SoundManager