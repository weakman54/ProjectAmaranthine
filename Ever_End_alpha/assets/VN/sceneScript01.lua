
local RM = require 'resourceManager.resourceManager'
RM.prefix = 'assets/VN/scene01_stuffHappensHere/'

return {
  [1] = {
    bg = RM:loadAnimation('s01_p001_bg_'),
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          ElevatorRight = RM:loadAnimation('s01_p001_m01_ElevatorRight_'),
          EndZero = RM:loadAnimation('s01_p001_m01_EndZero_'),
          ElevatorLeft = RM:loadAnimation('s01_p001_m01_ElevatorLeft_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "ElevatorLeft",
          },
          [2] = {
            anim = "ElevatorRight",
          },
          [3] = {
            anim = "EndZero",
          },
        },
      },
    },
  },
  [2] = {
    bg = RM:loadAnimation('s01_p002_bg_'),
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
  [3] = {
    bg = RM:loadAnimation('s01_p003_bg_'),
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          EndZero = RM:loadAnimation('s01_p003_m01_EndZero_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "EndZero",
          },
        },
      },
    },
  },
  [4] = {
    bg = RM:loadAnimation('s01_p004_bg_'),
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          EndZero = RM:loadAnimation('s01_p004_m01_EndZero_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "EndZero",
          },
        },
      },
    },
  },
  [5] = {
    bg = RM:loadAnimation('s01_p005_bg_'),
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          EndZero = RM:loadAnimation('s01_p005_m01_EndZero_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "EndZero",
          },
        },
      },
    },
  },
  [6] = {
    bg = RM:loadAnimation('s01_p006_bg_'),
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
    bg = RM:loadAnimation('s01_p007_bg_'),
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
    bg = RM:loadAnimation('s01_p008_bg_'),
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
    bg = RM:loadAnimation('s01_p009_bg_'),
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
    bg = RM:loadAnimation('s01_p010_bg_'),
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
    bg = RM:loadAnimation('s01_p011_bg_'),
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
  [12] = {
    bg = RM:loadAnimation('s01_p012_bg_'),
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
  [13] = {
    bg = RM:loadAnimation('s01_p013_bg_'),
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
    bg = RM:loadAnimation('s01_p014_bg_'),
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          EndZero = RM:loadAnimation('s01_p014_m01_EndZero_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "EndZero",
          },
        },
      },
    },
  },
  [15] = {
    bg = RM:loadAnimation('s01_p015_bg_'),
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          EndZero = RM:loadAnimation('s01_p015_m01_EndZero_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "EndZero",
          },
        },
      },
    },
  },
  [16] = {
    bg = RM:loadAnimation('s01_p016_bg_'),
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          ZeroTiger = RM:loadAnimation('s01_p016_m01_ZeroTiger_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "ZeroTiger",
          },
        },
      },
    },
  },
  [17] = {
    bg = RM:loadAnimation('s01_p017_bg_'),
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Tiger = RM:loadAnimation('s01_p017_m01_Tiger_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Tiger",
          },
        },
      },
    },
  },
  [18] = {
    bg = RM:loadAnimation('s01_p018_bg_'),
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
  [19] = {
    bg = RM:loadAnimation('s01_p019_bg_'),
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation('s01_p019_m01_End_'),
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
    bg = RM:loadAnimation('s01_p020_bg_'),
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation('s01_p020_m01_End_'),
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
    bg = RM:loadAnimation('s01_p021_bg_'),
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
  [22] = {
    bg = RM:loadAnimation('s01_p022_bg_'),
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
  [23] = {
    bg = RM:loadAnimation('s01_p023_bg_'),
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
  [24] = {
    bg = RM:loadAnimation('s01_p024_bg_'),
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          ZeroTiger = RM:loadAnimation('s01_p024_m01_ZeroTiger_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "ZeroTiger",
          },
        },
      },
    },
  },
  [25] = {
    bg = RM:loadAnimation('s01_p025_bg_'),
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
  [26] = {
    bg = RM:loadAnimation('s01_p026_bg_'),
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
  [27] = {
    bg = RM:loadAnimation('s01_p027_bg_'),
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
  [28] = {
    bg = RM:loadAnimation('s01_p028_bg_'),
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          ZeroTiger = RM:loadAnimation('s01_p028_m01_ZeroTiger_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "ZeroTiger",
          },
        },
      },
    },
  },
  [29] = {
    bg = RM:loadAnimation('s01_p029_bg_'),
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
  [30] = {
    bg = RM:loadAnimation('s01_p030_bg_'),
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          ZeroTiger = RM:loadAnimation('s01_p030_m01_ZeroTiger_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "ZeroTiger",
          },
        },
      },
    },
  },
  [31] = {
    bg = RM:loadAnimation('s01_p031_bg_'),
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
  [32] = {
    bg = RM:loadAnimation('s01_p032_bg_'),
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
  [33] = {
    bg = RM:loadAnimation('s01_p033_bg_'),
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
  [34] = {
    bg = RM:loadAnimation('s01_p034_bg_'),
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
  [35] = {
    bg = RM:loadAnimation('s01_p035_bg_'),
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
    bg = RM:loadAnimation('s01_p036_bg_'),
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
    bg = RM:loadAnimation('s01_p037_bg_'),
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
  [38] = {
    bg = RM:loadAnimation('s01_p038_bg_'),
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
  [39] = {
    bg = RM:loadAnimation('s01_p039_bg_'),
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
  [40] = {
    bg = RM:loadAnimation('s01_p040_bg_'),
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation('s01_p040_m01_End_'),
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
  [41] = {
    bg = RM:loadAnimation('s01_p041_bg_'),
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
  [42] = {
    bg = RM:loadAnimation('s01_p042_bg_'),
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
  [43] = {
    bg = RM:loadAnimation('s01_p043_bg_'),
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
  [44] = {
    bg = RM:loadAnimation('s01_p044_bg_'),
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
  [45] = {
    bg = RM:loadAnimation('s01_p045_bg_'),
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
  [46] = {
    bg = RM:loadAnimation('s01_p046_bg_'),
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
  [47] = {
    bg = RM:loadAnimation('s01_p047_bg_'),
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
  [48] = {
    bg = RM:loadAnimation('s01_p048_bg_'),
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
  [49] = {
    bg = RM:loadAnimation('s01_p049_bg_'),
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          ZeroEnd = RM:loadAnimation('s01_p049_m01_ZeroEnd_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "ZeroEnd",
          },
        },
      },
    },
  },
  [50] = {
    bg = RM:loadAnimation('s01_p050_bg_'),
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
  [51] = {
    bg = RM:loadAnimation('s01_p051_bg_'),
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
  [52] = {
    bg = RM:loadAnimation('s01_p052_bg_'),
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
  [53] = {
    bg = RM:loadAnimation('s01_p053_bg_'),
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
  [54] = {
    bg = RM:loadAnimation('s01_p054_bg_'),
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
  [55] = {
    bg = RM:loadAnimation('s01_p055_bg_'),
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
  [56] = {
    bg = RM:loadAnimation('s01_p056_bg_'),
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
  [57] = {
    bg = RM:loadAnimation('s01_p057_bg_'),
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
  [58] = {
    bg = RM:loadAnimation('s01_p058_bg_'),
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
  [59] = {
    bg = RM:loadAnimation('s01_p059_bg_'),
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
  [60] = {
    bg = RM:loadAnimation('s01_p060_bg_'),
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
  [61] = {
    bg = RM:loadAnimation('s01_p061_bg_'),
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
  [62] = {
    bg = RM:loadAnimation('s01_p062_bg_'),
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
  [63] = {
    bg = RM:loadAnimation('s01_p063_bg_'),
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
  [64] = {
    bg = RM:loadAnimation('s01_p064_bg_'),
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
  [65] = {
    bg = RM:loadAnimation('s01_p065_bg_'),
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
  [66] = {
    bg = RM:loadAnimation('s01_p066_bg_'),
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