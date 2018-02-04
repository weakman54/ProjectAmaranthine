local animationData = {}

animationData.texture       = love.graphics.newImage("animations/enemy_guard.png") -- TODO: insert correct filepath manually!
local image = animationData.texture
animationData.textureWidth  = 512
animationData.textureHeight = 1024

animationData.frameData = {}
local fd = animationData.frameData
local cf -- currentFrame

------------------------------
table.insert(fd, { name="enemy guard", quad = love.graphics.newQuad(0, 0, 313, 519, image:getDimensions()), sourceOffsetX = 169, sourceOffsetY = 0, sourceWidth = 482, sourceHeight = 1012 })
cf = fd[#fd]
cf.pivotX = cf.sourceWidth  / 2 - cf.sourceOffsetX
cf.pivotY = cf.sourceHeight / 2 - cf.sourceOffsetY
cf.frameTime = 0.3 -- (seconds) -- TODO: Fix magic number! -- TODO: set manually (if needed)
cf.screenPosX = 1400 -- TODO: set manually!
cf.screenPosY = 800 -- TODO: set manually!


return animationData