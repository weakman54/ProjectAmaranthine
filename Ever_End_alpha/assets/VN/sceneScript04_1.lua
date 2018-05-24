-- REPLACE FILE with generated script when background boxes exist
local RM = require 'resourceManager.resourceManager'
RM.prefix = 'assets/VN/scene04_1_spareOption/'

local background = RM:loadAnimation('Inside_robot_')
local boxDarken = 0.1
local boxAlpha = 0.8

return {
  [1] = {
    bg = {
      anim = background,
    },
    moments = {
      [1] = {
        sounds = {
        },
        music = "Conflict to Resolve Theme (Happy) Full",
        anims = {
          Box = RM:loadAnimation('s04_1_p001_m01_Box_'),
          End = RM:loadAnimation('s04_1_p001_m01_End_'),
          Quit = RM:loadAnimation('s04_1_p001_m01_Quit_'),
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
  [2] = {
    bg = {
      anim = background,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End_Quit = RM:loadAnimation('s04_1_p002_m01_End_Quit_'),
          Box = RM:loadAnimation('s04_1_p002_m01_Box_'),
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
  [3] = {
    bg = {
      anim = background,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit = RM:loadAnimation('s04_1_p003_m01_Quit_'),
          Box = RM:loadAnimation('s04_1_p003_m01_Box_'),
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
  [4] = {
    bg = {
      anim = background,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation('s04_1_p004_m01_End_'),
          Box = RM:loadAnimation('s04_1_p004_m01_Box_'),
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
  [5] = {
    bg = {
      anim = background,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit = RM:loadAnimation('s04_1_p005_m01_Quit_'),
          End_End = RM:loadAnimation('s04_1_p005_m01_End_End_'),
          Box = RM:loadAnimation('s04_1_p005_m01_Box_'),
          Quit = RM:loadAnimation('s04_1_p005_m01_Quit_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "End_End",
          },
          [3] = {
            anim = "Quit",
          },
        },
      },
    },
  },
  [6] = {
    bg = {
      anim = background,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End_Zero_Quit = RM:loadAnimation('s04_1_p006_m01_End_Zero_Quit_'),
          Box = RM:loadAnimation('s04_1_p006_m01_Box_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "End_Zero_Quit",
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
          EEnd_Zero = RM:loadAnimation('s04_1_p007_m01_End_Zero_'),
          Box = RM:loadAnimation('s04_1_p007_m01_Box_'),
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
  [8] = {
    bg = {
      anim = background,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit = RM:loadAnimation('s04_1_p008_m01_Quit_'),
          Box = RM:loadAnimation('s04_1_p008_m01_Box_'),
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
  [9] = {
    bg = {
      anim = background,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End_Zero_Quit = RM:loadAnimation('s04_1_p009_m01_End_Zero_Quit_'),
          Box = RM:loadAnimation('s04_1_p009_m01_Box_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "End_Zero_Quit",
          },
        },
      },
    },
  },
  [10] = {
    bg = {
      anim = background,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          EEnd_Zero = RM:loadAnimation('s04_1_p010_m01_End_Zero_'),
          Box = RM:loadAnimation('s04_1_p010_m01_Box_'),
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
  [11] = {
    bg = {
      anim = background,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation('s04_1_p011_m01_End_'),
          Box = RM:loadAnimation('s04_1_p011_m01_Box_'),
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
  [12] = {
    bg = {
      anim = background,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s04_1_p012_m01_Box_'),
          Zero = RM:loadAnimation('s04_1_p012_m01_Zero_'),
          Quit = RM:loadAnimation('s04_1_p012_m01_Quit_'),
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
            anim = "Zero",
          },
        },
      },
    },
  },
  [13] = {
    bg = {
      anim = background,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s04_1_p013_m01_Box_'),
          Quit = RM:loadAnimation('s04_1_p012_m01_Quit_'),
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
  [14] = {
    bg = {
      anim = background,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s04_1_p014_m01_Box_'),
          Quit = RM:loadAnimation('s04_1_p012_m01_Quit_'),
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
  [15] = {
    bg = {
      anim = background,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s04_1_p015_m01_Box_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
          gotoScene = "End"
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
        },
      },
    },
  },
}
