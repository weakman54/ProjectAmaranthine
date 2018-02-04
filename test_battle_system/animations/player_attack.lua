local animationData = {}

animationData.texture       = love.graphics.newImage("animations/player_attack.png") -- TODO: insert correct filepath manually!
local image = animationData.texture
animationData.textureWidth  = 2048
animationData.textureHeight = 2048

animationData.frameData = {}
local fd = animationData.frameData
local cf -- currentFrame

------------------------------
table.insert(fd, { name="player attack", quad = love.graphics.newQuad(0, 0, 1388, 1208, image:getDimensions()), sourceOffsetX = 1238, sourceOffsetY = 0, sourceWidth = 2626, sourceHeight = 2278 })
cf = fd[#fd]
cf.pivotX = cf.sourceWidth  / 2 - cf.sourceOffsetX
cf.pivotY = cf.sourceHeight / 2 - cf.sourceOffsetY
cf.frameTime = 0.2 -- (seconds) -- TODO: Fix magic number! -- TODO: set manually (if needed)
cf.screenPosX = 300 -- TODO: set manually!
cf.screenPosY = 1300 -- TODO: set manually!


return animationData