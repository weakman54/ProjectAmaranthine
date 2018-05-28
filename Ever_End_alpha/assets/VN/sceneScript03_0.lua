

local RM = require 'resourceManager.resourceManager'


RM.prefix = "assets/"
local Gas  = RM:loadAnimation("FX/Gas_")


RM.prefix = 'assets/VN/scene03_0_midFightScene/'

local background = RM:loadAnimation('inside_robot_')
local background_blur = RM:loadAnimation('inside_robot_blur_')

local boxAlpha = 0.8
local boxDarken = 0.1

local FlashbackBG = RM:loadAnimation('FlashbackBG_')



return {
  [1] = {
    bg = {
      anim = background,
    },
    moments = {
      [1] = {
        sounds = {
        },
        music = "Ambient Cicada",
        anims = {
          End_Quit = RM:loadAnimation('s03_0_p001_m01_End_Quit_'),
          Box = RM:loadAnimation('s03_0_p001_m01_Box_'),
          Gas = Gas,
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
            alpha = boxAlpha,
            red = boxDarken,
            green = boxDarken, 
            blue = boxDarken
          },
          [2] = {
            anim = "End_Quit",
          },
          [3] = {
            anim = "Gas",
          },
        },
      },
    },
  },
  [2] = {
    bg = {
      anim = background_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit = RM:loadAnimation('s03_0_p002_m01_Quit_'),
          Box = RM:loadAnimation('s03_0_p002_m01_Box_'),
          Gas = Gas,
          Text = RM:loadAnimation('s03_0_p002_m01_Text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
            alpha = boxAlpha,
            red = boxDarken,
            green = boxDarken, 
            blue = boxDarken
          },
          [2] = {
            anim = "Quit",
          },
          [3] = {
            anim = "Gas",
          },
          [4] = {
            anim = "Text",
          },
        },
      },
      [2] = {
        sounds = {
        },
        anims = {
          Quit = RM:loadAnimation('s03_0_p002_m01_Quit_'),
          Box = RM:loadAnimation('s03_0_p002_m01_Box_'),
          Gas = Gas,
          Text = RM:loadAnimation('s03_0_p002_m02_Text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
            alpha = boxAlpha,
            red = boxDarken,
            green = boxDarken, 
            blue = boxDarken
          },
          [2] = {
            anim = "Quit",
          },
          [3] = {
            anim = "Gas",
          },
          [4] = {
            anim = "Text",
          },
        },
      },
    },
  },
  [3] = {
    bg = {
      anim = background_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation('s03_0_p003_m01_End_'),
          Box = RM:loadAnimation('s03_0_p003_m01_Box_'),
          Gas = Gas,
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
            alpha = boxAlpha,
            red = boxDarken,
            green = boxDarken, 
            blue = boxDarken
          },
          [2] = {
            anim = "End",
          },
          [3] = {
            anim = "Gas",
          },
        },
      },
    },
  },
  [4] = {
    bg = {
      anim = background_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit_Zero = RM:loadAnimation('s03_0_p004_m01_Quit_Zero_'),
          Quit_Zero2 = RM:loadAnimation('s03_0_p004_m02_Quit_Zero_'),
          Box = RM:loadAnimation('s03_0_p004_m01_Box_'),
          Gas = Gas,
        },
        transitionTrigger = {
          [1] = "timer",--"waitForInput",
          [2] = 1.0
        },
        drawData = {
          [1] = {
            anim = "Box",
            alpha = boxAlpha,
            red = boxDarken,
            green = boxDarken, 
            blue = boxDarken
          },
          [2] = {
            anim = "Quit_Zero2",
          },
          [3] = {
            anim = "Quit_Zero",
            alpha = 1,
            tween = {.43, {alpha = 0}, "in-quart"}
          },
          [3] = {
            anim = "Gas",
          },
        },
      },
    },
  },
  [5] = {
    bg = {
      anim = background,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s03_0_p005_m01_Box_'),
          End = RM:loadAnimation('s03_0_p005_m01_End_'),
          Gas = Gas,
          Text = RM:loadAnimation('s03_0_p005_m01_Text_'),
        },
        transitionTrigger = {
          [1] = "timer",--"waitForInput",
          [2] = 2.7
        },
        drawData = {
          [1] = {
            anim = "Box",
            alpha = boxAlpha,
            red = boxDarken,
            green = boxDarken, 
            blue = boxDarken
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
          [3] = {
            anim = "Gas",
          },
          [4] = {
            anim = "Text",
          },
        },
      },
    },
  },
  [6] = {
    bg = {
      anim = background_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s03_0_p006_m01_Box_'),
          End = RM:loadAnimation('s03_0_p006_m01_End_'),
          Gas = Gas,
          Text = RM:loadAnimation('s03_0_p006_m01_Text_'),
        },
        transitionTrigger = {
          [1] = "timer",--"waitForInput",
          [2] = .7
        },
        drawData = {
          [1] = {
            anim = "Box",
            alpha = boxAlpha,
            red = boxDarken,
            green = boxDarken, 
            blue = boxDarken
          },
          [2] = {
            anim = "End",
          },
          [3] = {
            anim = "Gas",
          },
          [4] = {
            anim = "Text",
          },
        },
      },
    },
  },
  [7] = {
    bg = {
      anim = background,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Black = RM:loadAnimation('black'),
        },
        transitionTrigger = {
          [1] = "timer",--"waitForInput",
          [2] = .2
        },
        drawData = {
          [1] = {
            anim = "Black"
          },
        },
      },
      [2] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s03_0_p007_m01_Box_'),
          End = RM:loadAnimation('s03_0_p007_m01_End_'),
          Quit = RM:loadAnimation('s03_0_p007_m01_Quit_'),
          Sword = RM:loadAnimation('s03_0_p007_m01_Sword_'),
          Gas = Gas,
        },
        transitionTrigger = {
          [1] = "timer",--"waitForInput",
          [2] = 1.0
        },
        drawData = {
          [1] = {
            anim = "Box",
            alpha = boxAlpha,
            red = boxDarken,
            green = boxDarken, 
            blue = boxDarken
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
          [3] = {
            anim = "Gas",
          },
        },
      },
    },
  },
  [8] = {
    bg = {
      anim = background,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation('s03_0_p008_m01_End_'),
          Box = RM:loadAnimation('s03_0_p008_m01_Box_'),
          Gas = Gas,
        },
        transitionTrigger = {
          [1] = "timer",--"waitForInput",
          [2] = 0.9
        },
        drawData = {
          [1] = {
            anim = "Box",
            alpha = boxAlpha,
            red = boxDarken,
            green = boxDarken, 
            blue = boxDarken
          },
          [2] = {
            anim = "End",
            x = 100,
            y = -50,
            tween = {2, {x = 0, y = 0}, "out-expo"}
          },
          [3] = {
            anim = "Gas",
          },
        },
      },
    },
  },
  [10] = {
    bg = {
      anim = background_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        music = "stop",
        anims = {
          Box = RM:loadAnimation('s03_0_p010_m01_Box_'),
          Effect = RM:loadAnimation('s03_0_p010_m01_Effect_'),
          Zero = RM:loadAnimation('s03_0_p010_m01_Zero_'),
          White = RM:loadAnimation('white'),
          Gas = Gas,
        },
        transitionTrigger = {
          [1] = "timer",--"waitForInput",
          [2] = 2.7
        },
        drawData = {
          [1] = {
            anim = "Box",
            alpha = boxAlpha,
            red = boxDarken,
            green = boxDarken, 
            blue = boxDarken
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

            tween = {2.5, {xScale = 1.1, yScale = 1.1}, "in-linear"}
          },
          [4] = {
            anim = "Gas",
            alpha = 1,

            tween = {2.5, {alpha = 0}, "in-cubic"}
          },
          [5] = {
            anim = "White",
            alpha = 0,

            tween = {2.5, {alpha = 1}, "in-cubic"}
          },
        },
      },
    },
  },
  [12] = {
    bg = {
      anim = FlashbackBG,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation('s03_0_p012_m01_End_'),
          White = RM:loadAnimation('white'),
        },
        transitionTrigger = {
          [1] = "timer",--"waitForInput",
          [2] = 1.25--1.27
        },
        drawData = {
          [1] = {
            anim = "End",
          },
          [2] = {
            anim = "White",
            alpha = 1,

            tween = {1.25, {alpha = 0}, "in-cubic"}
          },
        },
      },
      [2] = {
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
  [13] = {
    bg = {
      anim = FlashbackBG,
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
  [14] = {
    bg = {
      anim = FlashbackBG,
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
  [15] = {
    bg = {
      anim = FlashbackBG,
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
  [16] = {
    bg = {
      anim = FlashbackBG,
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
  [17] = {
    bg = {
      anim = FlashbackBG,
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
  [18] = {
    bg = {
      anim = FlashbackBG,
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
  [19] = {
    bg = {
      anim = FlashbackBG,
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
  [20] = {
    bg = {
      anim = background_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s03_0_p020_m01_Box_'),
          Effect = RM:loadAnimation('s03_0_p020_m01_Effect_'),
          Zero = RM:loadAnimation('s03_0_p020_m01_Zero_'),
          White = RM:loadAnimation('white'),
          Gas = Gas,
        },
        transitionTrigger = {
          [1] = "timer",--"waitForInput",
          [2] = .75--1.27
        },
        drawData = {
          [1] = {
            anim = "Box",
            alpha = boxAlpha,
            red = boxDarken,
            green = boxDarken, 
            blue = boxDarken
          },
          [2] = {
            anim = "Effect",
          },
          [3] = {
            anim = "Zero",
            xScale = .9,
            yScale = .9,
            xOffset = 2320/2,
            yOffset = 1480/2,
            x = 2320/2 - 200 ,
            y = 1480/2 - 200,
          },
          [4] = {
            anim = "White",
            alpha = 1,
            tween = {1.2, {alpha = 0}, "out-cubic"}
          },
          [5] = {
            anim = "Gas",
            alpha = 0,
            tween = {1.2, {alpha = 1}, "out-cubic"}
          },
        },
      },
      [2] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s03_0_p020_m01_Box_'),
          Effect = RM:loadAnimation('s03_0_p020_m01_Effect_'),
          Zero = RM:loadAnimation('s03_0_p020_m01_Zero_'),
          Gas = Gas,
        },
        transitionTrigger = {
          [1] = "timer",--"waitForInput",
          [2] = .75--1.27
        },
        drawData = {
          [1] = {
            anim = "Box",
            alpha = boxAlpha,
            red = boxDarken,
            green = boxDarken, 
            blue = boxDarken
          },
          [2] = {
            anim = "Effect",
          },
          [3] = {
            anim = "Zero",
            xOffset = 2320/2,
            yOffset = 1480/2,
            x = 2320/2 - 200 ,
            y = 1480/2 - 200,
            xScale = .9,
            yScale = .9,
            tween = {1.2, {y = 1480/2 - 200 -75, xScale = 1.2, yScale = 1.2}, "out-cubic"}
          },
          [4] = {
            anim = "Gas",
          },
        },
      },
    },
  },
  [21] = {
    bg = {
      anim = background_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Zero = RM:loadAnimation('s03_0_p021_m01_Zero_'),
          Box = RM:loadAnimation('s03_0_p021_m01_Box_'),
          Gas = Gas,
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
            alpha = boxAlpha,
            red = boxDarken,
            green = boxDarken, 
            blue = boxDarken
          },
          [2] = {
            anim = "Zero",
          },
          [3] = {
            anim = "Gas",
          },
        },
      },
    },
  },
  [22] = {
    bg = {
      anim = background_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit = RM:loadAnimation('s03_0_p022_m01_Quit_'),
          Box = RM:loadAnimation('s03_0_p022_m01_Box_'),
          Gas = Gas,
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
            alpha = boxAlpha,
            red = boxDarken,
            green = boxDarken, 
            blue = boxDarken
          },
          [2] = {
            anim = "Quit",
          },
          [3] = {
            anim = "Gas",
          },
        },
      },
    },
  },
  [23] = {
    bg = {
      anim = background_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Zero = RM:loadAnimation('s03_0_p023_m01_Zero_'),
          Box = RM:loadAnimation('s03_0_p023_m01_Box_'),
          Gas = Gas,
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
            alpha = boxAlpha,
            red = boxDarken,
            green = boxDarken, 
            blue = boxDarken
          },
          [2] = {
            anim = "Zero",
          },
          [3] = {
            anim = "Gas",
          },
        },
      },
    },
  },
  [24] = {
    bg = {
      anim = background_blur,

    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Zero = RM:loadAnimation('s03_0_p024_m01_Zero_'),
          Box = RM:loadAnimation('s03_0_p024_m01_Box_'),
          Gas = Gas,
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
            alpha = boxAlpha,
            red = boxDarken,
            green = boxDarken, 
            blue = boxDarken
          },
          [2] = {
            anim = "Zero",
          },
          [3] = {
            anim = "Gas",
          },
        },
      },
    },
  },
  [25] = {
    bg = {
      anim = background_blur,

    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Zero = RM:loadAnimation('s03_0_p025_m01_Zero_'),
          Box = RM:loadAnimation('s03_0_p025_m01_Box_'),
          Gas = Gas,
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
            alpha = boxAlpha,
            red = boxDarken,
            green = boxDarken, 
            blue = boxDarken
          },
          [2] = {
            anim = "Zero",
          },
          [3] = {
            anim = "Gas",
          },
        },
      },
    },
  },
  [26] = {
    bg = {
      anim = background_blur,

    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Zero = RM:loadAnimation('s03_0_p026_m01_Zero_'),
          Box = RM:loadAnimation('s03_0_p026_m01_Box_'),
          Gas = Gas,
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
            alpha = boxAlpha,
            red = boxDarken,
            green = boxDarken, 
            blue = boxDarken
          },
          [2] = {
            anim = "Zero",
          },
          [3] = {
            anim = "Gas",
          },
        },
      },
    },
  },
  [27] = {
    bg = {
      anim = background_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Zero = RM:loadAnimation('s03_0_p027_m01_Zero_'),
          Box = RM:loadAnimation('s03_0_p027_m01_Box_'),
          Gas = Gas,
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
            alpha = boxAlpha,
            red = boxDarken,
            green = boxDarken, 
            blue = boxDarken
          },
          [2] = {
            anim = "Zero",
          },
          [3] = {
            anim = "Gas",
          },
        },
      },
    },
  },
  [28] = {
    bg = {
      anim = background_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Zero = RM:loadAnimation('s03_0_p028_m01_Zero_'),
          Box = RM:loadAnimation('s03_0_p028_m01_Box_'),
          Gas = Gas,
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
            alpha = boxAlpha,
            red = boxDarken,
            green = boxDarken, 
            blue = boxDarken
          },
          [2] = {
            anim = "Zero",
          },
          [3] = {
            anim = "Gas",
          },
        },
      },
    },
  },
  [29] = {
    bg = {
      anim = background_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit_End = RM:loadAnimation('s03_0_p029_m01_Quit_End_'),
          Box = RM:loadAnimation('s03_0_p029_m01_Box_'),
          Gas = Gas,
        },
        transitionTrigger = {
--          [1] = "waitForInput",
          [1] = "timer",
          [2] = 2,
        },
        drawData = {
          [1] = {
            anim = "Box",
            alpha = boxAlpha,
            red = boxDarken,
            green = boxDarken, 
            blue = boxDarken
          },
          [2] = {
            anim = "Quit_End",
            -- plz separate quit and end
            -- I want to do a thing where end comes in from left and quit from right to create the illusion of rotation. Sorta like how pokemon battles start
          },
          [3] = {
            anim = "Gas",
            alpha = 1,
            tween = {2, {alpha = 0}},
          },
        },
      },
    },
  },
  [30] = {
    bg = {
      anim = background_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s03_0_p030_m01_Box_'),
          Quit = RM:loadAnimation('s03_0_p030_m01_Quit_'),
          Text = RM:loadAnimation('s03_0_p030_m01_Text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
            alpha = boxAlpha,
            red = boxDarken,
            green = boxDarken, 
            blue = boxDarken
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
          [3] = {
            anim = "Text",
          },
        },
      },
    },
  },
  [31] = {
    bg = {
      anim = background_blur,
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
          [1] = "timer",--"waitForInput",
          [2] = 1.8
        },
        drawData = {
          [1] = {
            anim = "Box",
            alpha = boxAlpha,
            red = boxDarken,
            green = boxDarken, 
            blue = boxDarken
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
      [2] = {
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
            alpha = boxAlpha,
            red = boxDarken,
            green = boxDarken, 
            blue = boxDarken
          },
          [2] = {
            anim = "Quit",
          },
        },
      },
    },
  },
  [32] = {
    bg = {
      anim = background,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Black = RM:loadAnimation('black'),
        },
        transitionTrigger = {
          [1] = "timer",--"waitForInput",
          [2] = .363
        },
        drawData = {
          [1] = {
            anim = "Black"
          },
        },
      },
      [2] = {
        sounds = {
        },

        anims = {
          Box = RM:loadAnimation('s03_0_p032_m01_Box_'),
          End = RM:loadAnimation('s03_0_p032_m01_End_'),
          Quit = RM:loadAnimation('s03_0_p032_m01_Quit_'),
        },
        transitionTrigger = {
          [1] = "timer",--"waitForInput",
          [2] = .4
        },
        drawData = {
          [1] = {
            anim = "Box",
            alpha = boxAlpha,
            red = boxDarken,
            green = boxDarken, 
            blue = boxDarken
          },
          [2] = {
            anim = "End",
          },
          [3] = {
            anim = "Quit",
          },
        },
      },
      [3] = {
        sounds = {
        },
        music = "End_Ex_Soldier",
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
            alpha = boxAlpha,
            red = boxDarken,
            green = boxDarken, 
            blue = boxDarken
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
  [33] = {
    bg = {
      anim = background_blur,
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
            alpha = boxAlpha,
            red = boxDarken,
            green = boxDarken, 
            blue = boxDarken
          },
          [2] = {
            anim = "Quit",
          },
        },
      },
    },
  },
  [34] = {
    bg = {
      anim = background_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s03_0_p034_m01_Box_'),
          End = RM:loadAnimation('s03_0_p034_m01_End_'),
          Text = RM:loadAnimation('s03_0_p034_m01_Text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
            alpha = boxAlpha,
            red = boxDarken,
            green = boxDarken, 
            blue = boxDarken
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
  [35] = {
    bg = {
      anim = background_blur,
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
            alpha = boxAlpha,
            red = boxDarken,
            green = boxDarken, 
            blue = boxDarken
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
            alpha = boxAlpha,
            red = boxDarken,
            green = boxDarken, 
            blue = boxDarken
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
            alpha = boxAlpha,
            red = boxDarken,
            green = boxDarken, 
            blue = boxDarken
          },
          [2] = {
            anim = "End",
          },
        },
      },
    },
  },
  [38] = {
    bg = {
      anim = background_blur,

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
            alpha = boxAlpha,
            red = boxDarken,
            green = boxDarken, 
            blue = boxDarken
          },
          [2] = {
            anim = "End_Zero",
          },
        },
      },
    },
  },
  [39] = {
    bg = {
      anim = background_blur,
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
            alpha = boxAlpha,
            red = boxDarken,
            green = boxDarken, 
            blue = boxDarken
          },
          [2] = {
            anim = "Zero",
          },
        },
      },
    },
  },
  [40] = {
    bg = {
      anim = background_blur,
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
            alpha = boxAlpha,
            red = boxDarken,
            green = boxDarken, 
            blue = boxDarken
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
            alpha = boxAlpha,
            red = boxDarken,
            green = boxDarken, 
            blue = boxDarken
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
            alpha = boxAlpha,
            red = boxDarken,
            green = boxDarken, 
            blue = boxDarken
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
  [42] = {
    bg = {
      anim = background,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit_End = RM:loadAnimation('s03_0_p042_m01_Quit_End_'),
          Box = RM:loadAnimation('s03_0_p042_m01_Box_'),
          Text = RM:loadAnimation('s03_0_p042_m01_Text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
            alpha = boxAlpha,
            red = boxDarken,
            green = boxDarken, 
            blue = boxDarken
          },
          [2] = {
            anim = "Quit_End",
          },
          [3] = {
            anim = "Text",
          },
        },
      },
      [2] = {
        sounds = {
        },
        anims = {
          Quit_End = RM:loadAnimation('s03_0_p042_m01_Quit_End_'),
          Box = RM:loadAnimation('s03_0_p042_m01_Box_'),
          Text = RM:loadAnimation('s03_0_p042_m02_Text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
            alpha = boxAlpha,
            red = boxDarken,
            green = boxDarken, 
            blue = boxDarken
          },
          [2] = {
            anim = "Quit_End",
          },
          [3] = {
            anim = "Text",
          },
        },
      },
    },
  },
  [43] = {
    bg = {
      anim = background_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit = RM:loadAnimation('s03_0_p043_m01_Quit_'),
          Box = RM:loadAnimation('s03_0_p043_m01_Box_'),
          Text = RM:loadAnimation('s03_0_p043_m01_Text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
            alpha = boxAlpha,
            red = boxDarken,
            green = boxDarken, 
            blue = boxDarken
          },
          [2] = {
            anim = "Quit",
          },
          [3] = {
            anim = "Text",
          },
        },
      },
    },
  },
  [44] = {
    bg = {
      anim = background_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s03_0_p044_m01_Box_'),
          End = RM:loadAnimation('s03_0_p044_m01_End_'),
          Text = RM:loadAnimation('s03_0_p044_m01_Text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
            alpha = boxAlpha,
            red = boxDarken,
            green = boxDarken, 
            blue = boxDarken
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
  [45] = {
    bg = {
      anim = background_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit = RM:loadAnimation('s03_0_p045_m01_Quit_'),
          Box = RM:loadAnimation('s03_0_p045_m01_Box_'),
          Text = RM:loadAnimation('s03_0_p045_m01_Text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
            alpha = boxAlpha,
            red = boxDarken,
            green = boxDarken, 
            blue = boxDarken
          },
          [2] = {
            anim = "Quit",
          },
          [3] = {
            anim = "Text",
          },
        },
      },
    },
  },
  [46] = {
    bg = {
      anim = background_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s03_0_p046_m01_Box_'),
          End = RM:loadAnimation('s03_0_p046_m01_End_'),
          Text = RM:loadAnimation('s03_0_p046_m01_Text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
            alpha = boxAlpha,
            red = boxDarken,
            green = boxDarken, 
            blue = boxDarken
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
  [47] = {
    bg = {
      anim = background_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit = RM:loadAnimation('s03_0_p047_m01_Quit_'),
          Box = RM:loadAnimation('s03_0_p047_m01_Box_'),
          Text = RM:loadAnimation('s03_0_p047_m01_Text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
            alpha = boxAlpha,
            red = boxDarken,
            green = boxDarken, 
            blue = boxDarken
          },
          [2] = {
            anim = "Quit",
          },
          [3] = {
            anim = "Text",
          },
        },
      },
--      [2] = {
--        sounds = {
--        },
--        anims = {
--          bg = RM:loadAnimation('s03_0_p047_m02_bg_'),
--          Box = RM:loadAnimation('s03_0_p047_m02_Box_'),
--        },
--        transitionTrigger = {
--          [1] = "waitForInput",
--        },
--        drawData = {
--          [1] = {
--            anim = "Box",
--            alpha = boxAlpha,
--            red = boxDarken,
--            green = boxDarken, 
--            blue = boxDarken
--          },
--          [2] = {
--            anim = "bg",
--          },
--        },
--      },
--      [3] = {
--        sounds = {
--        },
--        anims = {
--          Box = RM:loadAnimation('s03_0_p047_m03_Box_'),
--        },
--        transitionTrigger = {
--          [1] = "waitForInput",
--        },
--        drawData = {
--          [1] = {
--            anim = "Box",
--            alpha = boxAlpha,
--            red = boxDarken,
--            green = boxDarken, 
--            blue = boxDarken
--          },
--        },
--      },
    },
  },
  [49] = {
    bg = {
      anim = background_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit = RM:loadAnimation('s03_0_p049_m01_Quit_'),
          Text = RM:loadAnimation('s03_0_p049_m01_Text_'),
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
          [2] = {
            anim = "Text",
          },
        },
      },
    },
  },





