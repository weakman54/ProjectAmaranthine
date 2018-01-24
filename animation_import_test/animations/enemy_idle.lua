local animationData = {}

animationData.texture       = love.graphics.newImage("animations/enemy_idle.png") -- TODO: insert correct filepath manually!
local image = animationData.texture
animationData.textureWidth  = 256
animationData.textureHeight = 512

animationData.frameData = {}
local fd = animationData.frameData
local cf -- currentFrame

------------------------------
table.insert(fd, { name="enemy idle", quad = love.graphics.newQuad(0, 0, 209, 446, image:getDimensions()), sourceOffsetX = 165, sourceOffsetY = 0, sourceWidth = 374, sourceHeight = 852 })
cf = fd[#fd]
cf.pivotX = cf.sourceWidth  / 2 - cf.sourceOffsetX
cf.pivotY = cf.sourceHeight / 2 - cf.sourceOffsetY
cf.frameTime = 0.1 -- (seconds) -- TODO: Fix magic number! -- TODO: set manually (if needed)
cf.screenPosX = 1400 -- TODO: set manually!
cf.screenPosY = 800 -- TODO: set manually!


return animationData