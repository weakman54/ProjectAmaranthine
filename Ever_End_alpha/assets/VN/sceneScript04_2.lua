local RM = require 'resourceManager.resourceManager'
RM.prefix = 'assets/VN/scene04_2_killOption/'

local background = RM:loadAnimation('Inside_robot_')
local background_blur = RM:loadAnimation('inside_robot_blur_')


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
          Box = RM:loadAnimation('s04_2_p001_m01_Box_'),
          End = RM:loadAnimation('s04_2_p001_m01_End_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken
          },
          [2] = {
            anim = "End",
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
          Zero = RM:loadAnimation('s04_2_p002_m01_Zero_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken
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
      anim = background_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s04_2_p003_m01_Box_'),
          End = RM:loadAnimation('s04_2_p003_m01_End_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken
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
      anim = background_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s04_2_p004_m01_Box_'),
          End_Zero = RM:loadAnimation('s04_2_p004_m01_End_Zero_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken
          },
          [2] = {
            anim = "End_Zero",
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
          End_Zero = RM:loadAnimation('s04_2_p005_m01_End_Zero_'),
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
          End_Zero = RM:loadAnimation('s04_2_p006_m01_End_Zero_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken
          },
          [2] = {
            anim = "End_Zero",
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
          Box = RM:loadAnimation('s04_2_p007_m01_Box_'),
          Quit = RM:loadAnimation('s04_2_p007_m01_Quit_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken
          },
          [2] = {
            anim = "Quit",
          },
        },
      },
    },
  },
  [8] = {
    bg = {
      anim = background_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s04_2_p008_m01_Box_'),

        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken
          },
        },
      },
    },
  },
  [9] = {
    bg = {
      anim = background_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s04_2_p009_m01_Box_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
          gotoScene = "End",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken
          },
        },
      },
    },
  },
}