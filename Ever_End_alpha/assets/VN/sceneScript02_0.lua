
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
      anim = blur1,
    },
    moments = {
      [1] = {
        sounds = {
        },
        music = "Conflict Theme Placeholder",
        anims = {
          Zero = RM:loadAnimation('s02_0_p001_m01_Zero_'),
          Box = RM:loadAnimation('s02_0_p001_m01_Box_'),
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
          Box = RM:loadAnimation('s02_0_p002_m01_Box_'),
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
          Box = RM:loadAnimation('s02_0_p003_m01_Box_'),
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
  [4] = {
    bg = {
      anim = blur1,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s02_0_p004_m01_Box_'),
          Zero = RM:loadAnimation('s02_0_p004_m01_Zero_'),
          Table = RM:loadAnimation('s02_0_p004_m01_Table_'),
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
            x = 2320/2 - 200 + 200,
            y = 1480/2 - 200 - 100,
            xScale = .94,
            yScale = .94,
            xOffset = 2320/2,
            yOffset = 1480/2,
            tween = {.7, {x = 2320/2 - 200, y = 1480/2 - 200, xScale = 1, yScale = 1}, "out-quad"},
          },
          [3] = {
            anim = "Table",
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
          Box = RM:loadAnimation('s02_0_p005_m01_Box_'),
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
            anim = "Box",
          },
          [3] = {
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
          Box = RM:loadAnimation('s02_0_p006_m01_Box_'),
          End = RM:loadAnimation('s02_0_p006_m01_End_'),
          Zero = RM:loadAnimation('s02_0_p006_m01_Zero_'),
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
          [3] = {
            anim = "End",
            x = 2320/2 - 200 + 2000,
            y = 1480/2 - 200,
            xScale = 1,
            yScale = 1,
            xOffset = 2320/2,
            yOffset = 1480/2,
            tween = {.52, {x = 2320/2 - 200 - 2000, y = 1480/2 - 200, xScale = 1, yScale = 1}, "out-linear"},
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
          Box = RM:loadAnimation('s02_0_p007_m01_Box_'),
          Zero_Table = RM:loadAnimation('s02_0_p007_m01_Zero_Table_'),
          End = RM:loadAnimation('s02_0_p007_m01_End_'),

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
            x = 2320/2 - 200-500, -- 500 is magic number to offset the center of the tiny sprite
            y = 1480/2 - 200,
            xScale = 1,
            yScale = 1,
            xOffset = 2320/2-500,
            yOffset = 1480/2,
            alpha = 1,
            tween = {.52, {x = 2320/2 - 200-500, y = 1480/2 - 200, alpha = 0, xScale = .5, yScale = .5}, "out-linear"},
          },
          [3] = {
            anim = "Zero_Table",
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
          Box = RM:loadAnimation('s02_0_p008_m01_Box_'),
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
  [9] = {
    bg = {
      anim = blur1,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s02_0_p009_m01_Box_'),
          Zero = RM:loadAnimation('s02_0_p009_m01_Zero_'),
          Table = RM:loadAnimation('s02_0_p009_m01_Table_'),
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
          [3] = {
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
          Box = RM:loadAnimation('s02_0_p010_m01_Box_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
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
          Box = RM:loadAnimation('s02_0_p011_m01_Box_'),
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
          Box = RM:loadAnimation('s02_0_p012_m01_Box_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
            x = 2320/2 - 200+300,
            y = 1480/2 - 200+20,
            xScale = 1.2,
            yScale = 1.2,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,
            tween = {.9, {x = 2320/2 - 200, y = 1480/2 - 200, xScale = 1, yScale = 1}, "in-out-cubic"},
          },
          [2] = {
            anim = "Zero",
            x = 2320/2 - 200 - 30,
            y = 1480/2 - 200,
            xScale = 1,
            yScale = 1,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,
            tween = {.9, {x = 2320/2 - 200, y = 1480/2 - 200, xScale = 1, yScale = 1}, "in-out-cubic"},
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
          Box = RM:loadAnimation('s02_0_p013_m01_Box_'),
          Zero = RM:loadAnimation('s02_0_p013_m01_Zero_'),
          Tiger = RM:loadAnimation('s02_0_p013_m01_Tiger_'),

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
            x = 2320/2 - 200 + 30,
            y = 1480/2 - 200 - 5,
            xScale = 1,
            yScale = 1,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,
            tween = {.9, {x = 2320/2 - 200, y = 1480/2 - 200, xScale = 1, yScale = 1}, "out-quint"},
          },
          [3] = {
            anim = "Tiger",
            x = 2320/2 - 200-20,
            y = 1480/2 - 200,
            xScale = 1,
            yScale = 1,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,
            tween = {.45, {x = 2320/2 - 200 + 10, y = 1480/2 - 200, xScale = 1, yScale = 1}, "out-linear"},
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
          Box = RM:loadAnimation('s02_0_p014_m01_Box_'),
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
        music = "stop",
        anims = {
          Box = RM:loadAnimation('s02_0_p015_m01_Box_'),
          Zero = RM:loadAnimation('s02_0_p015_m01_Zero_'),
          Zero2 = RM:loadAnimation('s02_0_p015_m02_Zero_'),
          Quit = RM:loadAnimation('s02_0_p015_m01_Quit_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
            x = 2320/2 - 200 + 600,
            y = 1480/2 - 200 - 0,
            xScale = 1.13,
            yScale = 1.13,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,
            tween = {2, {x = 2320/2 - 200 + 100, y = 1480/2 - 200, xScale = 1, yScale = 1}, "in-out-quint"},
          },
          [2] = {
            anim = "Quit",
            x = 2320/2 - 200 + 600,
            y = 1480/2 - 200 - 0,
            xScale = 1.13,
            yScale = 1.13,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,
            tween = {2, {x = 2320/2 - 200 + 100, y = 1480/2 - 200, xScale = 1, yScale = 1}, "in-out-quint"},
          },
          [3] = {
            anim = "Zero",
            x = 2320/2 - 200 - 300,
            y = 1480/2 - 200 + 60,
            xScale = .9,
            yScale = .9,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,
            tween = {2, {x = 2320/2 - 200, y = 1480/2 - 200, xScale = 1, yScale = 1}, "in-out-quart"},
          },
          [4] = {
            -- This shadow makes no sense, we should have blur insted
            anim = "Zero2",
            x = 2320/2 - 200 - 300,
            y = 1480/2 - 200 + 60,
            xScale = .9,
            yScale = .9,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 0,
            tween = {2, {x = 2320/2 - 200, y = 1480/2 - 200, alpha = 1, xScale = 1, yScale = 1}, "in-out-quart"},
          },
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
          Box = RM:loadAnimation('s02_0_p017_m01_Box_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
            x = 2320/2 - 200,
            y = 1480/2 - 200 + 70,
            xScale = 1,
            yScale = 1,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,
            tween = {2, {x = 2320/2 - 200, y = 1480/2 - 200, xScale = 1, yScale = 1}, "in-out-quart"},
          },
          [2] = {
            anim = "Quit_Zero",
            x = 2320/2 - 200,
            y = 1480/2 - 200 + 70,
            xScale = 1,
            yScale = 1,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,
            tween = {2, {x = 2320/2 - 200, y = 1480/2 - 200, xScale = 1, yScale = 1}, "in-out-quart"},
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
          Box = RM:loadAnimation('s02_0_p018_m01_Box_'),
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
            x = 2320/2 - 200,
            y = 1480/2 - 200 + 20,
            xScale = 1,
            yScale = 1,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,
            tween = {1.3, {x = 2320/2 - 200, y = 1480/2 - 200, xScale = 1, yScale = 1}, "in-bounce"},
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
          Box = RM:loadAnimation('s02_0_p019_m01_Box_'),
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
            x = 2320/2 - 200 + 140,
            y = 1480/2 - 200 - 0,
            xScale = 1,
            yScale = 1,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,
            tween = {1.0, {x = 2320/2 - 200 - 50, y = 1480/2 - 200, xScale = 1, yScale = 1}, "in-cubic"},
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
          Box = RM:loadAnimation('s02_0_p020_m01_Box_'),
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
            x = 2320/2 - 200 + 20,
            y = 1480/2 - 200 - 0,
            xScale = 1,
            yScale = 1,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,
            tween = {1.0, {x = 2320/2 - 200 - 50, y = 1480/2 - 200, xScale = 1, yScale = 1}, "out-quart"},
          },
        },
      },
    },
  },
  [21] = {
    bg = {
      anim = blur3,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation('s02_0_p021_m01_End_'),
          Box = RM:loadAnimation('s02_0_p021_m01_Box_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
            x = 2320/2 - 200,
            y = 1480/2 - 200 - 100,
            xScale = .9,
            yScale = .9,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,
            tween = {1.5, {x = 2320/2 - 200, y = 1480/2 - 200, xScale = 1, yScale = 1}, "out-linear"},
          },
          [2] = {
            anim = "End",
            x = 2320/2 - 200,
            y = 1480/2 - 200 - 50,
            xScale = .9,
            yScale = .9,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,
            tween = {1.5, {x = 2320/2 - 200, y = 1480/2 - 200, xScale = 1, yScale = 1}, "out-linear"},
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
          Box = RM:loadAnimation('s02_0_p022_m01_Box_'),
          text = RM:loadAnimation('s02_0_p022_m01_text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
            x = 2320/2 - 200,
            y = 1480/2 - 200 - 100,
            xScale = .9,
            yScale = .9,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,
            tween = {3, {x = 2320/2 - 200, y = 1480/2 - 200, xScale = 1, yScale = 1}, "out-linear"},
          },
          [2] = {
            anim = "End",
            x = 2320/2 - 200,
            y = 1480/2 - 200 - 100,
            xScale = 1.2,
            yScale = 1.2,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,
            tween = {3, {x = 2320/2 - 200, y = 1480/2 - 200, xScale = 1, yScale = 1}, "out-cubic"},
          },
          [3] = {
            anim = "text",
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
        music = "Quit_Chill_Theme_Full",
        anims = {
          Box = RM:loadAnimation('s02_0_p023_m01_Box_'),
          Quit = RM:loadAnimation('s02_0_p023_m01_Quit_'),
          End = RM:loadAnimation('s02_0_p023_m01_End_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
            x = 2320/2 - 200 + 700,
            y = 1480/2 - 200,
            xScale = 1.2,
            yScale = 1.2,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,
            tween = {2, {x = 2320/2 - 200, y = 1480/2 - 200, xScale = 1, yScale = 1}, "in-out-cubic"},
          },
          [2] = {
            anim = "Quit",
            x = 2320/2 - 200 + 700,
            y = 1480/2 - 200,
            xScale = 1.2,
            yScale = 1.2,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,
            tween = {2, {x = 2320/2 - 200, y = 1480/2 - 200, xScale = 1, yScale = 1}, "in-out-cubic"},
          },
          [3] = {
            anim = "End",
            x = 2320/2 - 200 - 400,
            y = 1480/2 - 200 + 20,
            xScale = .9,
            yScale = .9,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,
            tween = {2, {x = 2320/2 - 200, y = 1480/2 - 200, xScale = 1, yScale = 1}, "in-out-cubic"},
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
          Box = RM:loadAnimation('s02_0_p024_m01_Box_'),
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
  [25] = {
    bg = {
      anim = blur3,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s02_0_p025_m01_Box_'),
          Zero = RM:loadAnimation('s02_0_p025_m01_Zero_'),
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
      anim = blur3,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s02_0_p026_m01_Box_'),
          End = RM:loadAnimation('s02_0_p026_m01_End_'),
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
  [27] = {
    bg = {
      anim = blur3,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s02_0_p027_m01_Box_'),

          End = RM:loadAnimation('s02_0_p027_m01_End_'),
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
  [28] = {
    bg = {
      anim = blur3,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s02_0_p028_m01_Box_'),
          Quit_Zero = RM:loadAnimation('s02_0_p028_m01_Quit_Zero_'),
          text = RM:loadAnimation('s02_0_p028_m01_text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "Quit_Zero",
          },
          [3] = {
            anim = "text",
          },
        },
      },
      [2] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s02_0_p028_m01_Box_'),
          Quit_Zero = RM:loadAnimation('s02_0_p028_m01_Quit_Zero_'),
          Text = RM:loadAnimation('s02_0_p028_m02_Text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "Quit_Zero",
          },
          [3] = {
            anim = "Text",
          },
        },
      },
      [3] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s02_0_p028_m01_Box_'),
          Quit_Zero = RM:loadAnimation('s02_0_p028_m01_Quit_Zero_'),
          Text = RM:loadAnimation('s02_0_p028_m03_Text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "Quit_Zero",
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
      anim = blur3,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s02_0_p029_m01_Box_'),
          Quit_Zero = RM:loadAnimation('s02_0_p029_m01_Quit_Zero_'),
          text = RM:loadAnimation('s02_0_p029_m01_text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "Quit_Zero",
          },
          [3] = {
            anim = "text",
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
          Box = RM:loadAnimation('s02_0_p030_m01_Box_'),
          Quit = RM:loadAnimation('s02_0_p030_m01_Quit_'),
          text = RM:loadAnimation('s02_0_p030_m01_text_'),
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
          [3] = {
            anim = "text",
          },
        },
      },
      [2] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s02_0_p030_m01_Box_'),
          Quit = RM:loadAnimation('s02_0_p030_m01_Quit_'),
          text = RM:loadAnimation('s02_0_p030_m02_text_'),
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
          [3] = {
            anim = "text",
          },
        },
      },
      [3] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s02_0_p030_m01_Box_'),
          Quit = RM:loadAnimation('s02_0_p030_m01_Quit_'),
          text = RM:loadAnimation('s02_0_p030_m03_text_'),
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
          [3] = {
            anim = "text",
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
          Box = RM:loadAnimation('s02_0_p031_m01_Box_'),
          End = RM:loadAnimation('s02_0_p031_m01_End_'),
          Quit_Zero = RM:loadAnimation('s02_0_p031_m01_Quit_Zero_'),
          text = RM:loadAnimation('s02_0_p031_m01_text_'),
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
            anim = "Quit_Zero",
          },
          [4] = {
            anim = "text",
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
          Box = RM:loadAnimation('s02_0_p032_m01_Box_'),
          End = RM:loadAnimation('s02_0_p032_m01_End_'),
          text = RM:loadAnimation('s02_0_p032_m01_text_'),
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
            anim = "text",
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
          Box = RM:loadAnimation('s02_0_p033_m01_Box_'),
          Zero = RM:loadAnimation('s02_0_p033_m01_Zero_'),
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
  [34] = {
    bg = {
      anim = blur3,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s02_0_p034_m01_Box_'),
          Quit_Zero = RM:loadAnimation('s02_0_p034_m01_Quit_Zero_'),
          text = RM:loadAnimation('s02_0_p034_m01_text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "Quit_Zero",
          },
          [3] = {
            anim = "text",
          },
        },
      },
      [2] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s02_0_p034_m01_Box_'),
          Quit_Zero = RM:loadAnimation('s02_0_p034_m02_Quit_Zero_'),
          text = RM:loadAnimation('s02_0_p034_m02_text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "Quit_Zero",
          },
          [3] = {
            anim = "text",
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
        music = "stop",
        anims = {
          Box = RM:loadAnimation('s02_0_p035_m01_Box_'),
          Quit = RM:loadAnimation('s02_0_p035_m01_Quit_'),
          text = RM:loadAnimation('s02_0_p035_m01_text_'),
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
          [3] = {
            anim = "text",
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
          Box = RM:loadAnimation('s02_0_p036_m01_Box_'),
          End = RM:loadAnimation('s02_0_p036_m01_End_'),
          Effect = RM:loadAnimation('s02_0_p036_m01_Effect_'),
          Robot = RM:loadAnimation('s02_0_p036_m01_Robot_'),
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
            anim = "End",
          },
          [4] = {
            anim = "Robot",
          },
        },
      },
      [2] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation('s02_0_p036_m02_End_'),
          Star = RM:loadAnimation('s02_0_p036_m02_Star_'),
          Effect = RM:loadAnimation('s02_0_p036_m02_Effect_'),
          Robot = RM:loadAnimation('s02_0_p036_m02_Robot_'),
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
          [4] = {
            anim = "Star",
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
          Box = RM:loadAnimation('s02_0_p037_m01_Box_'),
          End_Robot = RM:loadAnimation('s02_0_p037_m01_End_Robot_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
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
        music = "Build_up_Theme Full",
        anims = {
          Box = RM:loadAnimation('s02_0_p038_m01_Box_'),
          Robot = RM:loadAnimation('s02_0_p038_m01_Robot_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
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
          Box = RM:loadAnimation('s02_0_p039_m01_Box_'),
          Robot = RM:loadAnimation('s02_0_p039_m01_Robot_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "Robot",
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
          Box = RM:loadAnimation('s02_0_p040_m01_Box_'),
          End = RM:loadAnimation('s02_0_p040_m01_End_'),
          Robot = RM:loadAnimation('s02_0_p040_m01_Robot_'),
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
          Box = RM:loadAnimation('s02_0_p041_m01_Box_'),
          Quit = RM:loadAnimation('s02_0_p041_m01_Quit_'),
          text = RM:loadAnimation('s02_0_p041_m01_text_'),
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
          [3] = {
            anim = "text",
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
	music = "stop",
        anims = {
          Box = RM:loadAnimation('s02_0_p042_m01_Box_'),
          Quit = RM:loadAnimation('s02_0_p042_m01_Quit_'),
          text = RM:loadAnimation('s02_0_p042_m01_text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
          enemyToGoTo = "enemyQuit1",
        },
        drawData = { 
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "Quit",
          },
          [3] = {
            anim = "text",
          },
        },
      },
    },
  },
}
