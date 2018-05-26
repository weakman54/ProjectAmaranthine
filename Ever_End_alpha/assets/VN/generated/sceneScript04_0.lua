
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
          Sword = RM:loadAnimation('s04_0_p001_m01_Sword_'),
          End = RM:loadAnimation('s04_0_p001_m01_End_'),
          QuitOnly = RM:loadAnimation('s04_0_p001_m01_QuitOnly_'),
          Box = RM:loadAnimation('s04_0_p001_m01_Box_'),
          Cap = RM:loadAnimation('s04_0_p001_m01_Cap_'),
          Quit = RM:loadAnimation('s04_0_p001_m01_Quit_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "Cap",
          },
          [3] = {
            anim = "End",
          },
          [4] = {
            anim = "QuitOnly",
          },
          [5] = {
            anim = "Quit",
          },
          [6] = {
            anim = "Sword",
          },
          [7] = {
            anim = "Sword",
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
          Box = RM:loadAnimation('s04_0_p002_m01_Box_'),
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
      [2] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation('s04_0_p002_m02_End_'),
          Quit = RM:loadAnimation('s04_0_p002_m02_Quit_'),
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
      [3] = {
        sounds = {
        },
        anims = {
          Quit = RM:loadAnimation('s04_0_p002_m03_Quit_'),
          Gun = RM:loadAnimation('s04_0_p002_m03_Gun_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Gun",
          },
          [2] = {
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
          End_Quit = RM:loadAnimation('s04_0_p003_m01_End_Quit_'),
          Box = RM:loadAnimation('s04_0_p003_m01_Box_'),
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
  [4] = {
    bg = {
      anim = RM:loadAnimation('s04_0_p004_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s04_0_p004_m01_Box_'),
          Zero = RM:loadAnimation('s04_0_p004_m01_Zero_'),
          Text = RM:loadAnimation('s04_0_p004_m01_Text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",
          },
          [2] = {
            anim = "Text",
          },
          [3] = {
            anim = "Text",
          },
          [4] = {
            anim = "Zero",
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
          Box = RM:loadAnimation('s04_0_p005_m01_Box_'),
          Text = RM:loadAnimation('s04_0_p005_m01_Text_'),
          Quit = RM:loadAnimation('s04_0_p005_m01_Quit_'),
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
            anim = "Text",
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
          Box = RM:loadAnimation('s04_0_p006_m01_Box_'),
          Text = RM:loadAnimation('s04_0_p006_m01_Text_'),
          Quit = RM:loadAnimation('s04_0_p006_m01_Quit_'),
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
            anim = "Text",
          },
        },
      },
      [2] = {
        sounds = {
        },
        anims = {
          Text = RM:loadAnimation('s04_0_p006_m02_Text_'),
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
  [7] = {
    bg = {
      anim = RM:loadAnimation('s04_0_p007_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s04_0_p007_m01_Box_'),
          Text = RM:loadAnimation('s04_0_p007_m01_Text_'),
          Quit = RM:loadAnimation('s04_0_p007_m01_Quit_'),
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
            anim = "Text",
          },
        },
      },
      [2] = {
        sounds = {
        },
        anims = {
          Text = RM:loadAnimation('s04_0_p007_m02_Text_'),
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
  [8] = {
    bg = {
      anim = RM:loadAnimation('s04_0_p008_bg_'),
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s04_0_p008_m01_Box_'),
          End = RM:loadAnimation('s04_0_p008_m01_End_'),
          Text = RM:loadAnimation('s04_0_p008_m01_Text_'),
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
            anim = "Text",
          },
        },
      },
      [2] = {
        sounds = {
        },
        anims = {
          ChoiceText = RM:loadAnimation('s04_0_p008_m02_ChoiceText_'),
          Choice = RM:loadAnimation('s04_0_p008_m02_Choice_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "ChoiceText",
          },
          [2] = {
            anim = "ChoiceText",
          },
          [3] = {
            anim = "ChoiceText",
          },
          [4] = {
            anim = "ChoiceText",
          },
          [5] = {
            anim = "ChoiceText",
          },
          [6] = {
            anim = "ChoiceText",
          },
          [7] = {
            anim = "ChoiceText",
          },
          [8] = {
            anim = "Choice",
          },
        },
      },
    },
  },
}