
local RM = require 'resourceManager.resourceManager'
RM.prefix = 'assets/VN/scene04_0_aftermath/'

local background = RM:loadAnimation('Inside_robot_')
local background_blur = RM:loadAnimation('inside_robot_blur_')
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
        anims = {
          Box = RM:loadAnimation('s04_0_p001_m01_Box_'),
          EEnd =RM:loadAnimation('s04_0_p001_m01_End_'),
          Quit = RM:loadAnimation('s04_0_p001_m01_QuitOnly_'),
          Cap = RM:loadAnimation('s04_0_p001_m01_Cap_'),
          Sword = RM:loadAnimation('s04_0_p001_m01_Sword_'),
        },
        transitionTrigger = {
          [1] = "timer",--"waitForInput",
          [2] = 3.0
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken
          },
          [5] = {
            anim = "EEnd",
          },
          [4] = {
            anim = "Quit",
            x = 2320/2 - 200 - 250,
            y = 1480/2 - 200 + 100,
            xScale = 1.1,
            yScale = 1.1,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,

            tween = {5, {
                x = 2320/2 - 200,
                y = 1480/2 - 200,
                xScale = 1,
                yScale = 1,
                alpha = 1,
              }, "out-expo"
            },
          },
          [3] = {
            anim = "Cap",
            x = 2320/2 - 200 - 150,
            y = 1480/2 - 200 + 50,
            xScale = 1.1,
            yScale = 1.1,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,

            tween = {5, {
                x = 2320/2 - 200 + 100,
                y = 1480/2 - 200 + 50,
                xScale = 1,
                yScale = 1,
                alpha = 1,
              }, "out-expo"
            },
          },
          [2] = {
            anim = "Sword",
            x = 2320/2 - 200 - 100,
            y = 1480/2 - 200 + 100,
            xScale = 1.1,
            yScale = 1.1,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,

            tween = {5, {
                x = 2320/2 - 200,
                y = 1480/2 - 200,
                xScale = 1,
                yScale = 1,
                alpha = 1,
              }, "out-expo"
            },
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
          Box = RM:loadAnimation('s04_0_p002_m01_Box_'),
          Quit = RM:loadAnimation('s04_0_p002_m01_Quit_'),
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
      [2] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s04_0_p002_m01_Box_'),
          EEnd =RM:loadAnimation('s04_0_p002_m02_End_'),
          Quit = RM:loadAnimation('s04_0_p002_m02_Quit_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken
          },  
          [2] = {
            anim = "EEnd",
          },
          [3] = {
            anim = "Quit",
          },
        },
      },
      [3] = {
        sounds = {
        },
        music = "Conflict to Resolve Theme (Happy) Intro",
        anims = {
          Box = RM:loadAnimation('s04_0_p002_m01_Box_'),
          EEnd_Quit = RM:loadAnimation('s04_0_p002_m03_End_Quit_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken
          },
          [2] = {
            anim = "EEnd_Quit",
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
          Box = RM:loadAnimation('s04_0_p003_m01_Box_'),
          EEnd_Quit = RM:loadAnimation('s04_0_p003_m01_End_Quit_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken
          },
          [2] = {
            anim = "EEnd_Quit",
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
          Box = RM:loadAnimation('s04_0_p004_m01_Box_'),
          Zero = RM:loadAnimation('s04_0_p004_m01_Zero_'),
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
  [5] = {
    bg = {
      anim = background_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s04_0_p005_m01_Box_'),
          Quit = RM:loadAnimation('s04_0_p005_m01_Quit_'),
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
  [6] = {
    bg = {
      anim = background_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s04_0_p006_m01_Box_'),
          Quit = RM:loadAnimation('s04_0_p006_m01_Quit_'),
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
  [7] = {
    bg = {
      anim = background_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s04_0_p007_m01_Box_'),
          Quit = RM:loadAnimation('s04_0_p007_m01_Quit_'),
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
          Box = RM:loadAnimation('s04_0_p008_m01_Box_'),
          EEnd =RM:loadAnimation('s04_0_p008_m01_End_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken
          },
          [2] = {
            anim = "EEnd",
          },
        },
      },
      [2] = {
        choice = true,
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s04_0_p008_m01_Box_'),
          Choice = RM:loadAnimation('s04_0_p008_m02_Choice_'),
        },
        transitionTrigger = {	
          [1] = "waitForInput",
          gotoScene = "04_0",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken
          },
          [2] = {
            anim = "Choice",
          },
        },
      },
    },
  },
}