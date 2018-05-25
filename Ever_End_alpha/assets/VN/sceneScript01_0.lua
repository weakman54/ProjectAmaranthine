
local RM = require 'resourceManager.resourceManager'
RM.prefix = 'assets/VN/scene01_0_endAndZeroArgue/'


local White = RM:loadAnimation("white")

local ElevatorBackground = RM:loadAnimation('Elevator_room_')
local ElevatorBackgroundBlur = RM:loadAnimation('Elevator_room_blur_')

local QuitRoomBackground = RM:loadAnimation('quit_quarters_')
local QuitRoomBackgroundBlur = RM:loadAnimation('quit_quarters_blur_')


return {
  [1] = {
    bg = {
      anim = RM:loadAnimation('s01_0_p001_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          TextBox = RM:loadAnimation('s01_0_p001_m01_TextBox_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "TextBox",
          },
        },
      },
      [2] = {
        sounds = {
        },
        anims = {
          ZeroHand = RM:loadAnimation('s01_0_p001_m02_ZeroHand_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "ZeroHand",
          },
        },
      },
    },
  },
  [2] = {
    bg = {
      anim = ElevatorBackgroundBlur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          EndZero = RM:loadAnimation('s01_0_p002_m01_EndZero_'),
          YawnFX = RM:loadAnimation('s01_0_p002_m01_YawnFX_'),
          ElevatorRight = RM:loadAnimation('s01_0_p002_m01_ElevatorRight_'),
          ElevatorLeft = RM:loadAnimation('s01_0_p002_m01_ElevatorLeft_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "EndZero",
          },
          [2] = {
            anim = "YawnFX",
          },
          [3] = {
            anim = "ElevatorLeft",
          },
          [4] = {
            anim = "ElevatorRight",
          },
        },
      },
    },
  },
  [3] = {
    bg = {
      anim = QuitRoomBackground,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s01_0_p003_m01_Box_'),
          EndZero = RM:loadAnimation('s01_0_p003_m01_EndZero_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "EndZero",
          },
        },
      },
    },
  },
  [4] = {
    bg = {
      anim = QuitRoomBackgroundBlur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s01_0_p004_m01_Box_'),
          QuitPainting = RM:loadAnimation('s01_0_p004_m01_QuitPainting_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "QuitPainting",
          },
        },
      },
    },
  },
  [5] = {
    bg = {
      anim = QuitRoomBackgroundBlur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Trophies = RM:loadAnimation('s01_0_p005_m01_Trophies_'),
          Box = RM:loadAnimation('s01_0_p005_m01_Box_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "Trophies",
          },
        },
      },
    },
  },
  [6] = {
    bg = {
      anim = QuitRoomBackgroundBlur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          QuitPhoto = RM:loadAnimation('s01_0_p006_m01_QuitPhoto_'),
          Box = RM:loadAnimation('s01_0_p006_m01_Box_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "QuitPhoto",
          },
        },
      },
    },
  },
  [7] = {
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          EndRollEyes = RM:loadAnimation('s01_0_p007_m01_EndRollEyes_'),
          TextBox = RM:loadAnimation('s01_0_p007_m01_TextBox_'),
          Box = RM:loadAnimation('s01_0_p007_m01_Box_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "EndRollEyes",
          },
          [3] = {
            anim = "TextBox",
          },
        },
      },
    },
  },
  [8] = {
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s01_0_p008_m01_Box_'),
          Zero = RM:loadAnimation('s01_0_p008_m01_Zero_'),
          Kitty = RM:loadAnimation('s01_0_p008_m01_Kitty_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "Kitty",
          },
          [3] = {
            anim = "Zero",
          },
        },
      },
      [2] = {
        sounds = {
        },
        anims = {
          KittyZoom = RM:loadAnimation('s01_0_p008_m02_KittyZoom_'),
          BoxZoom = RM:loadAnimation('s01_0_p008_m02_BoxZoom_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "BoxZoom",
          },
          [2] = {
            anim = "KittyZoom",
          },
        },
      },
    },
  },
  [9] = {
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s01_0_p009_m01_Box_'),
          Zero = RM:loadAnimation('s01_0_p009_m01_Zero_'),
          Text = RM:loadAnimation('s01_0_p009_m01_Text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "Text",
          },
          [3] = {
            anim = "Zero",
          },
        },
      },
    },
  },
  [10] = {
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          ZeroKitty = RM:loadAnimation('s01_0_p010_m01_ZeroKitty_'),
          Box = RM:loadAnimation('s01_0_p010_m01_Box_'),
          End = RM:loadAnimation('s01_0_p010_m01_End_'),
          Text = RM:loadAnimation('s01_0_p010_m01_Text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "End",
          },
          [3] = {
            anim = "Text",
          },
          [4] = {
            anim = "ZeroKitty",
          },
        },
      },
    },
  },
  [11] = {
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s01_0_p011_m01_Box_'),
          End = RM:loadAnimation('s01_0_p011_m01_End_'),
          Text = RM:loadAnimation('s01_0_p011_m01_Text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "End",
          },
          [3] = {
            anim = "Text",
          },
        },
      },
    },
  },
  [12] = {
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Zero = RM:loadAnimation('s01_0_p012_m01_Zero_'),
          Box = RM:loadAnimation('s01_0_p012_m01_Box_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "Zero",
          },
        },
      },
    },
  },
  [13] = {
    bg = {
      anim = QuitRoomBackgroundBlur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Kitty = RM:loadAnimation('s01_0_p013_m01_Kitty_'),
          Box = RM:loadAnimation('s01_0_p013_m01_Box_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "Kitty",
          },
        },
      },
      [2] = {
        sounds = {
        },
        anims = {
          KittyEye = RM:loadAnimation('s01_0_p013_m02_KittyEye_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "KittyEye",
          },
        },
      },
    },
  },
  [14] = {
    bg = {
      anim = RM:loadAnimation('s01_0_p014_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          SoldierEye = RM:loadAnimation('s01_0_p014_m01_SoldierEye_'),
          Box = RM:loadAnimation('s01_0_p014_m01_Box_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "SoldierEye",
          },
        },
      },
      [2] = {
        sounds = {
        },
        anims = {
          SoldierZoomout = RM:loadAnimation('s01_0_p014_m02_SoldierZoomout_'),
          Box = RM:loadAnimation('s01_0_p014_m02_Box_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "SoldierZoomout",
          },
        },
      },
    },
  },
  [15] = {
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          EndKicking = RM:loadAnimation('s01_0_p015_m01_EndKicking_'),
          ZeroScared = RM:loadAnimation('s01_0_p015_m01_ZeroScared_'),
          Box = RM:loadAnimation('s01_0_p015_m01_Box_'),
          Effect = RM:loadAnimation('s01_0_p015_m01_Effect_'),
          Kitty = RM:loadAnimation('s01_0_p015_m01_Kitty_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "Effect",
          },
          [3] = {
            anim = "EndKicking",
          },
          [4] = {
            anim = "Kitty",
          },
          [5] = {
            anim = "ZeroScared",
          },
        },
      },
    },
  },
  [16] = {
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Zero = RM:loadAnimation('s01_0_p016_m01_Zero_'),
          Box = RM:loadAnimation('s01_0_p016_m01_Box_'),
          End = RM:loadAnimation('s01_0_p016_m01_End_'),
          Text = RM:loadAnimation('s01_0_p016_m01_Text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "End",
          },
          [3] = {
            anim = "Text",
          },
          [4] = {
            anim = "Zero",
          },
        },
      },
      [2] = {
        sounds = {
        },
        anims = {
          Zero = RM:loadAnimation('s01_0_p016_m02_Zero_'),
          Box = RM:loadAnimation('s01_0_p016_m02_Box_'),
          End = RM:loadAnimation('s01_0_p016_m02_End_'),
          Kitty = RM:loadAnimation('s01_0_p016_m02_Kitty_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "End",
          },
          [3] = {
            anim = "Kitty",
          },
          [4] = {
            anim = "Zero",
          },
        },
      },
    },
  },
  [17] = {
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Zero = RM:loadAnimation('s01_0_p017_m01_Zero_'),
          Box = RM:loadAnimation('s01_0_p017_m01_Box_'),
          End = RM:loadAnimation('s01_0_p017_m01_End_'),
          Kitty = RM:loadAnimation('s01_0_p017_m01_Kitty_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "End",
          },
          [3] = {
            anim = "Kitty",
          },
          [4] = {
            anim = "Zero",
          },
        },
      },
      [2] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s01_0_p017_m02_Box_'),
          End = RM:loadAnimation('s01_0_p017_m02_End_'),
          Zero = RM:loadAnimation('s01_0_p017_m02_Zero_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "End",
          },
          [3] = {
            anim = "Zero",
          },
        },
      },
    },
  },
  [18] = {
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          EndFlashback = RM:loadAnimation('s01_0_p018_m01_EndFlashback_'),
          End = RM:loadAnimation('s01_0_p018_m01_End_'),
          Box = RM:loadAnimation('s01_0_p018_m01_Box_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "EndFlashback",
          },
          [3] = {
            anim = "End",
          },
        },
      },
    },
  },
  [19] = {
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s01_0_p019_m01_Box_'),
          Effect = RM:loadAnimation('s01_0_p019_m01_Effect_'),
          Zero = RM:loadAnimation('s01_0_p019_m01_Zero_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "Effect",
          },
          [3] = {
            anim = "Zero",
          },
        },
      },
    },
  },
  [20] = {
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s01_0_p020_m01_Box_'),
          Text = RM:loadAnimation('s01_0_p020_m01_Text_'),
          EndZero = RM:loadAnimation('s01_0_p020_m01_EndZero_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "EndZero",
          },
          [3] = {
            anim = "Text",
          },
        },
      },
    },
  },
  [21] = {
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          s27effect1 = RM:loadAnimation('s01_0_p021_m01_s27effect1_'),
          s27effect2 = RM:loadAnimation('s01_0_p021_m01_s27effect2_'),
          Box = RM:loadAnimation('s01_0_p021_m01_Box_'),
          EndPullingZero = RM:loadAnimation('s01_0_p021_m01_EndPullingZero_'),
          Text = RM:loadAnimation('s01_0_p021_m01_Text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "EndPullingZero",
          },
          [3] = {
            anim = "Text",
          },
          [4] = {
            anim = "s27effect1",
          },
          [5] = {
            anim = "s27effect2",
          },
        },
      },
    },
  },
  [22] = {
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s01_0_p022_m01_Box_'),
          ZeroAngry = RM:loadAnimation('s01_0_p022_m01_ZeroAngry_'),
          Text = RM:loadAnimation('s01_0_p022_m01_Text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "Text",
          },
          [3] = {
            anim = "ZeroAngry",
          },
        },
      },
    },
  },
  [23] = {
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation('s01_0_p023_m01_End_'),
          Box = RM:loadAnimation('s01_0_p023_m01_Box_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "End",
          },
        },
      },
    },
  },
  [24] = {
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          ZeroCrying = RM:loadAnimation('s01_0_p024_m01_ZeroCrying_'),
          Box = RM:loadAnimation('s01_0_p024_m01_Box_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "ZeroCrying",
          },
        },
      },
    },
  },
  [25] = {
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          ZeroBiteFX = RM:loadAnimation('s01_0_p025_m01_ZeroBiteFX_'),
          ZeroBiting = RM:loadAnimation('s01_0_p025_m01_ZeroBiting_'),
          Box = RM:loadAnimation('s01_0_p025_m01_Box_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "ZeroBiteFX",
          },
          [3] = {
            anim = "ZeroBiting",
          },
        },
      },
    },
  },
  [26] = {
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          ZeroPullingAway = RM:loadAnimation('s01_0_p026_m01_ZeroPullingAway_'),
          EndPullingAway = RM:loadAnimation('s01_0_p026_m01_EndPullingAway_'),
          Box = RM:loadAnimation('s01_0_p026_m01_Box_'),
          PullFX = RM:loadAnimation('s01_0_p026_m01_PullFX_'),
          Text = RM:loadAnimation('s01_0_p026_m01_Text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "EndPullingAway",
          },
          [3] = {
            anim = "PullFX",
          },
          [4] = {
            anim = "Text",
          },
          [5] = {
            anim = "ZeroPullingAway",
          },
        },
      },
    },
  },
  [27] = {
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s01_0_p027_m01_Box_'),
          ZeroShouting = RM:loadAnimation('s01_0_p027_m01_ZeroShouting_'),
          Text = RM:loadAnimation('s01_0_p027_m01_Text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "Text",
          },
          [3] = {
            anim = "ZeroShouting",
          },
        },
      },
    },
  },
  [28] = {
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s01_0_p028_m01_Box_'),
          End = RM:loadAnimation('s01_0_p028_m01_End_'),
          Text = RM:loadAnimation('s01_0_p028_m01_Text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "End",
          },
          [3] = {
            anim = "Text",
          },
        },
      },
    },
  },
  [29] = {
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation('s01_0_p029_m01_End_'),
          Text = RM:loadAnimation('s01_0_p029_m01_Text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "End",
          },
          [2] = {
            anim = "Text",
          },
        },
      },
    },
  },
  [30] = {
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          ZeroCry = RM:loadAnimation('s01_0_p030_m01_ZeroCry_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "ZeroCry",
          },
        },
      },
    },
  },
  [31] = {
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          EndHolding = RM:loadAnimation('s01_0_p031_m01_EndHolding_'),
          Box = RM:loadAnimation('s01_0_p031_m01_Box_'),
          ZeroWalkAway = RM:loadAnimation('s01_0_p031_m01_ZeroWalkAway_'),
          Text = RM:loadAnimation('s01_0_p031_m01_Text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "EndHolding",
          },
          [3] = {
            anim = "Text",
          },
          [4] = {
            anim = "ZeroWalkAway",
          },
        },
      },
    },
  },
  [32] = {
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Zero = RM:loadAnimation('s01_0_p032_m01_Zero_'),
          Box = RM:loadAnimation('s01_0_p032_m01_Box_'),
          End = RM:loadAnimation('s01_0_p032_m01_End_'),
          Text = RM:loadAnimation('s01_0_p032_m01_Text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "End",
          },
          [3] = {
            anim = "Text",
          },
          [4] = {
            anim = "Zero",
          },
        },
      },
    },
  },
  [33] = {
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          EndKicked = RM:loadAnimation('s01_0_p033_m01_EndKicked_'),
          Box = RM:loadAnimation('s01_0_p033_m01_Box_'),
          ZeroKicking = RM:loadAnimation('s01_0_p033_m01_ZeroKicking_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "EndKicked",
          },
          [3] = {
            anim = "ZeroKicking",
          },
        },
      },
    },
  },
  [34] = {
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Text = RM:loadAnimation('s01_0_p034_m01_Text_'),
          Box = RM:loadAnimation('s01_0_p034_m01_Box_'),
          ZeroRunning = RM:loadAnimation('s01_0_p034_m01_ZeroRunning_'),
          EndSurprised = RM:loadAnimation('s01_0_p034_m01_EndSurprised_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "EndSurprised",
          },
          [3] = {
            anim = "Text",
          },
          [4] = {
            anim = "ZeroRunning",
          },
        },
      },
    },
  },
  [35] = {
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          EndShouting = RM:loadAnimation('s01_0_p035_m01_EndShouting_'),
          Box = RM:loadAnimation('s01_0_p035_m01_Box_'),
          Text = RM:loadAnimation('s01_0_p035_m01_Text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "EndShouting",
          },
          [3] = {
            anim = "Text",
          },
        },
      },
    },
  },
  [36] = {
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s01_0_p036_m01_Box_'),
          End = RM:loadAnimation('s01_0_p036_m01_End_'),
          ZeroRunning = RM:loadAnimation('s01_0_p036_m01_ZeroRunning_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "End",
          },
          [3] = {
            anim = "ZeroRunning",
          },
        },
      },
    },
  },
  [37] = {
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          ZeroRunning = RM:loadAnimation('s01_0_p037_m01_ZeroRunning_'),
          Box = RM:loadAnimation('s01_0_p037_m01_Box_'),
          EndChasing = RM:loadAnimation('s01_0_p037_m01_EndChasing_'),
          Text = RM:loadAnimation('s01_0_p037_m01_Text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
          gotoScene = "2_0",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "EndChasing",
          },
          [3] = {
            anim = "Text",
          },
          [4] = {
            anim = "ZeroRunning",
          },
        },
      },
    },
  },
}
