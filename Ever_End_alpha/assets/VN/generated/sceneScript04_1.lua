
local RM = require 'resourceManager.resourceManager'
RM.prefix = 'assets/VN/scene04_1_spareOption/'

return {
  [1] = {
    bg = {
      anim = RM:loadAnimation('s04_1_p001_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation('s04_1_p001_m01_End_'),
          Quit = RM:loadAnimation('s04_1_p001_m01_Quit_'),
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
      anim = RM:loadAnimation('s04_1_p002_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End_Quit = RM:loadAnimation('s04_1_p002_m01_End_Quit_'),
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
  [3] = {
    bg = {
      anim = RM:loadAnimation('s04_1_p003_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit = RM:loadAnimation('s04_1_p003_m01_Quit_'),
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
  [4] = {
    bg = {
      anim = RM:loadAnimation('s04_1_p004_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation('s04_1_p004_m01_End_'),
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
  [5] = {
    bg = {
      anim = RM:loadAnimation('s04_1_p005_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit = RM:loadAnimation('s04_1_p005_m01_Quit_'),
          End_End = RM:loadAnimation('s04_1_p005_m01_End_End_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "End_End",
          },
          [2] = {
            anim = "Quit",
          },
        },
      },
    },
  },
  [6] = {
    bg = {
      anim = RM:loadAnimation('s04_1_p006_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End_Zero_Quit = RM:loadAnimation('s04_1_p006_m01_End_Zero_Quit_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "End_Zero_Quit",
          },
        },
      },
    },
  },
  [7] = {
    bg = {
      anim = RM:loadAnimation('s04_1_p007_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End_Zero = RM:loadAnimation('s04_1_p007_m01_End_Zero_'),
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
  [8] = {
    bg = {
      anim = RM:loadAnimation('s04_1_p008_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit = RM:loadAnimation('s04_1_p008_m01_Quit_'),
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
      anim = RM:loadAnimation('s04_1_p009_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End_Zero_Quit = RM:loadAnimation('s04_1_p009_m01_End_Zero_Quit_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "End_Zero_Quit",
          },
        },
      },
    },
  },
  [10] = {
    bg = {
      anim = RM:loadAnimation('s04_1_p010_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End_Zero = RM:loadAnimation('s04_1_p010_m01_End_Zero_'),
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
  [11] = {
    bg = {
      anim = RM:loadAnimation('s04_1_p011_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation('s04_1_p011_m01_End_'),
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
      anim = RM:loadAnimation('s04_1_p012_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Zero = RM:loadAnimation('s04_1_p012_m01_Zero_'),
          Quit = RM:loadAnimation('s04_1_p012_m01_Quit_'),
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
    },
  },
  [13] = {
    bg = {
      anim = RM:loadAnimation('s04_1_p013_bg_'),
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
  [14] = {
    bg = {
      anim = RM:loadAnimation('s04_1_p014_bg_'),
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
  [15] = {
    bg = {
      anim = RM:loadAnimation('s04_1_p015_bg_'),
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
}