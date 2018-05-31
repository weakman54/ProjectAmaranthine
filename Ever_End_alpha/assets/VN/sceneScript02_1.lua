

local RM = require 'resourceManager.resourceManager'

RM.prefix = "assets/"
local EndIdle   = RM:loadAnimation("Player/Player_idle_")
--local EndAttack = RM:loadAnimation("Player/Player_attack_hit_")
local RobotIdle = RM:loadAnimation("Quit1/Quit1_idle_")
local QuitIdle  = RM:loadAnimation("Quit2/Quit2_idle_")

local Gas  = RM:loadAnimation("FX/Gas_")


RM.prefix = 'assets/VN/scene02_1_quitsDirtyTrick/'

local robotRoom = RM:loadAnimation("robot_room_")
local robotRoomBlur = RM:loadAnimation("robot_room_blur_")

local robotInside = RM:loadAnimation("inside_robot_")
local robotInsideBlur = RM:loadAnimation("inside_robot_blur_")

local EndHit = RM:loadAnimation("Player_attack_hit_")
EndHit.data:setLooping(false)

local White = RM:loadAnimation("white")


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
          [1] = "timer",
          [2] = 1,
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
			{"Intense Moment"},
        },
        anims = {
          EndDetermined = RM:loadAnimation("s02_1_p002_m01_EndDetermined_")
        },
        transitionTrigger = {
          [1] = "timer",
          [2] = 1,
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
			{"Intense Approach"},
        },
        anims = {
          EndRunning = RM:loadAnimation("s02_1_p003_m01_EndRunning_")
        },
        transitionTrigger = {
          [1] = "timer",
          [2] = 1,
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
			{"Glass Break"},
        },
        anims = {
          EndWindow = RM:loadAnimation("s02_1_p004_m01_EndWindow_")
        },
        transitionTrigger = {
          [1] = "timer",
          [2] = 1,
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
          EndIdle = EndIdle,
          QuitIdle = QuitIdle,
          TextBox = RM:loadAnimation('s02_1_p005_m01_TextBox_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "QuitIdle",
          },
          [2] = {
            anim = "EndIdle",
          },
          [3] = {
            anim = "TextBox",
          },
        },
      },
      -- Removed moment
