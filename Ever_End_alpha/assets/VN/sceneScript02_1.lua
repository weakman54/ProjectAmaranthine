

local RM = require 'resourceManager.resourceManager'

RM.prefix = "assets/"
local EndIdle   = RM:loadAnimation("Player/Player_idle_")
local RobotIdle = RM:loadAnimation("Quit1/Quit1_idle_")
local QuitIdle  = RM:loadAnimation("Quit2/Quit2_idle_")


RM.prefix = 'assets/VN/scene02_1_quitsDirtyTrick/'

local robotRoom = RM:loadAnimation("robot_room_")
local robotRoomBlur = RM:loadAnimation("robot_room_blur_")

local robotInside = RM:loadAnimation("inside_robot_")
local robotInsideBlur = RM:loadAnimation("inside_robot_blur_")


return {
  [1] = {
    bg = {
      anim = robotRoomBlur
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          EndIdle = EndIdle,
          RobotIdle = RobotIdle,
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "EndIdle",
          },
          [2] = {
            anim = "RobotIdle",
          },
        },
      },
    },
  },
  [2] = {
    bg = {
      anim = robotRoomBlur
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          EndDetermined = RM:loadAnimation("s02_1_p002_m01_EndDetermined_")
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "EndDetermined",
          },
        },
      },
    },
  },
  [3] = {
    bg = {
      anim = robotRoomBlur
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          EndRunning = RM:loadAnimation("s02_1_p003_m01_EndRunning_")
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "EndRunning",
          },
        },
      },
    },
  },
  [4] = {
    bg = {
      anim = robotInside
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          EndWindow = RM:loadAnimation("s02_1_p004_m01_EndWindow_")
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "EndWindow",
          },
        },
      },
    },
  },
  [5] = {
    bg = {
      anim = robotInside
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          bg = RM:loadAnimation('s02_1_p005_m02_bg_'),
          EndIdle = EndIdle,
          QuitIdle = QuitIdle,
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "bg",
          },
          [2] = {
            anim = "QuitIdle",
          },
          [3] = {
            anim = "EndIdle",
          },
        },
      },
      [2] = {
        sounds = {
        },
        anims = {
          bg = RM:loadAnimation('s02_1_p005_m03_bg_'),

          EndIdle = EndIdle,
          QuitIdle = QuitIdle,
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "bg",
          },
          [2] = {
            anim = "QuitIdle",
          },
          [3] = {
            anim = "EndIdle",
          },
        },
      },
      [3] = {
        sounds = {
        },
        anims = {
          bg = RM:loadAnimation('s02_1_p005_m04_bg_'),
          EndIdle = EndIdle,
          QuitIdle = QuitIdle,
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "bg",
          },
          [2] = {
            anim = "QuitIdle",
          },
          [3] = {
            anim = "EndIdle",
          },
        },
      },
      [4] = {
        sounds = {
        },
        anims = {
          bg = RM:loadAnimation('s02_1_p005_m05_bg_'),
          EndIdle = EndIdle,
          QuitIdle = QuitIdle,
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "bg",
          },
          [2] = {
            anim = "QuitIdle",
          },
          [3] = {
            anim = "EndIdle",
          },
        },
      },
      [5] = {
        sounds = {
        },
        anims = {
          bg = RM:loadAnimation('s02_1_p005_m06_bg_'),
          EndIdle = EndIdle,
          QuitIdle = QuitIdle,
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "bg",
          },
          [2] = {
            anim = "QuitIdle",
          },
          [3] = {
            anim = "EndIdle",
          },
        },
      },
      [6] = {
        sounds = {
        },
        anims = {
          bg = RM:loadAnimation('s02_1_p005_m07_bg_'),
          EndIdle = EndIdle,
          QuitIdle = QuitIdle,
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "bg",
          },
          [2] = {
            anim = "QuitIdle",
          },
          [3] = {
            anim = "EndIdle",
          },
        },
      },
      [7] = {
        sounds = {
        },
        anims = {
          bg = RM:loadAnimation('s02_1_p005_m08_bg_'),
          EndIdle = EndIdle,
          QuitIdle = QuitIdle,
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "bg",
          },
        },
      },
      [8] = {
        sounds = {
        },
        anims = {
          bg = RM:loadAnimation('s02_1_p005_m09_bg_'),
          EndIdle = EndIdle,
          QuitIdle = QuitIdle,
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "bg",
          },
          [2] = {
            anim = "QuitIdle",
          },
          [3] = {
            anim = "EndIdle",
          },
        },
      },
      [9] = {
        sounds = {
        },
        anims = {
          bg = RM:loadAnimation('s02_1_p005_m10_bg_'),
          EndIdle = EndIdle,
          QuitIdle = QuitIdle,
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "bg",
          },
          [2] = {
            anim = "QuitIdle",
          },
          [3] = {
            anim = "EndIdle",
          },
        },
      },
      [10] = {
        sounds = {
        },
        anims = {
          bg = RM:loadAnimation('s02_1_p005_m11_bg_'),
          EndIdle = EndIdle,
          QuitIdle = QuitIdle,
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "bg",
          },
          [2] = {
            anim = "QuitIdle",
          },
          [3] = {
            anim = "EndIdle",
          },
        },
      },
      [11] = {
        sounds = {
        },
        anims = {
          bg = RM:loadAnimation('s02_1_p005_m12_bg_'),
          EndIdle = EndIdle,
          QuitIdle = QuitIdle,
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "bg",
          },
          [2] = {
            anim = "QuitIdle",
          },
          [3] = {
            anim = "EndIdle",
          },
        },
      },
      [12] = {
        sounds = {
        },
        anims = {
          bg = RM:loadAnimation('s02_1_p005_m13_bg_'),
          EndIdle = EndIdle,
          QuitIdle = QuitIdle,
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "bg",
          },
          [2] = {
            anim = "QuitIdle",
          },
          [3] = {
            anim = "EndIdle",
          },
        },
      },
      [13] = {
        sounds = {
        },
        anims = {
          bg = RM:loadAnimation('s02_1_p005_m14_bg_'),
          EndIdle = EndIdle,
          QuitIdle = QuitIdle,
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "bg",
          },
          [2] = {
            anim = "QuitIdle",
          },
          [3] = {
            anim = "EndIdle",
          },
        },
      },
      [14] = {
        sounds = {
        },
        anims = {
          bg = RM:loadAnimation('s02_1_p005_m15_bg_'),
          EndIdle = EndIdle,
          QuitIdle = QuitIdle,
        },
        transitionTrigger = {
          [1] = "waitForInput",
          enemyToGoTo = "enemyQuit2"
        },
        drawData = {
          [1] = {
            anim = "bg",
          },
          [2] = {
            anim = "QuitIdle",
          },
          [3] = {
            anim = "EndIdle",
          },
        },
      },
    },
  },
}