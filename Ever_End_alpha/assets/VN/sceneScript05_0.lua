
local RM = require 'resourceManager.resourceManager'
RM.prefix = 'assets/VN/Scene05_0_credits/'

local creditsHeight = 10312
local endHeight = creditsHeight - H - 200 -- TODO: make sure this works with scaling HARDCODED edge offset

local endBuffer = 5

local pxPerSec = 100
local creditsDuration = (endHeight / pxPerSec) + endBuffer

local songDuration = 128
creditsDuration = songDuration
pxPerSec = endHeight / creditsDuration

return {
  [1] = {
    bg = {
      anim = RM:loadAnimation('credits'),
      x = 0,
      y = 0,
    },
    moments = {
      [1] = {
        sounds = {
        },
        music = "Stars From Another World",
        anims = {
        },
        transitionTrigger = {
          [1] = "timer",
          [2] = creditsDuration,
        },
        drawData = {
          bg = {
            tween = {creditsDuration, {y = -endHeight}},
          },
        },
      },
      [2] = {
        sounds = {
        },
        music = "stop",
        anims = {
        },
        transitionTrigger = {
          [1] = "timer",
          [2] = endBuffer,
          gotoScene = "00_0" -- Kind of hack but eh
        },
        drawData = {
        },
      },
    },
  },
}