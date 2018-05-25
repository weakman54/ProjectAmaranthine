local RM = require 'resourceManager.resourceManager'
RM.prefix = 'assets/VN/scene04_2_killOption/'

local background = RM:loadAnimation('Inside_robot_')
local background_blur = RM:loadAnimation('inside_robot_blur_')
local boxDarken = 0.1
local boxAlpha = 0.8

return {
  [1] = {
    bg = {
      anim = background_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        music = "stop",
        anims = {
          White = RM:loadAnimation('white'),
          Box = RM:loadAnimation('s04_2_p001_m01_Box_'),
          EEnd = RM:loadAnimation('s04_2_p001_m01_End_'),
        },
        transitionTrigger = {
          [1] = "timer",--"waitForInput",
          [2] = 3
        },
        drawData = {
          [1] = {
            anim = "White",
            alpha = 1, tween = {3, { alpha = .66 }, "in-linear" },
          },
          [2] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken
          },
          [3] = {
            anim = "EEnd",
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
          Box = RM:loadAnimation('s04_2_p002_m01_Box_'),
          White = RM:loadAnimation('white'),
          Zero = RM:loadAnimation('s04_2_p002_m01_Zero_'),
        },
        transitionTrigger = {
          [1] = "timer",--"waitForInput",
          [2] = 2
        },
        drawData = {
          [2] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken
          },  
          [3] = {
            anim = "Zero",
          },
                    [1] = {
            anim = "White",
            alpha = .63, tween = {2, { alpha = .33 }, "in-linear" },
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
          Box = RM:loadAnimation('s04_2_p003_m01_Box_'),
          White = RM:loadAnimation('white'),
          EEnd = RM:loadAnimation('s04_2_p003_m01_End_'),
        },
        transitionTrigger = {
          [1] = "timer",--"waitForInput",
          [2] = 3
        },
        drawData = {
                             [1] = {
            anim = "White",
                        alpha = .63, tween = {2, { alpha = .33 }, "in-linear" },

          },
          [2] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken
          },
          [3] = {
            anim = "EEnd",
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
          Box = RM:loadAnimation('s04_2_p004_m01_Box_'),
          White = RM:loadAnimation('white'),
          EEnd_Zero = RM:loadAnimation('s04_2_p004_m01_End_Zero_'),
        },
        transitionTrigger = {
          [1] = "timer",--"waitForInput",
          [2] = 2.0
        },
        drawData = {
         [1] = {
            anim = "White",
            alpha = .63, tween = {2, { alpha = .33 }, "in-linear" },

          },
          [2] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken
          },
          [3] = {
            anim = "EEnd_Zero",
          },
        },
      },
    },
  },
  [5] = {
    bg = {
      anim = background_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s04_2_p005_m01_Box_'),
          White = RM:loadAnimation('white'),
          EEnd_Zero = RM:loadAnimation('s04_2_p005_m01_End_Zero_'),
        },
        transitionTrigger = {
          [1] = "timer",--"waitForInput",
          [2] = 3
        },
        drawData = {
          
          [1] = {
            anim = "White",
            alpha = .63, tween = {2, { alpha = .33 }, "in-linear" },

          },
          [2] = {
            anim = "Box",
          },
          [3] = {
            anim = "EEnd_Zero",
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
          Box = RM:loadAnimation('s04_2_p006_m01_Box_'),
          White = RM:loadAnimation('white'),
          EEnd_Zero = RM:loadAnimation('s04_2_p006_m01_End_Zero_'),
        },
        transitionTrigger = {
          [1] = "timer",--"waitForInput",
          [2] = 2.0
        },
        drawData = {
          
            [1] = {
            anim = "White",
            alpha = .63, tween = {2, { alpha = 0 }, "in-linear" },

          },
          [2] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken
          },
          [3] = {
            anim = "EEnd_Zero",
          },
        },
      },
    },
  },
  [7] = {
    bg = {
      anim = background_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box1 = RM:loadAnimation('s04_2_p009_m01_Box_'),
          Box2 = RM:loadAnimation('s04_2_p009_m01_Box_'),
          Black = RM:loadAnimation('black'),
          Quit = RM:loadAnimation('s04_2_p007_m01_Quit_'),
        },
        transitionTrigger = {
          [1] = "timer",--"waitForInput",
          [2] = 6.0,
          gotoScene = "End",
          
        },
        drawData = {
           [2] = {
            anim = "Box1",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
            x = -1800, y = 0, tween = {5, { x = -1160 }, "in-linear" },
            
          },
          [3] = {
            anim = "Box2",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
            x = 1800, y = 0, tween = {5, { x = 1160 }, "in-linear" },
            
          },
          [1] = {
            anim = "Quit",
          },
          [4] = {
            anim = "Black",
            alpha = 0, tween = {5, { alpha = 1 }, "in-cubic" },
          },
        },
      },
    },
  },
}