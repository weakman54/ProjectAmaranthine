--
-- This is the configuration file for EverEnd
-- Here you can set options for how the game should run
-- 
-- Keep in mind that these settings are not checked, so
-- Some values might cause crashes (like negative window sizes for example)
-- Make sure to double check your numbers and keep the commas at the end of the line!
-- 
-- If your game is not working because of changes made in this file, you can safely
-- delete it and it will be restored to a default state next time you run the game
--
return {
  -- Controller options --
  -- Vibration
  -- Whether or not to enable vibration for the controller
  -- Possible values: true/false
  -- Default: true
  controllerVibration = true,
  
  
  -- Window Size: -------
  -- (Note that the game is optimized for 1920 by 1080 (full HD))

  -- Width
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


