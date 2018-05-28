
local RM = require 'resourceManager.resourceManager'
RM.prefix = 'assets/VN/scene02_0_quitEncounter/'

return {
  [1] = {
    bg = {
      anim = RM:loadAnimation('s02_0_p001_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
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
      anim = RM:loadAnimation('s02_0_p002_bg_'),
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
      anim = RM:loadAnimation('s02_0_p003_bg_'),
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
      anim = RM:loadAnimation('s02_0_p004_bg_'),
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
            anim = "Table",
          },
          [3] = {
            anim = "Zero",
          },
        },
      },
    },
  },
  [5] = {
    bg = {
      anim = RM:loadAnimation('s02_0_p005_bg_'),
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
            anim = "Box",
          },
          [2] = {
            anim = "End",
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
      anim = RM:loadAnimation('s02_0_p006_bg_'),
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
            anim = "End",
          },
          [3] = {
            anim = "Zero",
          },
        },
      },
    },
  },
  [7] = {
    bg = {
      anim = RM:loadAnimation('s02_0_p007_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Zero_Table = RM:loadAnimation('s02_0_p007_m01_Zero_Table_'),
          Table = RM:loadAnimation('s02_0_p007_m01_Table_'),
          Zero = RM:loadAnimation('s02_0_p007_m01_Zero_'),
          Box = RM:loadAnimation('s02_0_p007_m01_Box_'),
          End = RM:loadAnimation('s02_0_p007_m01_End_'),
          End_Zero_Table = RM:loadAnimation('s02_0_p007_m01_End_Zero_Table_'),
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
            anim = "End_Zero_Table",
          },
          [4] = {
            anim = "Table",
          },
          [5] = {
            anim = "Zero",
          },
          [6] = {
            anim = "Zero_Table",
          },
        },
      },
    },
  },
  [8] = {
    bg = {
      anim = RM:loadAnimation('s02_0_p008_bg_'),
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
      anim = RM:loadAnimation('s02_0_p009_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s02_0_p009_m01_Box_'),
          ero = RM:loadAnimation('s02_0_p009_m01Zero_'),
          Table = RM:loadAnimation('s02_0_p009_m01_Table_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "ero",
          },
          [2] = {
            anim = "Box",
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
      anim = RM:loadAnimation('s02_0_p010_bg_'),
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
      anim = RM:loadAnimation('s02_0_p011_bg_'),
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
      anim = RM:loadAnimation('s02_0_p012_bg_'),
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
      anim = RM:loadAnimation('s02_0_p013_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s02_0_p013_m01_Box_'),
          Tiger = RM:loadAnimation('s02_0_p013_m01_Tiger_'),
          Zero = RM:loadAnimation('s02_0_p013_m01_Zero_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "Tiger",
          },
          [3] = {
            anim = "Zero",
          },
        },
      },
    },
  },
  [14] = {
    bg = {
      anim = RM:loadAnimation('s02_0_p014_bg_'),
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
      anim = RM:loadAnimation('s02_0_p015_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s02_0_p015_m01_Box_'),
          Zero = RM:loadAnimation('s02_0_p015_m01_Zero_'),
          Quit = RM:loadAnimation('s02_0_p015_m01_Quit_'),
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
      [2] = {
        sounds = {
        },
        anims = {
          Zero = RM:loadAnimation('s02_0_p015_m02_Zero_'),
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
  [16] = {
    bg = {
      anim = RM:loadAnimation('s02_0_p016_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s02_0_p016_m01_Box_'),
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
  [17] = {
    bg = {
      anim = RM:loadAnimation('s02_0_p017_bg_'),
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
          },
          [2] = {
            anim = "Quit_Zero",
          },
        },
      },
    },
  },
  [18] = {
    bg = {
      anim = RM:loadAnimation('s02_0_p018_bg_'),
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
          },
        },
      },
    },
  },
  [19] = {
    bg = {
      anim = RM:loadAnimation('s02_0_p019_bg_'),
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
          },
        },
      },
    },
  },
  [20] = {
    bg = {
      anim = RM:loadAnimation('s02_0_p020_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s02_0_p020_m01_Box_'),
          End = RM:loadAnimation('s02_0_p020_m01_End_'),
          text = RM:loadAnimation('s02_0_p020_m01_text_'),
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
  [21] = {
    bg = {
      anim = RM:loadAnimation('s02_0_p021_bg_'),
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
          },
          [2] = {
            anim = "End",
          },
        },
      },
    },
  },
  [22] = {
    bg = {
      anim = RM:loadAnimation('s02_0_p022_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s02_0_p022_m01_Box_'),
          End = RM:loadAnimation('s02_0_p022_m01_End_'),
          text = RM:loadAnimation('s02_0_p022_m01_text_'),
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
  [23] = {
    bg = {
      anim = RM:loadAnimation('s02_0_p023_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit_End = RM:loadAnimation('s02_0_p023_m01_Quit_End_'),
          Box = RM:loadAnimation('s02_0_p023_m01_Box_'),
          End = RM:loadAnimation('s02_0_p023_m01_End_'),
          Quit = RM:loadAnimation('s02_0_p023_m01_Quit_'),
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
          [4] = {
            anim = "Quit_End",
          },
        },
      },
    },
  },
  [24] = {
    bg = {
      anim = RM:loadAnimation('s02_0_p024_bg_'),
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
      anim = RM:loadAnimation('s02_0_p025_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Zero = RM:loadAnimation('s02_0_p025_m01_Zero_'),
          Box = RM:loadAnimation('s02_0_p025_m01_Box_'),
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
      anim = RM:loadAnimation('s02_0_p026_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation('s02_0_p026_m01_End_'),
          Box = RM:loadAnimation('s02_0_p026_m01_Box_'),
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
      anim = RM:loadAnimation('s02_0_p027_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation('s02_0_p027_m01_End_'),
          Box = RM:loadAnimation('s02_0_p027_m01_Box_'),
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
      anim = RM:loadAnimation('s02_0_p028_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit_Zero = RM:loadAnimation('s02_0_p028_m01_Quit_Zero_'),
          Box = RM:loadAnimation('s02_0_p028_m01_Box_'),
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
          Text = RM:loadAnimation('s02_0_p028_m02_Text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Text",
          },
        },
      },
      [3] = {
        sounds = {
        },
        anims = {
          Text = RM:loadAnimation('s02_0_p028_m03_Text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Text",
          },
        },
      },
    },
  },
  [29] = {
    bg = {
      anim = RM:loadAnimation('s02_0_p029_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit_Zero = RM:loadAnimation('s02_0_p029_m01_Quit_Zero_'),
          Box = RM:loadAnimation('s02_0_p029_m01_Box_'),
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
      anim = RM:loadAnimation('s02_0_p030_bg_'),
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
          text = RM:loadAnimation('s02_0_p030_m02_text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "text",
          },
        },
      },
      [3] = {
        sounds = {
        },
        anims = {
          text = RM:loadAnimation('s02_0_p030_m03_text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "text",
          },
        },
      },
    },
  },
  [31] = {
    bg = {
      anim = RM:loadAnimation('s02_0_p031_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit_Zero = RM:loadAnimation('s02_0_p031_m01_Quit_Zero_'),
          Box = RM:loadAnimation('s02_0_p031_m01_Box_'),
          End = RM:loadAnimation('s02_0_p031_m01_End_'),
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
      anim = RM:loadAnimation('s02_0_p032_bg_'),
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
      anim = RM:loadAnimation('s02_0_p033_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Zero = RM:loadAnimation('s02_0_p033_m01_Zero_'),
          Box = RM:loadAnimation('s02_0_p033_m01_Box_'),
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
      anim = RM:loadAnimation('s02_0_p034_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit_Zero = RM:loadAnimation('s02_0_p034_m01_Quit_Zero_'),
          Box = RM:loadAnimation('s02_0_p034_m01_Box_'),
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
          text = RM:loadAnimation('s02_0_p034_m02_text_'),
          Quit_Zero = RM:loadAnimation('s02_0_p034_m02_Quit_Zero_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Quit_Zero",
          },
          [2] = {
            anim = "text",
          },
        },
      },
    },
  },
  [35] = {
    bg = {
      anim = RM:loadAnimation('s02_0_p035_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s02_0_p035_m01_Box_'),
          text = RM:loadAnimation('s02_0_p035_m01_text_'),
          Quit = RM:loadAnimation('s02_0_p035_m01_Quit_'),
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
      anim = RM:loadAnimation('s02_0_p036_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation('s02_0_p036_m01_End_'),
          Box = RM:loadAnimation('s02_0_p036_m01_Box_'),
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
      anim = RM:loadAnimation('s02_0_p037_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End_Robot = RM:loadAnimation('s02_0_p037_m01_End_Robot_'),
          Box = RM:loadAnimation('s02_0_p037_m01_Box_'),
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
      anim = RM:loadAnimation('s02_0_p038_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Robot = RM:loadAnimation('s02_0_p038_m01_Robot_'),
          Box = RM:loadAnimation('s02_0_p038_m01_Box_'),
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
      anim = RM:loadAnimation('s02_0_p039_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Robot = RM:loadAnimation('s02_0_p039_m01_Robot_'),
          Box = RM:loadAnimation('s02_0_p039_m01_Box_'),
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
      anim = RM:loadAnimation('s02_0_p040_bg_'),
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
      anim = RM:loadAnimation('s02_0_p041_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s02_0_p041_m01_Box_'),
          text = RM:loadAnimation('s02_0_p041_m01_text_'),
          Quit = RM:loadAnimation('s02_0_p041_m01_Quit_'),
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
      anim = RM:loadAnimation('s02_0_p042_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s02_0_p042_m01_Box_'),
          text = RM:loadAnimation('s02_0_p042_m01_text_'),
          Quit = RM:loadAnimation('s02_0_p042_m01_Quit_'),
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
            anim = "Quit",
          },
          [4] = {
            anim = "Quit",
          },
          [5] = {
            anim = "Quit",
          },
          [6] = {
            anim = "text",
          },
        },
      },
    },
  },
}
