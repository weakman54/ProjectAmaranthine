local animationData = {}

animationData.texture       = love.graphics.newImage("animations/player_guard.png") -- TODO: insert correct filepath manually!
local image = animationData.texture
animationData.textureWidth  = 2048
animationData.textureHeight = 2048

animationData.frameData = {}
local fd = animationData.frameData
local cf -- currentFrame

------------------------------
table.insert(fd, { name="player guard 01", quad = love.graphics.newQuad(923, 0, 921, 1291, image:getDimensions()), sourceOffsetX = 883, sourceOffsetY = 0, sourceWidth = 1804, sourceHeight = 2514 })
cf = fd[#fd]
cf.pivotX = cf.sourceWidth  / 2 - cf.sourceOffsetX
cf.pivotY = cf.sourceHeight / 2 - cf.sourceOffsetY
cf.frameTime = 0.3 -- (seconds) -- TODO: Fix magic number! -- TODO: set manually (if needed)
cf.screenPosX = 300 -- TODO: set manually!
cf.screenPosY = 1300 -- TODO: set manually!

------------------------------
table.insert(fd, { name="player guard 02", quad = love.graphics.newQuad(0, 0, 921, 1291, image:getDimensions()), sourceOffsetX = 727, sourceOffsetY = 0, sourceWidth = 1648, sourceHeight = 2514 })
cf = fd[#fd]
cf.pivotX = cf.sourceWidth  / 2 - cf.sourceOffsetX
cf.pivotY = cf.sourceHeight / 2 - cf.sourceOffsetY
cf.frameTime = 0.3 -- (seconds) -- TODO: Fix magic number! -- TODO: set manually (if needed)
cf.screenPosX = 300 -- TODO: set manually!
cf.screenPosY = 1300 -- TODO: set manually!


return animationData