--      [2] = {
--        sounds = {
--        },
--        anims = {
--          EndIdle = EndIdle,
--          QuitIdle = QuitIdle,
--          TextBox = RM:loadAnimation('s02_1_p005_m02_TextBox_'),
--        },
--        transitionTrigger = {
--          [1] = "waitForInput",
--        },
--        drawData = {
--          [1] = {
--            anim = "QuitIdle",
--          },
--          [2] = {
--            anim = "EndIdle",
--          },
--          [3] = {
--            anim = "TextBox",
--          },
--        },
--      },
      
      
  --All following moments are offset -1 to function in code
      
      [2] = {
        sounds = {
        },
        anims = {
          EndIdle = EndIdle,
          QuitIdle = QuitIdle,
          TextBox = RM:loadAnimation('s02_1_p005_m03_TextBox_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "QuitIdle",
          },
          [2] = {
            anim = "EndIdle",
          },
          [3] = {
            anim = "TextBox",
          },
        },
      },
      [3] = {
        sounds = {
        },
        anims = {
          EndIdle = EndIdle,
          QuitIdle = QuitIdle,
          TextBox = RM:loadAnimation('s02_1_p005_m04_TextBox_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "QuitIdle",
          },
          [2] = {
            anim = "EndIdle",
          },
          [3] = {
            anim = "TextBox",
          },
        },
      },
      [4] = {
        sounds = {
        },
        anims = {
          TextBox = RM:loadAnimation('s02_1_p005_m05_TextBox_'),
          EndIdle = EndIdle,
          QuitIdle = QuitIdle,
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [3] = {
            anim = "TextBox",
          },
          [2] = {
            anim = "QuitIdle",
          },
          [1] = {
            anim = "EndIdle",
          },
        },
      },
      [5] = {
        sounds = {
        },
        anims = {
          EndWindup = RM:loadAnimation("s02_1_p005_m06_EndWindup_"),
          QuitIdle = QuitIdle,
        },
        transitionTrigger = {
          [1] = "timer",
          [2] = 1,
        },
        drawData = {
          [2] = {
            anim = "EndWindup",
          },
          [1] = {
            anim = "QuitIdle",
          },
        },
      },
      [6] = {
        sounds = {
			{"Quit Stare"},
        },
        anims = {
          EndWindup = RM:loadAnimation("s02_1_p005_m06_EndWindup_"),
          QuitIdle = QuitIdle,
          QuitOverLay = RM:loadAnimation('s02_1_p005_m07_QuitOverlay_'),
        },
        transitionTrigger = {
          [1] = "timer",
          [2] = 0.5,
        },
        drawData = {
          [1] = {
            anim = "EndWindup",
          },
          [2] = {
            anim = "QuitIdle",
          },
          [3] = {
            anim = "QuitOverLay",
          },
        },
      },
      [7] = {
        sounds = {
			{"Fire1"},
        },
        anims = {
          EndWindup =  RM:loadAnimation("s02_1_p005_m06_EndWindup_"),
          QuitIdle = QuitIdle,
          BarrelWhole = RM:loadAnimation('s02_1_p005_m08_BarrelWhole_'),
        },
        transitionTrigger = {
          [1] = "timer",
          [2] = 1,
        },
        drawData = {
          [1] = {
            anim = "QuitIdle",
          },
          [3] = {
            anim = "EndWindup",
          },
          [2] = {
            anim = "BarrelWhole",
            x = 100,
            y = 100,
            tween = {1, {x = 0, y = 0}, "out-cubic"},
          },
        },
      },
      [8] = {
        sounds = {
			{"Slashed Barrel"},
        },
        anims = {
          EndHit = EndHit,
          QuitIdle = QuitIdle,
          BarrelBroken = RM:loadAnimation('s02_1_p005_m09_BarrelBroken_'),
          Gas = Gas,
          White = White,
        },
        transitionTrigger = {
          [1] = "timer",
          [2] = 2
        },
        drawData = {
          [1] = {
            anim = "QuitIdle",
          },
          [2] = {
            anim = "EndHit",
            looping = false,
          },
          [3] = {
            anim = "BarrelBroken",
          },
          [4] = {
            anim = "Gas",
            alpha = 0,
            tween = {2, {alpha = 1}, "out-quart"},
          },
          [5] = {
            anim = "White",
            alpha = 1,
            tween = {1, {alpha = 0}, "out-quart"},
          },
        },
      },
      [9] = {
        sounds = {
			{"Earth2"},
        },
        anims = {
          EndOverlay = RM:loadAnimation('s02_1_p005_m10_EndOverlay_'),
          EndIdle = EndIdle,
          QuitIdle = QuitIdle,
          Gas = Gas,
        },
        transitionTrigger = {
          [1] = "timer",
          [2] = 1,
        },
        drawData = {
          [1] = {
            anim = "QuitIdle",
          },
          [2] = {
            anim = "EndIdle",
          },
          [3] = {
            anim = "EndOverlay",
          },
          [4] = {
            anim = "Gas",
          },
        },
      },
      [10] = {
        sounds = {
        },
        anims = {
          TextBox = RM:loadAnimation('s02_1_p005_m11_TextBox_'),
          EndIdle = EndIdle,
          QuitIdle = QuitIdle,
          Gas = Gas,
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "QuitIdle",
          },
          [2] = {
            anim = "EndIdle",
          },
          [3] = {
            anim = "TextBox",
          },
          [4] = {
            anim = "Gas",
          },
        },
      },
      [11] = {
        sounds = {
			{"Earth2"},
        },
        anims = {
          ZeroOverlay = RM:loadAnimation('s02_1_p005_m12_ZeroOverlay_'),
          EndIdle = EndIdle,
          QuitIdle = QuitIdle,
          Gas = Gas,
        },
        transitionTrigger = {
          [1] = "timer",
          [2] = 1,
        },
        drawData = {
          [1] = {
            anim = "QuitIdle",
          },
          [2] = {
            anim = "EndIdle",
          },
          [3] = {
            anim = "ZeroOverlay",
          },
          [4] = {
            anim = "Gas",
          },
        },
      },
      [12] = {
        sounds = {
        },
        anims = {
          TextBox = RM:loadAnimation('s02_1_p005_m13_TextBox_'),
          EndIdle = EndIdle,
          QuitIdle = QuitIdle,
          Gas = Gas,
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "QuitIdle",
          },
          [2] = {
            anim = "EndIdle",
          },
          [3] = {
            anim = "TextBox",
          },
          [4] = {
            anim = "Gas",
          },
        },
      },
      [13] = {
        sounds = {
        },
        anims = {
          TextBox = RM:loadAnimation('s02_1_p005_m14_TextBox_'),
          EndIdle = EndIdle,
          QuitIdle = QuitIdle,
          Gas = Gas,
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "QuitIdle",
          },
          [2] = {
            anim = "EndIdle",
          },
          [3] = {
            anim = "TextBox",
          },
          [4] = {
            anim = "Gas",
          },
        },
      },

            [14] = {
        sounds = {
        },
        anims = {
          TextBox = RM:loadAnimation('s02_1_p005_m15_TextBox_'),
          EndIdle = EndIdle,
          QuitIdle = QuitIdle,
          Gas = Gas,
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "QuitIdle",
          },
          [2] = {
            anim = "EndIdle",
          },
          [3] = {
            anim = "TextBox",
          },
          [4] = {
            anim = "Gas",
          },
        },
      },
            [15] = {
        sounds = {
        },
        anims = {
          TextBox = RM:loadAnimation('s02_1_p005_m16_TextBox_'),
          EndIdle = EndIdle,
          QuitIdle = QuitIdle,
          Gas = Gas,
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "QuitIdle",
          },
          [2] = {
            anim = "EndIdle",
          },
          [3] = {
            anim = "TextBox",
          },
          [4] = {
            anim = "Gas",
          },
        },
      },
            [16] = {
        sounds = {
        },
        anims = {
          TextBox = RM:loadAnimation('s02_1_p005_m17_TextBox_'),
          EndIdle = EndIdle,
          QuitIdle = QuitIdle,
          Gas = Gas,
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "QuitIdle",
          },
          [2] = {
            anim = "EndIdle",
          },
          [3] = {
            anim = "TextBox",
          },
          [4] = {
            anim = "Gas",
          },
        },
      },
            [17] = {
        sounds = {
        },
        anims = {
          TextBox = RM:loadAnimation('s02_1_p005_m18_TextBox_'),
          EndIdle = EndIdle,
          QuitIdle = QuitIdle,
          Gas = Gas,
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "QuitIdle",
          },
          [2] = {
            anim = "EndIdle",
          },
          [3] = {
            anim = "TextBox",
          },
          [4] = {
            anim = "Gas",
          },
        },
      },
            [18] = {
        sounds = {
        },
        anims = {
          TextBox = RM:loadAnimation('s02_1_p005_m19_TextBox_'),
          EndIdle = EndIdle,
          QuitIdle = QuitIdle,
          Gas = Gas,
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "QuitIdle",
          },
          [2] = {
            anim = "EndIdle",
          },
          [3] = {
            anim = "TextBox",
          },
          [4] = {
            anim = "Gas",
          },
        },
      },
            [19] = {
        sounds = {
        },
        anims = {
          TextBox = RM:loadAnimation('s02_1_p005_m20_TextBox_'),
          EndIdle = EndIdle,
          QuitIdle = QuitIdle,
          Gas = Gas,
        },
        transitionTrigger = {
          [1] = "waitForInput",
          enemyToGoTo = "enemyQuit2"
        },
        drawData = {
          [1] = {
            anim = "QuitIdle",
          },
          [2] = {
            anim = "EndIdle",
          },
          [3] = {
            anim = "TextBox",
          },
          [4] = {
            anim = "Gas",
          },
        },
      },
    },
  },
}