-- Caution:
-- Panel order after this is changed so the panel numbering mismatch filenames.
-- The correct panel order: p050, p054, p055, p056, p057, p053
-- This note is only to avoid confusion

  [50] = {
    bg = {
      anim = background,
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
            alpha = boxAlpha,
            red = boxDarken,
            green = boxDarken, 
            blue = boxDarken
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
          Text = RM:loadAnimation('s03_0_p050_m02_Text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
            alpha = boxAlpha,
            red = boxDarken,
            green = boxDarken, 
            blue = boxDarken
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
          },
          [5] = {
            anim = "Text",
          },
        },
      },
    },
  },
--  [49] = {
--    bg = {
--      anim = background_blur,
--    },
--    moments = {
--      [1] = {
--        sounds = {
--        },
--        anims = {
--          Quit = RM:loadAnimation('s03_0_p051_m01_Quit_'),
--          Box = RM:loadAnimation('s03_0_p051_m01_Box_'),
--        },
--        transitionTrigger = {
--          [1] = "waitForInput",
--        },
--        drawData = {
--          [1] = {
--            anim = "Box",
--            alpha = boxAlpha,
--            red = boxDarken,
--            green = boxDarken, 
--            blue = boxDarken
--          },
--          [2] = {
--            anim = "Quit",
--            xScale = .9,
--            yScale = .9,
--            xOffset = 2320/2,
--            yOffset = 1480/2,
--            x = 2320/2 - 200,
--            y = 1480/2 - 200,
----            tween = {1, { y = 1480/2 - 200,     }, "in-linear"} -- TODO: Make it possible to have multiple tweens with different timing 
--            tween = {3, { xScale = 1, yScale = 1}, "out-quad"}
--          },
--        },
--      },
--    },
--  },
--  [50] = {
--    bg = {
--      anim = background_blur,
--    },
--    moments = {
--      [1] = {
--        sounds = {
--        },
--        anims = {
--          Quit = RM:loadAnimation('s03_0_p052_m01_Quit_'),
--          Box = RM:loadAnimation('s03_0_p052_m01_Box_'),
--        },
--        transitionTrigger = {
--          [1] = "waitForInput",
--        },
--        drawData = {
--          [1] = {
--            anim = "Box",
--            alpha = boxAlpha,
--            red = boxDarken,
--            green = boxDarken, 
--            blue = boxDarken
--          },
--          [2] = {
--            anim = "Quit",
--          },
--        },
--      },
--    },
--  },




  [53] = { -- 54 rearranged
    bg = {
      anim = background_blur,
    },
    moments = {
      -- TODO: Add moment here with text and sword
      [1] = {
        sounds = {
        },
        anims = {
          Quit = RM:loadAnimation('s03_0_p054_m01_Quit1_'),
          Sword = RM:loadAnimation('s03_0_p054_m01_QuitSword_'),
          Box = RM:loadAnimation('s03_0_p054_m01_Box_'),
          Text = RM:loadAnimation('s03_0_p054_m01_Text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput", -- HACK: to show text, should be show text, then drop sword next mooment
--          [1] = "timer",--"waitForInput",
--          [2] = .82
        },
        drawData = {
          [1] = {
            anim = "Box",
            alpha = boxAlpha,
            red = boxDarken,
            green = boxDarken, 
            blue = boxDarken
          },
          [2] = {
            anim = "Quit",
          },
          [3] = {
            anim = "Sword",
            x = 30,
            y = -500,
            tween = {.75, {x = 0, y = 0}, "in-bounce"}
          },
          [4] = {
            anim = "Text",
          },
        },
      },
    },
  },
  [54] = { --55 rearranged
    bg = {
      anim = background_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit = RM:loadAnimation('s03_0_p055_m01_Quit_'),
          Box = RM:loadAnimation('s03_0_p055_m01_Box_'),
          Text = RM:loadAnimation('s03_0_p055_m01_Text_'),
        },
        transitionTrigger = {
          [1] = "timer",--"waitForInput",
          [2] = 1.3
        },
        drawData = {
          [1] = {
            anim = "Box",
            alpha = boxAlpha,
            red = boxDarken,
            green = boxDarken, 
            blue = boxDarken
          },
          [2] = {
            anim = "Quit",
          },
        },
      },
    },
  },
  [55] = { --56 rearranged
    bg = {
      anim = background_blur,
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
            alpha = boxAlpha,
            red = boxDarken,
            green = boxDarken, 
            blue = boxDarken
          },
          [2] = {
            anim = "Quit",
          },
        },
      },
    },
  },
  [56] = { -- 57, just rearranged
    bg = {
      anim = background_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit = RM:loadAnimation('s03_0_p057_m01_Quit_'),
          Box = RM:loadAnimation('s03_0_p057_m01_Box_'),
          Text = RM:loadAnimation('s03_0_p057_m01_Text_'),
          White = RM:loadAnimation('white'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
            alpha = boxAlpha,
            red = boxDarken,
            green = boxDarken, 
            blue = boxDarken
          },
          [2] = {
            anim = "Quit",
          },
          [3] = {
            anim = "Text",
          },
          [4] = {
            anim = "White",
            alpha = .8,

            tween = {.8, {alpha = 0}, "out-quint"}
          },
        },
      },
    },
  },
  [57] = { -- 53 rearranged
    bg = {
      anim = background_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation('s03_0_p053_m01_End_'),
          Box = RM:loadAnimation('s03_0_p053_m01_Box_'),
          Text = RM:loadAnimation('s03_0_p053_m01_Text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
          enemyToGoTo = "enemyQuit3",
        },
        drawData = {
          [1] = {
            anim = "Box",
            alpha = boxAlpha,
            red = boxDarken,
            green = boxDarken, 
            blue = boxDarken
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
}
