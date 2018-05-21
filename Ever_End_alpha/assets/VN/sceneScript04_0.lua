
local RM = require 'resourceManager.resourceManager'
RM.prefix = 'assets/VN/scene04_0_aftermath/'

local background = RM:loadAnimation('Inside_robot_')

return {
  [1] = {
    bg = {
      anim = background,
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
          End = RM:loadAnimation('s04_0_p003_m01_End_Quit_'),
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
  [4] = {
    bg = {
      anim = RM:loadAnimation('s04_0_p004_bg_'),
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
  [5] = {
    bg = {
      anim = RM:loadAnimation('s04_0_p005_bg_'),
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
  [6] = {
    bg = {
      anim = RM:loadAnimation('s04_0_p006_bg_'),
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
  [7] = {
    bg = {
      anim = RM:loadAnimation('s04_0_p007_bg_'),
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
  [8] = {
    bg = {
      anim = RM:loadAnimation('s04_0_p008_bg_'),
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
  [9] = {
    bg = {
      anim = background,
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
  [10] = {
    bg = {
      anim = background,
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
  [11] = {
    bg = {
      anim = background,
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