
-- TODO: explain color properly, for now:
-- color is a property on both animations and text, and will tint stuff, it defaults to white, which is "no tint"

-- You can create variables like this, to store info
local dudeTweenDuration = 1

return {
  --[[
  loadImage:
  loads an  image into memory (does not actually show it!)
  
  the last brackets in the list are for optional options:
    pos    = {x, y} sets initial position of this image.
    offset = {x, y} sets initial offset.                offset is kindof like moving what you consider the "center" of the image, it starts at the top corner (0, 0), and its from there rotations and scaling happens
    rot    = angle  sets initial rotation of image.     (radians, can fix degrees if easier), these are done respective to the offset, so for the below bg, it will rotate around its (200, 200) point
    scale  = {x, y} sets initial scaling of the image.  {2, 2} will make the image double the size for example
  ]]
  { "loadImage", "bg1", "assets/bg1.png", {offset = {x = 200, y = 200}} }, -- Load an image with offset {x = 200, y = 200}, since the backgrounds have a border of 200 px
  { "loadImage", "bg2", "assets/bg2.png", {offset = {x = 200, y = 200}, rot = math.pi/50} } , -- Rotate this one, mostly to show of how its done

  --[[
  loadAnim + text, these work basically the same as loadImage, with the same options.
  
  text has two more options:
    width: a number.                  how wide of a "box" should we fit the text in?
    align: "left", "center", "right". sets the aligment inside of the box (NOTE: it aligns within the given width, so if the width is set to be wider than the text, there will be padding on both sides)
  
  Note that Images are technically just single frame animations, and that text can always be used in place of an animation (not always true the other way around! the width and align options must be set!)
  ]]  
  {"loadAnim", "dude", {"assets/thing.png", "assets/thing2.png"}, { color = {000, 255, 000} } }, -- Load an animation, the third item in the list is a list of filenames for the individual frames, will be simplified later
--  {"text", "dude", "this is text"}, -- If you comment the above line out (put -- infront of it), and use this line in instead (remove the -- infront of it), it will still work below

  {"loadSoundEffect", "absorb1", "assets/sounds/Absorb1.ogg"},
  {"loadSoundEffect", "absorb2", "assets/sounds/Absorb2.ogg"},



  {"setBG", "bg1"}, -- setBG, sets/switches the bg image (can be any animation (images are just one frame animations)
  {"waitForInput"}, -- waitForInput, pauses execution of the "script", to actually be able to show what we've put on screen

  {"play", "absorb2"},
  {"show", "dude"}, -- show, adds an animation or text to the list of stuff that is being drawn, note that order matters, the list is drawn "bottom-up", so stuff that is added first is draw at the "bottom-layer"
  {"waitForInput"},

  {"setBG", "bg2"},
  {"hide", "dude"}, -- hide, removes animation or text from the list of stuff being drawn
  {"waitForInput"},

  {"setPosition", "dude", 100, 100}, -- setPosition, changes the position of the thing
  {"show", "dude"},
  {"waitForInput"},

  {"setOffset", "dude", 40, 30}, -- setOffset, changes the offset of the thing

  --[[
  doTween:
    starts a tween for the thing
    the third item of the list is how long to do the tween, in seconds
    the fourth is a list of properties, and what "end-state" they should have, explained further down
    the fifth is the tween function, which is kindof the "feel" of the tween, "linear" means for example, "move straight from a to b, with no change in speed"
    
    so in this case, I'm saying: 
      change the "pos" property of "dude" from what it is now, to {x = 200, y = 200}, 
      do that over dudeTweenDuration seconds,
      and with the tween function "in-out-quad"
      
    examples of what the functions do here:
      http://easings.net/
      http://www.gizma.com/easing/
  ]]
  {"doTween", "dude", dudeTweenDuration, {pos = {x = 200, y = 200}}, 'in-out-quad'},
  {"play", "absorb1"},
  {"pauseExecution", dudeTweenDuration}, -- Stops executing for an amount of time, this is useful for making sure a bunch of stuff doesn't happen while your tweens are running for example
  {"setPosition", "dude", 100, 100}, -- This won't happen until the tween is done
  {"setFont", "condition", "assets/fonts/Condition-Regular.ttf", 40},  -- Load and set font
  {"addText", "temp", "You don't have to 'load' text, since it's not a 'heavy' resource like images or animations!", {width = 800, pos = {x = 400, y = 400}, color = {255, 000, 000} } },
  {"waitForInput"},
  
  {"removeText", "temp"},
  {"waitForInput"},
  
  {"changeScene", "fooscene"}
  
}