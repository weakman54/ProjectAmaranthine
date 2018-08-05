

require "util"

config = loadOrCreate("user_configuration.lua", "default_configuration.lua") -- require "configuration"


if config.vsync then config.vsync = 1 else config.vsync = 0 end
if config.fullscreen == nil then config.fullscreen = true end


function love.conf(t)
  t.version = "11.1"

  t.window.title = "EverEnd"
  t.window.icon = "assets/icon.png"
  t.window.resizable = true

  t.window.width  = config.windowWidth  or 1920
  t.window.height = config.windowHeight or 1080

  t.window.fullscreen = config.fullscreen -- Set above
  t.window.fullscreentype  = config.fullscreentype or "desktop"
--  t.window.borderless = config.borderless or false (This seem to fuck with the scaling for some reason...

  t.window.vsync = config.vsync -- Set above
  t.window.msaa  = config.msaa  or 2
end
