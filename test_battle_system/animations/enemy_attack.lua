local animationData = {}

animationData.texture       = love.graphics.newImage("animations/enemy_attack.png")
local image = animationData.texture
animationData.textureWidth  = 4096
animationData.textureHeight = 4096

animationData.frameData = {}
local fd = animationData.frameData
local cf -- currentFrame

------------------------------
table.insert(fd, { name="enemy attack 1 startup", quad = love.graphics.newQuad(0, 2773, 375, 488, image:getDimensions()), sourceOffsetX = 151, sourceOffsetY = 0, sourceWidth = 526, sourceHeight = 948 })
cf = fd[#fd]
cf.pivotX = cf.sourceWidth  / 2 - cf.sourceOffsetX
cf.pivotY = cf.sourceHeight / 2 - cf.sourceOffsetY
cf.frameTime = 0.5 -- (seconds) -- TODO: Fix magic number! -- TODO: set manually (if needed)
cf.screenPosX = 1400 -- TODO: set manually!
cf.screenPosY = 800 -- TODO: set manually!

------------------------------
table.insert(fd, { name="enemy attack 2 flash", quad = love.graphics.newQuad(0, 0, 2364, 1580, image:getDimensions()), sourceOffsetX = 0, sourceOffsetY = 0, sourceWidth = 3252, sourceHeight = 2150 })
cf = fd[#fd]
cf.pivotX = cf.sourceWidth  / 2 - cf.sourceOffsetX
cf.pivotY = cf.sourceHeight / 2 - cf.sourceOffsetY
cf.frameTime = 0.5 -- (seconds) -- TODO: Fix magic number! -- TODO: set manually (if needed)
cf.screenPosX = 1400 -- TODO: set manually!
cf.screenPosY = 800 -- TODO: set manually!

------------------------------
table.insert(fd, { name="enemy attack 3", quad = love.graphics.newQuad(0, 1582, 2108, 726, image:getDimensions()), sourceOffsetX = 0, sourceOffsetY = 0, sourceWidth = 2754, sourceHeight = 1324 })
cf = fd[#fd]
cf.pivotX = cf.sourceWidth  / 2 - cf.sourceOffsetX
cf.pivotY = cf.sourceHeight / 2 - cf.sourceOffsetY
cf.frameTime = 0.2 -- (seconds) -- TODO: Fix magic number! -- TODO: set manually (if needed)
cf.screenPosX = 1400 -- TODO: set manually!
cf.screenPosY = 800 -- TODO: set manually!

------------------------------
table.insert(fd, { name="enemy attack 4 recovery", quad = love.graphics.newQuad(0, 2310, 537, 461, image:getDimensions()), sourceOffsetX = 0, sourceOffsetY = 0, sourceWidth = 554, sourceHeight = 902 })
cf = fd[#fd]
cf.pivotX = cf.sourceWidth  / 2 - cf.sourceOffsetX
cf.pivotY = cf.sourceHeight / 2 - cf.sourceOffsetY
cf.frameTime = 0.2 -- (seconds) -- TODO: Fix magic number! -- TODO: set manually (if needed)
cf.screenPosX = 1400 -- TODO: set manually!
cf.screenPosY = 800 -- TODO: set manually!


return animationData