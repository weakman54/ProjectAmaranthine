
local RM = require 'resourceManager.resourceManager'
RM.prefix = 'assets/VN/'

return {
  [1] = {
    bg = {
      anim = RM:loadAnimation('endMarker'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
        },
        transitionTrigger = {
          [1] = "waitForInput",
          gotoScene = "End",
        },
        drawData = {
        },
      },
    },
  },
}