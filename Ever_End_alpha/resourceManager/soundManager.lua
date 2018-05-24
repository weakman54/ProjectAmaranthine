
local dbg_print = false
local dbg_render = true


local SoundManager = {}


local sfx = {}
local mus = {}
local playingMus

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

-- Load all sound effects
  for _, shortname in ipairs(sfxDir) do
    local ext = shortname:sub(-4, -1)
    if ext == ".ogg" or ext == ".wav" then 
      local longname = sfxRoot .. "/" .. shortname
      local handle = shortname:sub(1, -5)



      if dbg_render then debugPrint("Loading: sfx\n" .. longname, 100, 100) end
      if dbg_print then print("Loading: sfx: " .. longname .. " as " .. handle) end

      sfx[handle] = {filename = longname, sources = {}}
    end
  end

  -- Load all music
  for _, shortname in ipairs(musDir) do
    local ext = shortname:sub(-4, -1)
    if ext == ".ogg" or ext == ".wav" or ext == ".mp3" then  -- TODO: remove mp3 from here, it glitches when looping

      local longname = musRoot .. "/" .. shortname
      local handle = shortname:sub(1, -5)

      if dbg_render then debugPrint("Loading: mus\n" .. longname, 100, 100) end
      if dbg_print then print("Loading: mus: " .. longname .. " as " .. handle) end

      mus[handle] = {filename = longname, source = love.audio.newSource(longname, "stream")}
    end
  end
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

function SoundManager:stop(sound)
  if not sound then return end

  if sound == playingMus then
    playingMus.source:stop()
    playingMus = nil

  else
    error("tried to stop thing: " .. tostring(sound and sound.handle) .. ", this is either not implemented yet or something else went wrong...")

  end
end

function SoundManager:muteMusic()
  self:stop(playingMus)
end


function SoundManager:play(handle, opts)
  if sfx[handle] then
    spawnNewSFX(handle, opts)

  elseif mus[handle] then
    local tMus = mus[handle]
    tMus.handle = handle
    local src = tMus.source

    if playingMus and playingMus ~= tMus then
      playingMus.source:stop()
    end

    src:play()
    src:setLooping(opts and opts.looping     or true)
    src:setVolume(opts  and opts.startVolume or 1)

    tMus.targetVolume = opts and opts.targetVolume
    tMus.rateVolume   = opts and opts.rateVolume

    playingMus = tMus
  else

    error("SoundManager: trying to play a sound that does not exist: " .. handle)
  end
end


return SoundManager