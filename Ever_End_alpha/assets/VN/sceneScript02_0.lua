
local RM = require 'resourceManager.resourceManager'
RM.prefix = 'assets/VN/scene02_0_quitEncounter/'

local background1 = RM:loadAnimation('Elevator_room_')
local background2 = RM:loadAnimation('quit_quarters_')
local background3 = RM:loadAnimation('robot_room_') 
local blur1 = RM:loadAnimation('Elevator_room_blur_')
local blur2 = RM:loadAnimation('quit_quarters_blur_')
local blur3 = RM:loadAnimation('robot_room_blur_')
return {
  [1] = {
    bg = {
      anim = background1,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Zero = RM:loadAnimation('s02_0_p001_m01_Zero_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Zero",
          },
        },
      },
    },
  },
  [2] = {
    bg = {
      anim = blur1,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Zero = RM:loadAnimation('s02_0_p002_m01_Zero_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Zero",
          },
        },
      },
    },
  },
  [3] = {
    bg = {
      anim = blur1,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Zero = RM:loadAnimation('s02_0_p003_m01_Zero_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Zero",
          },
        },
      },
    },
  },
  [4] = {
    bg = {
      anim = blur1,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Zero = RM:loadAnimation('s02_0_p004_m01_Zero_'),
          Table = RM:loadAnimation('s02_0_p004_m01_Table_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Table",
          },
          [2] = {
            anim = "Zero",
          },
        },
      },
    },
  },
  [5] = {
    bg = {
      anim = blur1,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation('s02_0_p005_m01_End_'),
          Hand = RM:loadAnimation('s02_0_p005_m01_Hand_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "End",
          },
          [2] = {
            anim = "Hand",
          },
        },
      },
    },
  },
  [6] = {
    bg = {
      anim = blur1,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation('s02_0_p006_m01_End_'),
          Zero = RM:loadAnimation('s02_0_p006_m01_Zero_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "End",
          },
          [2] = {
            anim = "Zero",
          },
        },
      },
    },
  },
  [7] = {
    bg = {
      anim = blur1,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End_Zero_Table = RM:loadAnimation('s02_0_p007_m01_End_Zero_Table_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "End_Zero_Table",
          },
        },
      },
    },
  },
  [8] = {
    bg = {
      anim = blur1,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Zero = RM:loadAnimation('s02_0_p008_m01_Zero_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Zero",
          },
        },
      },
    },
  },
  [9] = {
    bg = {
      anim = blur1,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          ero = RM:loadAnimation('s02_0_p009_m01Zero_'),
          Table = RM:loadAnimation('s02_0_p009_m01_Table_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "ero",
          },
          [2] = {
            anim = "Table",
          },
        },
      },
    },
  },
  [10] = {
    bg = {
      anim = blur1,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Zero_Table = RM:loadAnimation('s02_0_p010_m01_Zero_Table_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Zero_Table",
          },
        },
      },
    },
  },
  [11] = {
    bg = {
      anim = background1,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Zero = RM:loadAnimation('s02_0_p011_m01_Zero_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Zero",
          },
        },
      },
    },
  },
  [12] = {
    bg = {
      anim = background2,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Zero = RM:loadAnimation('s02_0_p012_m01_Zero_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Zero",
          },
        },
      },
    },
  },
  [13] = {
    bg = {
      anim = blur2,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Zero = RM:loadAnimation('s02_0_p013_m01_Zero_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Zero",
          },
        },
      },
    },
  },
  [14] = {
    bg = {
      anim = blur2,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Kitty = RM:loadAnimation('s02_0_p014_m01_Kitty_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Kitty",
          },
        },
      },
    },
  },
  [15] = {
    bg = {
      anim = blur2,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Zero = RM:loadAnimation('s02_0_p015_m01_Zero_'),
          Quit = RM:loadAnimation('s02_0_p015_m01_Quit_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Quit",
          },
          [2] = {
            anim = "Zero",
          },
        },
      },
      [2] = {
        sounds = {
        },
        anims = {
          Zero = RM:loadAnimation('s02_0_p015_m02_Zero_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Zero",
          },
        },
      },
    },
  },
  [16] = {
    bg = {
      anim = blur2,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
        },
      },
    },
  },
  [17] = {
    bg = {
      anim = blur2,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit_Zero = RM:loadAnimation('s02_0_p017_m01_Quit_Zero_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Quit_Zero",
          },
        },
      },
    },
  },
  [18] = {
    bg = {
      anim = blur2,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit = RM:loadAnimation('s02_0_p018_m01_Quit_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Quit",
          },
        },
      },
    },
  },
  [19] = {
    bg = {
      anim = blur3,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation('s02_0_p019_m01_End_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "End",
          },
        },
      },
    },
  },
  [20] = {
    bg = {
      anim = blur3,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation('s02_0_p020_m01_End_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "End",
          },
        },
      },
    },
  },
  [21] = {
    bg = {
      anim = background3,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation('s02_0_p021_m01_End_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "End",
          },
        },
      },
    },
  },
  [22] = {
    bg = {
      anim = blur3,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation('s02_0_p022_m01_End_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "End",
          },
        },
      },
    },
  },
  [23] = {
    bg = {
      anim = blur3,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit_End = RM:loadAnimation('s02_0_p023_m01_Quit_End_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Quit_End",
          },
        },
      },
    },
  },
  [24] = {
    bg = {
      anim = blur3,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit = RM:loadAnimation('s02_0_p024_m01_Quit_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Quit",
          },
        },
      },
    },
  },
  [25] = {
    bg = {
      anim = blur3,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Zero = RM:loadAnimation('s02_0_p025_m01_Zero_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Zero",
          },
        },
      },
    },
  },
  [26] = {
    bg = {
      anim = blur3,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation('s02_0_p026_m01_End_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "End",
          },
        },
      },
    },
  },
  [27] = {
    bg = {
      anim = blur3,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation('s02_0_p027_m01_End_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "End",
          },
        },
      },
    },
  },
  [28] = {
    bg = {
      anim = blur3,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit_Zero = RM:loadAnimation('s02_0_p028_m01_Quit_Zero_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Quit_Zero",
          },
        },
      },
    },
  },
  [29] = {
    bg = {
      anim = blur3,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit_Zero = RM:loadAnimation('s02_0_p029_m01_Quit_Zero_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Quit_Zero",
          },
        },
      },
    },
  },
  [30] = {
    bg = {
      anim = blur3,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit = RM:loadAnimation('s02_0_p030_m01_Quit_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Quit",
          },
        },
      },
    },
  },
  [31] = {
    bg = {
      anim = blur3,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation('s02_0_p031_m01_End_'),
          Quit_Zero = RM:loadAnimation('s02_0_p031_m01_Quit_Zero_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "End",
          },
          [2] = {
            anim = "Quit_Zero",
          },
        },
      },
    },
  },
  [32] = {
    bg = {
      anim = blur3,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation('s02_0_p032_m01_End_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "End",
          },
        },
      },
    },
  },
  [33] = {
    bg = {
      anim = blur3,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Zero = RM:loadAnimation('s02_0_p033_m01_Zero_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Zero",
          },
        },
      },
    },
  },
  [34] = {
    bg = {
      anim = blur3,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit_Zero = RM:loadAnimation('s02_0_p034_m01_Quit_Zero_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Quit_Zero",
          },
        },
      },
      [2] = {
        sounds = {
        },
        anims = {
          Quit_Zero = RM:loadAnimation('s02_0_p034_m02_Quit_Zero_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Quit_Zero",
          },
        },
      },
    },
  },
  [35] = {
    bg = {
      anim = blur3,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit = RM:loadAnimation('s02_0_p035_m01_Quit_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Quit",
          },
        },
      },
    },
  },
  [36] = {
    bg = {
      anim = blur3,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation('s02_0_p036_m01_End_'),
          Effect = RM:loadAnimation('s02_0_p036_m01_Effect_'),
          Robot = RM:loadAnimation('s02_0_p036_m01_Robot_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Effect",
          },
          [2] = {
            anim = "End",
          },
          [3] = {
            anim = "Robot",
          },
        },
      },
    },
  },
  [37] = {
    bg = {
      anim = blur3,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End_Robot = RM:loadAnimation('s02_0_p037_m01_End_Robot_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "End_Robot",
          },
        },
      },
    },
  },
  [38] = {
    bg = {
      anim = blur3,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Robot = RM:loadAnimation('s02_0_p038_m01_Robot_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Robot",
          },
        },
      },
    },
  },
  [39] = {
    bg = {
      anim = blur3,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          obot = RM:loadAnimation('s02_0_p039_m01Robot_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "obot",
          },
        },
      },
    },
  },
  [40] = {
    bg = {
      anim = blur3,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation('s02_0_p040_m01_End_'),
          Robot = RM:loadAnimation('s02_0_p040_m01_Robot_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "End",
          },
          [2] = {
            anim = "Robot",
          },
        },
      },
    },
  },
  [41] = {
    bg = {
      anim = blur3,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit = RM:loadAnimation('s02_0_p041_m01_Quit_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Quit",
          },
        },
      },
    },
  },
  [42] = {
    bg = {
      anim = blur3,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit = RM:loadAnimation('s02_0_p042_m01_Quit_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
          enemyToGoTo = "enemyQuit1",
        },
        drawData = {
          [1] = {
            anim = "Quit",
          },
        },
      },
    },
  },
}