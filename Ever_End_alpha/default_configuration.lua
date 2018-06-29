
-- DO NOTE MAKE CHANGES IN THIS FILE!
-- This file contains a default setup for the configuration.lua file,
-- and is intended as a simple backup if you have managed to break the actual config.
--
-- This file is not used by the game, instead, copy the rest of this file back into
-- configuration.lua if your game is not working because of changes you made to that file.
--
-- If there is no "configuration.lua", the game will still run, using the defaults.
-- To make changes to the settings though, you will need to create a new file called "configuration.lua"
-- to do that, you can copy this file and rename it
-- (make sure to delete this top part, to avoid confusion later).
-- Copy from below here: --------------

--
-- This is the configuration file for EverEnd
-- Here you can set options for how the game should run
-- 
-- Keep in mind that these settings are not checked, so
-- Some values might cause crashes (like negative window sizes for example)
-- Make sure to double check your numbers and keep the commas at the end of the line!
-- 
-- If your game is not working because of changes made in this file, there is a
-- backup config which can be found in "default_configuration.lua", which you can
-- use to restore the configuration back to a functioning state.
--
return {
  -- Window Size: -------
  -- (Note that the game is optimized for 1920 by 1080 (full HD))

  -- Height
  -- The width of the window in pixels.
  -- Possible values: positive numbers
  -- Default: 1920
  windowWidth  = 1920,

  -- Height
  -- The height of the window in pixels.
  -- Possible values: positive numbers
  -- Default: 1080  
  windowHeight = 1080,


  -- Fullscreen settings ------
  -- (Note that setting the game to fullscreen will override the size settings above, and will default to your native resolution)

  -- Fullscreen
  -- Whether or not the game should be in fullscreen. 
  -- Possible values: true/false. 
  -- Default: true 
  fullscreen = true,

  -- Fullscreen type
  -- Which type of fullscreen mode should be used.
  -- Changing this might help with screen capture issues.
  -- Possible values: "desktop"/"exclusive".
  -- Default: "desktop" 
  fullscreentype = "desktop", 


  -- Graphics options ----

  -- VSYNC (Vertical sync)
  -- Whether or not the game should run with vsync (which makes sure that the games framerate is synced with the monitors framerate)
  -- Toggle this if you have issues with "screen tearing"
  -- Possible Values: true/false.
  -- Default: true
  vsync = true,

  -- MSAA (Anti-Aliasing)
  -- Which level of anti-aliasing to use.
  -- Lower numbers increase performance, but might make edges look less smooth
  -- Higher values might make edges look smoother, but will increases performance requirements
  -- Note that some graphics cards might not support all the given values!
  -- Possible values: 0, 2, 4, 8, 16 
  -- Default: 2
  msaa = 2,
}


