
local RM = require 'resourceManager.resourceManager'
RM.prefix = 'assets/VN/scene03_0_midFightScene/'

return {
  [1] = {
    bg = {
      anim = RM:loadAnimation('s03_0_p001_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End_Quit = RM:loadAnimation('s03_0_p001_m01_End_Quit_'),
          Box = RM:loadAnimation('s03_0_p001_m01_Box_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "End_Quit",
          },
        },
      },
    },
  },
  [2] = {
    bg = {
      anim = RM:loadAnimation('s03_0_p002_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit = RM:loadAnimation('s03_0_p002_m01_Quit_'),
          Box = RM:loadAnimation('s03_0_p002_m01_Box_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "Quit",
          },
        },
      },
    },
  },
  [3] = {
    bg = {
      anim = RM:loadAnimation('s03_0_p003_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation('s03_0_p003_m01_End_'),
          Box = RM:loadAnimation('s03_0_p003_m01_Box_'),
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
  [4] = {
    bg = {
      anim = RM:loadAnimation('s03_0_p004_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit_Zero = RM:loadAnimation('s03_0_p004_m01_Quit_Zero_'),
          Quit_Zero2 = RM:loadAnimation('s03_0_p004_m02_Quit_Zero_'),
          Box = RM:loadAnimation('s03_0_p004_m01_Box_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "Quit_Zero2",
          },
          [3] = {
            anim = "Quit_Zero",
            alpha = 1,
            tween = {.43, {alpha = 0}, "in-quart"}
          },
        },
      },
    },
  },
  [5] = {
    bg = {
      anim = RM:loadAnimation('s03_0_p005_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation('s03_0_p005_m01_End_'),
          Box = RM:loadAnimation('s03_0_p005_m01_Box_'),
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
            x = 2320/2 - 200 - 90,
            y = 1480/2 - 200 - 10,
            xScale = 1.1,
            yScale = 1.1,
            xOffset = 2320/2,
            yOffset = 1480/2,
            tween = {3, {x = 2320/2 - 200, y = 1480/2 - 200, xScale = 1, yScale = 1}, "in-linear"}
          },
        },
      },
    },
  },
  [6] = {
    bg = {
      anim = RM:loadAnimation('s03_0_p006_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation('s03_0_p006_m01_End_'),
          Box = RM:loadAnimation('s03_0_p006_m01_Box_'),
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
  [7] = {
    bg = {
      anim = RM:loadAnimation('s03_0_p007_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s03_0_p007_m01_Box_'),
          End = RM:loadAnimation('s03_0_p007_m01_End_'),
          Quit = RM:loadAnimation('s03_0_p007_m01_Quit_'),
          Sword = RM:loadAnimation('s03_0_p007_m01_Sword_'),
        },
        transitionTrigger = {
          [1] = "timer",--"waitForInput",
          [2] = 1.0
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "End",
            x = 0,
            y = 0,
    
            tween = {2.4, {x =- 100, y =- 40}, "out-quart"}
          },
          [3] = {
            anim = "Quit",
    
            x = 0,
            y = 0,
    
            tween = {2.4, {x =- 75, y =- 30}, "out-quart"}
          },
          [4] = {
            anim = "Sword",
            x = 0,
            y = 0,
            tween = {3, {x = 40, y = -25}, "out-quart"}
          },
        },
      },
    },
  },
  [8] = {
    bg = {
      anim = RM:loadAnimation('s03_0_p008_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation('s03_0_p008_m01_End_'),
          Box = RM:loadAnimation('s03_0_p008_m01_Box_'),
        },
        transitionTrigger = {
           [1] = "timer",--"waitForInput",
           [2] = 0.9
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "End",
            x = 100,
            y = -50,
            tween = {2, {x = 0, y = 0}, "out-expo"}
          },
        },
      },
    },
  },
  [10] = {
    bg = {
      anim = RM:loadAnimation('s03_0_p010_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s03_0_p010_m01_Box_'),
          Effect = RM:loadAnimation('s03_0_p010_m01_Effect_'),
          Zero = RM:loadAnimation('s03_0_p010_m01_Zero_'),
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
            xScale = 0.9,
            yScale = 0.9,
            xOffset = 2320/2,
            yOffset = 1480/2,
            x = 2320/2 - 200,
            y = 1480/2 - 200,
  
            tween = {3, {xScale = 1.1, yScale = 1.1}, "in-linear"}
            -- fade to white
          },
        },
      },
    },
  },
  [11] = {
    bg = {
      anim = RM:loadAnimation('s03_0_p012_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation('s03_0_p012_m01_End_'),
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
  [12] = {
    bg = {
      anim = RM:loadAnimation('s03_0_p012_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Zero = RM:loadAnimation('s03_0_p013_m01_Zero_'),
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
      anim = RM:loadAnimation('s03_0_p012_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Soldier = RM:loadAnimation('s03_0_p014_m01_Soldier_'),
          Zero = RM:loadAnimation('s03_0_p014_m01_Zero_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Soldier",
          },
          [2] = {
            anim = "Zero",
          },
        },
      },
    },
  },
  [14] = {
    bg = {
      anim = RM:loadAnimation('s03_0_p012_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End_Zero = RM:loadAnimation('s03_0_p015_m01_End_Zero_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "End_Zero",
          },
        },
      },
    },
  },
  [15] = {
    bg = {
      anim = RM:loadAnimation('s03_0_p012_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Soldier_End = RM:loadAnimation('s03_0_p016_m01_Soldier_End_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Soldier_End",
          },
        },
      },
    },
  },
  [16] = {
    bg = {
      anim = RM:loadAnimation('s03_0_p012_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Zero = RM:loadAnimation('s03_0_p017_m01_Zero_'),
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
  [17] = {
    bg = {
      anim = RM:loadAnimation('s03_0_p012_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation('s03_0_p018_m01_End_'),
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
  [18] = {
    bg = {
      anim = RM:loadAnimation('s03_0_p012_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation('s03_0_p019_m01_End_'),
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
  [19] = {
    bg = {
      anim = RM:loadAnimation('s03_0_p020_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s03_0_p020_m01_Box_'),
          Effect = RM:loadAnimation('s03_0_p020_m01_Effect_'),
          Zero = RM:loadAnimation('s03_0_p020_m01_Zero_'),
        },
        transitionTrigger = {
          [1] = "timer",--"waitForInput",
          [2] = .75--1.27
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
            xOffset = 2320/2,
            yOffset = 1480/2,
            x = 2320/2 - 200,
            y = 1480/2 - 200,
            xScale = .9,
            yScale = .9,
            tween = {1.2, {y = 1480/2 - 200 -75 ,xScale = 1.2, yScale = 1.2}, "out-cubic"}
          },
        },
      },
    },
  },
  [20] = {
    bg = {
      anim = RM:loadAnimation('s03_0_p021_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Zero = RM:loadAnimation('s03_0_p021_m01_Zero_'),
          Box = RM:loadAnimation('s03_0_p021_m01_Box_'),
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
  [21] = {
    bg = {
      anim = RM:loadAnimation('s03_0_p022_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit = RM:loadAnimation('s03_0_p022_m01_Quit_'),
          Box = RM:loadAnimation('s03_0_p022_m01_Box_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "Quit",
          },
        },
      },
    },
  },
  [22] = {
    bg = {
      anim = RM:loadAnimation('s03_0_p023_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Zero = RM:loadAnimation('s03_0_p023_m01_Zero_'),
          Box = RM:loadAnimation('s03_0_p023_m01_Box_'),
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
  [23] = {
    bg = {
      anim = RM:loadAnimation('s03_0_p024_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Zero = RM:loadAnimation('s03_0_p024_m01_Zero_'),
          Box = RM:loadAnimation('s03_0_p024_m01_Box_'),
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
  [24] = {
    bg = {
      anim = RM:loadAnimation('s03_0_p025_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Zero = RM:loadAnimation('s03_0_p025_m01_Zero_'),
          Box = RM:loadAnimation('s03_0_p025_m01_Box_'),
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
  [25] = {
    bg = {
      anim = RM:loadAnimation('s03_0_p026_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Zero = RM:loadAnimation('s03_0_p026_m01_Zero_'),
          Box = RM:loadAnimation('s03_0_p026_m01_Box_'),
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
  [26] = {
    bg = {
      anim = RM:loadAnimation('s03_0_p027_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Zero = RM:loadAnimation('s03_0_p027_m01_Zero_'),
          Box = RM:loadAnimation('s03_0_p027_m01_Box_'),
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
  [27] = {
    bg = {
      anim = RM:loadAnimation('s03_0_p028_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Zero = RM:loadAnimation('s03_0_p028_m01_Zero_'),
          Box = RM:loadAnimation('s03_0_p028_m01_Box_'),
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
  [28] = {
    bg = {
      anim = RM:loadAnimation('s03_0_p029_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit_End = RM:loadAnimation('s03_0_p029_m01_Quit_End_'),
          Box = RM:loadAnimation('s03_0_p029_m01_Box_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "Quit_End",
            -- plz separate quit and end
            -- I want to do a thing where end comes in from left and quit from right to create the illusion of rotation. Sorta like how pokemon battles start
          },
        },
      },
    },
  },
  [29] = {
    bg = {
      anim = RM:loadAnimation('s03_0_p030_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit = RM:loadAnimation('s03_0_p030_m01_Quit_'),
          Box = RM:loadAnimation('s03_0_p030_m01_Box_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "Quit",
            xOffset = 2320/2,
            yOffset = 1480/2,
            x = 2320/2 - 200 -10,
            y = 1480/2 - 200 +25,
            xScale = .95,
            yScale = .95,
            tween = {5, {x = 2320/2 - 200, y = 1480/2 - 200 ,xScale = 1, yScale = 1}, "out-linear"}
          },
        },
      },
    },
  },
  [30] = {
    bg = {
      anim = RM:loadAnimation('s03_0_p031_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit = RM:loadAnimation('s03_0_p031_m01_Quit_'),
          Box = RM:loadAnimation('s03_0_p031_m01_Box_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "Quit",
            xOffset = 2320/2,
            yOffset = 1480/2,
            x = 2320/2 - 200,
            y = 1480/2 - 200 +400,
            xScale = 1.4,
            yScale = 1.4,
            tween = {1.8, {y = 1480/2 - 200 ,xScale = 1, yScale = 1}, "in-out-cubic"}
          },
        },
      },
    },
  },
  [31] = {
    bg = {
      anim = RM:loadAnimation('s03_0_p032_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s03_0_p032_m01_Box_'),
          End = RM:loadAnimation('s03_0_p032_m01_End_'),
          Quit = RM:loadAnimation('s03_0_p032_m01_Quit_'),
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
            anim = "Quit",
          },
        },
      },
    },
  },
  [32] = {
    bg = {
      anim = RM:loadAnimation('s03_0_p033_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit = RM:loadAnimation('s03_0_p033_m01_Quit_'),
          Box = RM:loadAnimation('s03_0_p033_m01_Box_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "Quit",
          },
        },
      },
    },
  },
  [33] = {
    bg = {
      anim = RM:loadAnimation('s03_0_p034_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation('s03_0_p034_m01_End_'),
          Box = RM:loadAnimation('s03_0_p034_m01_Box_'),
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
  [34] = {
    bg = {
      anim = RM:loadAnimation('s03_0_p035_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Sword = RM:loadAnimation('s03_0_p035_m01_Sword_'),
          Box = RM:loadAnimation('s03_0_p035_m01_Box_'),
          End = RM:loadAnimation('s03_0_p035_m01_End_'),
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
            anim = "Sword",
          },
        },
      },
      [2] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation('s03_0_p035_m02_End_'),
          Box = RM:loadAnimation('s03_0_p035_m02_Box_'),
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
      [3] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation('s03_0_p035_m03_End_'),
          Box = RM:loadAnimation('s03_0_p035_m03_Box_'),
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
  [35] = {
    bg = {
      anim = RM:loadAnimation('s03_0_p036_bg_'),
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
  [36] = {
    bg = {
      anim = RM:loadAnimation('s03_0_p037_bg_'),
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
  [37] = {
    bg = {
      anim = RM:loadAnimation('s03_0_p038_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End_Zero = RM:loadAnimation('s03_0_p038_m01_End_Zero_'),
          Box = RM:loadAnimation('s03_0_p038_m01_Box_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "End_Zero",
          },
        },
      },
    },
  },
  [38] = {
    bg = {
      anim = RM:loadAnimation('s03_0_p039_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Zero = RM:loadAnimation('s03_0_p039_m01_Zero_'),
          Box = RM:loadAnimation('s03_0_p039_m01_Box_'),
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
  [39] = {
    bg = {
      anim = RM:loadAnimation('s03_0_p040_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          EndSurprised = RM:loadAnimation('s03_0_p040_m01_End_'),
          EndNod = RM:loadAnimation('s03_0_p041_m01_End_'),
          Box = RM:loadAnimation('s03_0_p040_m01_Box_'),
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
        },
      },
      [2] = {
        sounds = {
        },
        anims = {
          EndSurprised = RM:loadAnimation('s03_0_p040_m01_End_'),
          EndNod = RM:loadAnimation('s03_0_p041_m01_End_'),
          Box = RM:loadAnimation('s03_0_p040_m01_Box_'),
        },
        transitionTrigger = {
          [1] = "timer",--"waitForInput",
          [2] = .3
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "EndSurprised",
            alpha = 1,
            tween = {.1, {alpha = 0}, "in-quart"}
          },
          [3] = {
            anim = "EndNod",
            alpha = 0,
            tween = {.05, {alpha = 1}, "in-quart"}
          },
        },
      },
      [3] = {
        sounds = {
        },
        anims = {
          EndNod = RM:loadAnimation('s03_0_p041_m01_End_'),
          EndNormal = RM:loadAnimation('s03_0_p041_m02_End_'),
          Box = RM:loadAnimation('s03_0_p040_m01_Box_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "EndNod",
            alpha = 1,
            tween = {.1, {alpha = 0}, "in-quart"}
          },
          [3] = {
            anim = "EndNormal",
            alpha = 0,
            tween = {.05, {alpha = 1}, "in-quart"}
          },
        },
      },
    },
  },
  [40] = {
    bg = {
      anim = RM:loadAnimation('s03_0_p041_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          
          Box = RM:loadAnimation('s03_0_p041_m01_Box_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          


          
        },
      },
    },
  },
  [41] = {
    bg = {
      anim = RM:loadAnimation('s03_0_p042_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit_End = RM:loadAnimation('s03_0_p042_m01_Quit_End_'),
          Box = RM:loadAnimation('s03_0_p042_m01_Box_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "Quit_End",
          },
        },
      },
    },
  },
  [42] = {
    bg = {
      anim = RM:loadAnimation('s03_0_p043_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit = RM:loadAnimation('s03_0_p043_m01_Quit_'),
          Box = RM:loadAnimation('s03_0_p043_m01_Box_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "Quit",
          },
        },
      },
    },
  },
  [43] = {
    bg = {
      anim = RM:loadAnimation('s03_0_p044_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation('s03_0_p044_m01_End_'),
          Box = RM:loadAnimation('s03_0_p044_m01_Box_'),
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
  [44] = {
    bg = {
      anim = RM:loadAnimation('s03_0_p045_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit = RM:loadAnimation('s03_0_p045_m01_Quit_'),
          Box = RM:loadAnimation('s03_0_p045_m01_Box_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "Quit",
          },
        },
      },
    },
  },
  [45] = {
    bg = {
      anim = RM:loadAnimation('s03_0_p046_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation('s03_0_p046_m01_End_'),
          Box = RM:loadAnimation('s03_0_p046_m01_Box_'),
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
  [46] = {
    bg = {
      anim = RM:loadAnimation('s03_0_p047_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit = RM:loadAnimation('s03_0_p047_m01_Quit_'),
          Box = RM:loadAnimation('s03_0_p047_m01_Box_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "Quit",
          },
        },
      },
      [2] = {
        sounds = {
        },
        anims = {
          bg = RM:loadAnimation('s03_0_p047_m02_bg_'),
          Box = RM:loadAnimation('s03_0_p047_m02_Box_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "bg",
          },
        },
      },
      [3] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s03_0_p047_m03_Box_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
        },
      },
    },
  },
  [47] = {
    bg = {
      anim = RM:loadAnimation('s03_0_p049_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit = RM:loadAnimation('s03_0_p049_m01_Quit_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Quit",
            x = 0,
            y = 10,
            tween = {1, {y = 0}, "out-quart"}
          },
        },
      },
    },
  },
  [48] = {
    bg = {
      anim = RM:loadAnimation('s03_0_p050_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation('s03_0_p050_m01_End_'),
          Box = RM:loadAnimation('s03_0_p050_m01_Box_'),
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
            x = 20,
            y = 5,
            tween = {1.5, {x = 0}, "out-linear"}
          },
        },
      },
      [2] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s03_0_p050_m02_Box_'),
          End = RM:loadAnimation('s03_0_p050_m01_End_'),
          End2 = RM:loadAnimation('s03_0_p050_m02_End_'),
          Hand = RM:loadAnimation('s03_0_p050_m02_Hand_'),
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

            alpha = 1,
            tween = {.2, {alpha = 0}, "in-quart"}
          },
          [3] = {
            anim = "End2",
            alpha = 0,
            tween = {.1, {alpha = 1}, "in-quart"}
          },
          [4] = {
            anim = "Hand",
            x = 0,
            y = 500,
            tween = {.15, {y = 0}, "in-linear"}
          }
        },
      },
    },
  },
  [49] = {
    bg = {
      anim = RM:loadAnimation('s03_0_p051_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit = RM:loadAnimation('s03_0_p051_m01_Quit_'),
          Box = RM:loadAnimation('s03_0_p051_m01_Box_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "Quit",
            xScale = .9,
            yScale = .9,
            xOffset = 2320/2,
            yOffset = 1480/2,
            x = 2320/2 - 200,
            y = 1480/2 - 200,
--            tween = {1, { y = 1480/2 - 200,     }, "in-linear"} -- TODO: Make it possible to have multiple tweens with different timing 
            tween = {3, { xScale = 1, yScale = 1}, "out-quad"}
          },
        },
      },
    },
  },
  [50] = {
    bg = {
      anim = RM:loadAnimation('s03_0_p052_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit = RM:loadAnimation('s03_0_p052_m01_Quit_'),
          Box = RM:loadAnimation('s03_0_p052_m01_Box_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "Quit",
          },
        },
      },
    },
  },
  [51] = {
    bg = {
      anim = RM:loadAnimation('s03_0_p053_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation('s03_0_p053_m01_End_'),
          Box = RM:loadAnimation('s03_0_p053_m01_Box_'),
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
  [52] = {
    bg = {
      anim = RM:loadAnimation('s03_0_p054_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit = RM:loadAnimation('s03_0_p054_m01_Quit_'),
          Box = RM:loadAnimation('s03_0_p054_m01_Box_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "Quit",
          },
        },
      },
    },
  },
  [53] = {
    bg = {
      anim = RM:loadAnimation('s03_0_p055_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit = RM:loadAnimation('s03_0_p055_m01_Quit_'),
          Box = RM:loadAnimation('s03_0_p055_m01_Box_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "Quit",
          },
        },
      },
    },
  },
  [54] = {
    bg = {
      anim = RM:loadAnimation('s03_0_p056_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit = RM:loadAnimation('s03_0_p056_m01_Quit_'),
          Box = RM:loadAnimation('s03_0_p056_m01_Box_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "Quit",
          },
        },
      },
    },
  },
  [55] = {
    bg = {
      anim = RM:loadAnimation('s03_0_p057_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit = RM:loadAnimation('s03_0_p057_m01_Quit_'),
          Box = RM:loadAnimation('s03_0_p057_m01_Box_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "Quit",
          },
        },
      },
    },
  },
}