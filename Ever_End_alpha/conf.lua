
local c = require "configuration"

if c.vsync then c.vsync = 1 else c.vsync = 0 end
if c.fullscreen == nil then c.fullscreen = true end

function love.conf(t)
  t.version = "11.1"

  t.window.title = "EverEnd"
  t.window.icon = "assets/icon.png"
  t.window.resizable = true

  t.window.width  = c.windowWidth  or 1920
  t.window.height = c.windowHeight or 1080

  t.window.fullscreen = c.fullscreen -- Set above
  t.window.fullscreentype  = c.fullscreentype or "desktop"
--  t.window.borderless = c.borderless or false (This seem to fuck with the scaling for some reason...

  t.window.vsync = c.vsync -- Set above
  t.window.msaa  = c.msaa  or 2
end
