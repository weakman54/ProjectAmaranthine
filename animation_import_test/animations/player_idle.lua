local animationData = {}

animationData.texture       = love.graphics.newImage("animations/player_idle.png") -- TODO: insert correct filepath manually!
local image = animationData.texture
animationData.textureWidth  = 1024
animationData.textureHeight = 2048

animationData.frameData = {}
local fd = animationData.frameData
local cf -- currentFrame

------------------------------
table.insert(fd, { name="player idle 01", quad = love.graphics.newQuad(0, 0, 715, 1275, image:getDimensions()), sourceOffsetX = 621, sourceOffsetY = 0, sourceWidth = 1336, sourceHeight = 2354 })
cf = fd[#fd]
cf.pivotX = cf.sourceWidth  / 2 - cf.sourceOffsetX
cf.pivotY = cf.sourceHeight / 2 - cf.sourceOffsetY
cf.frameTime = 0.3 -- (seconds) -- TODO: Fix magic number! -- TODO: set manually (if needed)
cf.screenPosX = 300 -- TODO: set manually!
cf.screenPosY = 1300 -- TODO: set manually!

------------------------------
table.insert(fd, { name="player idle 02", quad = love.graphics.newQuad(0, 0, 715, 1275, image:getDimensions()), sourceOffsetX = 609, sourceOffsetY = 0, sourceWidth = 1324, sourceHeight = 2498 })
cf = fd[#fd]
cf.pivotX = cf.sourceWidth  / 2 - cf.sourceOffsetX
cf.pivotY = cf.sourceHeight / 2 - cf.sourceOffsetY
cf.frameTime = 0.3 -- (seconds) -- TODO: Fix magic number! -- TODO: set manually (if needed)
cf.screenPosX = 300 -- TODO: set manually!
cf.screenPosY = 1300 -- TODO: set manually!


return animationData