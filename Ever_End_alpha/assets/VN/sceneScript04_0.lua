
local RM = require 'resourceManager.resourceManager'
RM.prefix = 'assets/VN/scene04_0_aftermath/'

return {
  [1] = {
    bg = {
      anim = RM:loadAnimation('s04_0_p001_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation('s04_0_p001_m01_End_'),
          Quit = RM:loadAnimation('s04_0_p001_m01_Quit_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "End",
          },
          [2] = {
            anim = "Quit",
          },
        },
      },
    },
  },
  [2] = {
    bg = {
      anim = RM:loadAnimation('s04_0_p002_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit = RM:loadAnimation('s04_0_p002_m01_Quit_'),
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
  [3] = {
    bg = {
      anim = RM:loadAnimation('s04_0_p003_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation('s04_0_p003_m01_End_'),
          Quit = RM:loadAnimation('s04_0_p003_m01_Quit_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "End",
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
      anim = RM:loadAnimation('s04_0_p004_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End_Quit = RM:loadAnimation('s04_0_p004_m01_End_Quit_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "End_Quit",
          },
        },
      },
    },
  },
  [5] = {
    bg = {
      anim = RM:loadAnimation('s04_0_p005_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End_Quit = RM:loadAnimation('s04_0_p005_m01_End_Quit_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "End_Quit",
          },
        },
      },
    },
  },
  [6] = {
    bg = {
      anim = RM:loadAnimation('s04_0_p006_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Zero = RM:loadAnimation('s04_0_p006_m01_Zero_'),
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
  [7] = {
    bg = {
      anim = RM:loadAnimation('s04_0_p007_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit = RM:loadAnimation('s04_0_p007_m01_Quit_'),
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
  [8] = {
    bg = {
      anim = RM:loadAnimation('s04_0_p008_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit = RM:loadAnimation('s04_0_p008_m01_Quit_'),
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
  [9] = {
    bg = {
      anim = RM:loadAnimation('s04_0_p009_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit = RM:loadAnimation('s04_0_p009_m01_Quit_'),
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
  [10] = {
    bg = {
      anim = RM:loadAnimation('s04_0_p010_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation('s04_0_p010_m01_End_'),
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
  [11] = {
    bg = {
      anim = RM:loadAnimation('s04_0_p011_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
        },
        transitionTrigger = {
          [1] = "waitForInput",
          gotoScene = "04_1"
        },
        drawData = {
        },
      },
    },
  },
}