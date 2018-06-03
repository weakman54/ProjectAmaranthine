
local RM = require 'resourceManager.resourceManager'
RM.prefix = 'assets/VN/scene01_0_endAndZeroArgue/'


local White = RM:loadAnimation("white")
local Black = RM:loadAnimation("black")

local ElevatorBackground = RM:loadAnimation('Elevator_room_')
local ElevatorBackgroundBlur = RM:loadAnimation('Elevator_room_blur_')

local QuitRoomBackground = RM:loadAnimation('quit_quarters_')
local QuitRoomBackgroundBlur = RM:loadAnimation('quit_quarters_blur_')

local FlashbackBG = RM:loadAnimation('FlashbackBG_')

local InputBox = RM:loadAnimation('Input_Box_')


local boxDarken = 0.1
local boxAlpha = 0.8

return {
  [1] = {
    bg = {
      anim = Black,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          InputBox = InputBox, TextBox = RM:loadAnimation('s01_0_p001_m01_TextBox_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",



        },
        drawData = {
          [1] = {
            anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [2] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
          },
        },
      },
      [2] = {
        sounds = {
        },
        anims = {
          InputBox = InputBox, TextBox = RM:loadAnimation('s01_0_p001_m02_TextBox_'),
        },
        transitionTrigger = {
       [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [2] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
          },
        },
      },
       [3] = {
        sounds = {
        },
        anims = {
          InputBox = InputBox, TextBox = RM:loadAnimation('s01_0_p001_m03_TextBox_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [2] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
          },
        },
      },
       [4] = {
        sounds = {
        },
        anims = {
          InputBox = InputBox, TextBox = RM:loadAnimation('s01_0_p001_m04_TextBox_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [2] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
          },
        },
      },
       [5] = {
        sounds = {
        },
        anims = {
          InputBox = InputBox, TextBox = RM:loadAnimation('s01_0_p001_m05_TextBox_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [2] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
          },
        },
      },
       [6] = {
        sounds = {
        },
        anims = {
          InputBox = InputBox, TextBox = RM:loadAnimation('s01_0_p001_m06_TextBox_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [2] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
          },
        },
      },
      [7] = {
        sounds = {
        },
        anims = {
          InputBox = InputBox, TextBox = RM:loadAnimation('s01_0_p001_m07_TextBox_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [2] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
          },
        },
      },
      [8] = {
        sounds = {
			{"Magic Key"},
        },
        anims = {
          ZeroHand = RM:loadAnimation('s01_0_p001_m08_ZeroHand_'),
          ZeroHand2 = RM:loadAnimation('s01_0_p001_m09_ZeroHand_'),
        },
        transitionTrigger = {
          [1] = "timer", [2] = 1.0,
        },
        drawData = {
          [1] = {
            anim = "ZeroHand",
          },
          [2] = {
            anim = "ZeroHand2",
            alpha = 0, tween = {1.0, {alpha = 1 }, "in-linear"},
            
          },
        },
      },
       [9] = {
        sounds = {
        },
        anims = {
          ZeroHand = RM:loadAnimation('s01_0_p001_m09_ZeroHand_'),
          ZeroHand2 = RM:loadAnimation('s01_0_p001_m10_ZeroHand_'),
        },
        transitionTrigger = {
          [1] = "timer", [2] = 1.0,
        },
        drawData = {
          [1] = {
            anim = "ZeroHand",
          },
          [2] = {
            anim = "ZeroHand2",
            alpha = 0, tween = {1.0, {alpha = 1 }, "in-linear"},
            
          },
        },
      },
     [10] = {
        sounds = {
        },
        anims = {
          ZeroHand = RM:loadAnimation('s01_0_p001_m10_ZeroHand_'),
          ZeroHand2 = RM:loadAnimation('s01_0_p001_m11_ZeroHand_'),
        },
        transitionTrigger = {
          [1] = "timer", [2] = 1.4,
        },
        drawData = {
          [1] = {
            anim = "ZeroHand",
          },
            [2] = {
            anim = "ZeroHand2",
            alpha = 0, tween = {1.0, {alpha = 1 }, "in-linear"},
            
          },
        },
      },
      [11] = {
        sounds = {
			{"Switch1", {delay = 1}}
        },
        anims = {
          Door = RM:loadAnimation('s01_0_p001_m12_Door_'),
          Door2 = RM:loadAnimation('s01_0_p001_m13_Door_'),

        },
        transitionTrigger = {
          [1] = "timer", [2] = 1.5,
        },
        drawData = {
          [1] = {
            anim = "Door",
          },
            [2] = {
            anim = "Door2",
            alpha = 0, tween = {1.25, {alpha = 1 }, "in-linear"},
            
          },
        },
      },
      [12] = {
        sounds = {
			{"Open2"},
        },
        anims = {
          Door = RM:loadAnimation('s01_0_p001_m13_Door_'),
          Door2 = RM:loadAnimation('s01_0_p001_m14_Door_'),
		  OpenFX = RM:loadAnimation('s01_0_p001_m14_Effect_'),

        },
        transitionTrigger = {
          [1] = "timer", [2] = 1.6,
        },
        drawData = {
          [1] = {
            anim = "Door",
          },
          [2] = {
            anim = "Door2",
            alpha = 0, tween = {0.3, {alpha = 1 }, "in-linear"},
		  },
		  [3] = {
               anim = "OpenFX",
			   alpha = 1, tween = {1.4, {alpha = 0 }, "out-quint"},
		  },
        },
      },
    },
  },
  [2] = {
    bg = {
      anim = ElevatorBackgroundBlur,
    },
    moments = {
      [1] = {
        sounds = {
			{"Door Open"}
        },
		music = {"End_Ex_Sister"},
        anims = {
          EndZero = RM:loadAnimation('s01_0_p002_m01_EndZero_'),
          YawnFX = RM:loadAnimation('s01_0_p002_m01_YawnFX_'),
          ElevatorRight = RM:loadAnimation('s01_0_p002_m01_ElevatorRight_'),
          ElevatorLeft = RM:loadAnimation('s01_0_p002_m01_ElevatorLeft_'),
        },
        transitionTrigger = {
          [1] = "timer", [2] = 2,
        },
        drawData = {
          [1] = {
            anim = "EndZero",
            x = 2320/2 - 200,
            y = 1480/2 - 200 + 100,
            xScale = .9,
            yScale = .9,
            xOffset = 2320/2,
            yOffset = 1480/2,
            tween = {2, {x = 2320/2 - 200, y = 1480/2 - 200, xScale = 1, yScale = 1}, "in-quad"},
          },
         
          [2] = {
            anim = "YawnFX",
            x = 2320/2 - 200 - 100,
            y = 1480/2 - 200 - 50,
            xScale = .9,
            yScale = .9,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,
            tween = {2, {x = 2320/2 - 200 -200, y = 1480/2 - 200 - 85, xScale = 1.2, yScale = 1.2, alpha = 0}, "in-quad"},
          },
           [3] = {
            anim = "ElevatorLeft",red=boxDarken,green=boxDarken,blue=boxDarken,
            x = 0, y = 0, tween = {2, { x = -500, y = 0 }, "out-quart" },
            
          },
          [4] = {
            anim = "ElevatorRight",red=boxDarken,green=boxDarken,blue=boxDarken,
            x = 0, y = 0, tween = {2, { x = 500, y = 0 }, "out-quart" },
            
          },
        },
      },
    },
  },
  [3] = {
    bg = {
      anim = QuitRoomBackground,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Background = QuitRoomBackground,
          Box = RM:loadAnimation('s01_0_p003_m01_Box_'),
          EndZero = RM:loadAnimation('s01_0_p003_m01_EndZero_'),
                    InputBox = InputBox,
          
        },
        transitionTrigger = {
          [1] = "waitForInput"
        },
        drawData = {
           [1] = {
            anim = "Background",
            x = 2320/2 - 200 - 100,
            y = 1480/2 - 200 ,
            xScale = 1,
            yScale = 1,
            xOffset = 2320/2,
            yOffset = 1480/2,
            tween = {4, {x = 2320/2 - 200-850, y = 1480/2 - 200, xScale = 1, yScale = 1}, "in-out-quad"},
          },
          [2] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
            x = 2320/2 - 200 + 50,
            y = 1480/2 - 200 - 50,
            xScale = .93,
            yScale = .93,
            xOffset = 2320/2,
            yOffset = 1480/2,
            tween = {2, {x = 2320/2 - 200, y = 1480/2 - 200, xScale = 1.1, yScale = 1.1}, "in-linear"},
          },
          [3] = {
            anim = "EndZero",
            x = 2320/2 - 200,
            y = 1480/2 - 200 + 200,
            xScale = 1.1,
            yScale = 1.1,
            xOffset = 2320/2,
            yOffset = 1480/2,
            tween = {1.7, {x = 2320/2 - 200, y = 1480/2 - 200 +60, xScale = .9, yScale = .9}, "out-quad"},
          },        
          [4] = {
            anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
          },
        },
      },
    },
  },
  [4] = {
    bg = {
      anim = QuitRoomBackgroundBlur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s01_0_p004_m01_Box_'),
          QuitPainting = RM:loadAnimation('s01_0_p004_m01_QuitPainting_'),
        },
        transitionTrigger = {
          [1] = "timer", [2] = 3.0,
        },
        drawData = {
          
          [1] = {
            anim = "QuitPainting",
            x = 2320/2 - 200 + 100,
            y = 1480/2 - 200,
            xScale = 1.01,
            yScale = 1.01,
            xOffset = 2320/2,
            yOffset = 1480/2,
            tween = {1.7, {x = 2320/2 - 200-150, y = 1480/2 - 200, xScale = 1, yScale = 1}, "in-out-quad"},
          },
          [2] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
            x = 2320/2 - 200 + 200,
            y = 1480/2 - 200,
            xScale = 1.00,
            yScale = 1.00,
            xOffset = 2320/2,
            yOffset = 1480/2,
            tween = {1.5, {x = 2320/2 - 200, y = 1480/2 - 200, xScale = 1.2, yScale = 1.2}, "in-out-quad"},
          },
        },
      },
    },
  },
  [5] = {
    bg = {
      anim = QuitRoomBackgroundBlur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Trophies = RM:loadAnimation('s01_0_p005_m01_Trophies_'),
          Box = RM:loadAnimation('s01_0_p005_m01_Box_'),
        },
        transitionTrigger = {
          [1] = "timer", [2] = 2.7,
        },
        drawData = {

          [1] = {
            anim = "Trophies",
            x = 2320/2 - 200 - 500,
            y = 1480/2 - 200 - 20,
            xScale = 1.1,
            yScale = 1.1,
            xOffset = 2320/2,
            yOffset = 1480/2,
            tween = {2.25, {x = 2320/2 - 200 + 100, y = 1480/2 - 200, xScale = 1, yScale = 1}, "in-out-quad"},
          },
          [2] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
            x = 2320/2 - 200 - 200,
            y = 1480/2 - 200,
            xScale = 1.00,
            yScale = 1.00,
            xOffset = 2320/2,
            yOffset = 1480/2,
            tween = {2.25, {x = 2320/2 - 200, y = 1480/2 - 200, xScale = 1.12, yScale = 1.12}, "in-out-quad"},
          },
        },
      },
    },
  },
  [6] = {
    bg = {
      anim = QuitRoomBackgroundBlur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          QuitPhoto = RM:loadAnimation('s01_0_p006_m01_QuitPhoto_'),
          Box = RM:loadAnimation('s01_0_p006_m01_Box_'),
        },
        transitionTrigger = {
          [1] = "timer", [2] = 2.4,
        },
        drawData = {

          [1] = {
            anim = "QuitPhoto",
            x = 2320/2 - 200,
            y = 1480/2 - 200 + 100,
            xScale = .9,
            yScale = .9,
            xOffset = 2320/2,
            yOffset = 1480/2,
            tween = {2.25, {x = 2320/2 - 200, y = 1480/2 - 200, xScale = 1, yScale = 1}, "out-quad"},
          },
          [2] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
            x = 2320/2 - 200,
            y = 1480/2 - 200 + 200,
            xScale = 1.0,
            yScale = 1.0,
            xOffset = 2320/2,
            yOffset = 1480/2,
            tween = {2.25, {x = 2320/2 - 200, y = 1480/2 - 200+100, xScale = 1.01, yScale = 1.01}, "in-out-quad"},
          },
        },
      },
    },
  },
  [7] = {
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          EndRollEyes = RM:loadAnimation('s01_0_p007_m01_EndRollEyes_'),
          InputBox = InputBox, TextBox = RM:loadAnimation('s01_0_p007_m01_TextBox_'),
          Box = RM:loadAnimation('s01_0_p007_m01_Box_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
          },
          [2] = {
            anim = "EndRollEyes",
            x = 2320/2 - 200,
            y = 1480/2 - 200,
            xScale = 1.03,
            yScale = 1.03,
            xOffset = 2320/2,
            yOffset = 1480/2,
            tween = {0.9, {x = 2320/2 - 200 + 30, y = 1480/2 - 200, xScale = 1, yScale = 1}, "in-out-quad"},
          },
          [3] = {
            anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [4] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
          },
        },
      },
      [2] = {
        sounds = {
        },
        anims = {
          EndRollEyes = RM:loadAnimation('s01_0_p007_m01_EndRollEyes_'),
          InputBox = InputBox, TextBox = RM:loadAnimation('s01_0_p007_m02_TextBox_'),
          Box = RM:loadAnimation('s01_0_p007_m01_Box_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
          },
          [2] = {
            anim = "EndRollEyes",
			x = 2320/2 - 200 + 30,
            y = 1480/2 - 200,
            xOffset = 2320/2,
            yOffset = 1480/2,
          },
          [3] = {
            anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [4] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
          },
        },
      },
    },
  },
  [8] = {
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s01_0_p008_m01_Box_'),
          Zero = RM:loadAnimation('s01_0_p008_m01_Zero_'),
          Kitty = RM:loadAnimation('s01_0_p008_m01_Kitty_'),
        },
        transitionTrigger = {
          [1] = "timer", [2] = 1.7,
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
          },
          [2] = {
            anim = "Kitty",
            x = 2320/2 - 200,
            y = 1480/2 - 200,
            xScale = 1,
            yScale = 1,
            xOffset = 2320/2,
            yOffset = 1480/2,
            tween = {1.7, {x = 2320/2 - 200 + 30, y = 1480/2 - 200, xScale = 1, yScale = 1}, "in-out-quad"},
          },
          [3] = {
            anim = "Zero",
                        x = 2320/2 - 200 + 100,
            y = 1480/2 - 200,
            xScale = 1.43,
            yScale = 1.43,
            xOffset = 2320/2,
            yOffset = 1480/2,
            tween = {1.7, {x = 2320/2 - 200 + 30, y = 1480/2 - 200, xScale = 1, yScale = 1}, "in-out-quad"},
          },
        },
      },
      [2] = {
        sounds = {
        },
        anims = {
          KittyZoom = RM:loadAnimation('s01_0_p008_m02_KittyZoom_'),
          Box = RM:loadAnimation('s01_0_p008_m02_BoxZoom_'),
        },
        transitionTrigger = {
          [1] = "timer", [2] = 1.4,
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
          },
          [2] = {
            anim = "KittyZoom",
            x = 2320/2 - 200,
            y = 1480/2 - 200,
            xScale = 0.9,
            yScale = 0.9,
            xOffset = 2320/2,
            yOffset = 1480/2,
            tween = {2.1, {x = 2320/2 - 200, y = 1480/2 - 200, xScale = 1.02, yScale = 1.02}, "out-cubic"},
          },
        },
      },
    },
  },
  [9] = {
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s01_0_p009_m01_Box_'),
          Zero = RM:loadAnimation('s01_0_p009_m01_Zero_'),
          InputBox = InputBox, TextBox = RM:loadAnimation('s01_0_p009_m01_Text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
          },
          [2] = {
            anim = "Zero",
			x = 0 - 200,
            y = 0,
            tween = {0.3, {x = 0, y = 0,}, "in-linear"},
          },
          [3] = {
            anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [4] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
          },
        },
      },
    },
  },
  [10] = {
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          ZeroKitty = RM:loadAnimation('s01_0_p010_m01_ZeroKitty_'),
          Box = RM:loadAnimation('s01_0_p010_m01_Box_'),
          End = RM:loadAnimation('s01_0_p010_m01_End_'),
          InputBox = InputBox, TextBox = RM:loadAnimation('s01_0_p010_m01_Text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
            x = 2320/2 - 200,
            y = 1480/2 - 200,
            xScale = 1.0,
            yScale = 1.0,
            xOffset = 2320/2,
            yOffset = 1480/2,
            tween = {1.7, {x = 2320/2 - 200 - 20, y = 1480/2 - 200 + 25, xScale = 1.0, yScale = 1.0}, "in-out-quad"},
          },
      
          [2] = {
            anim = "ZeroKitty",
                      x = 2320/2 - 200,
            y = 1480/2 - 200,
            xScale = 1.05,
            yScale = 1.05,
            xOffset = 2320/2,
            yOffset = 1480/2,
            tween = {1.7, {x = 2320/2 - 200 - 40, y = 1480/2 - 200 + 50, xScale = 1.0, yScale = 1.0}, "in-out-quad"},
          },
          [3] = {
            anim = "End",
            x = 2320/2 - 200,
            y = 1480/2 - 200,
            xScale = 1.00,
            yScale = 1.00,
            xOffset = 2320/2,
            yOffset = 1480/2,
            tween = {1.5, {x = 2320/2 - 200 + 100, y = 1480/2 - 200, xScale = 1.03, yScale = 1.03}, "in-out-quad"},
          },
          [4] = {
            anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [5] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
          },
        },
      },
    },
  },
  [11] = {
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s01_0_p011_m01_Box_'),
          End = RM:loadAnimation('s01_0_p011_m01_End_'),
          InputBox = InputBox, TextBox = RM:loadAnimation('s01_0_p011_m01_Text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
            x = 2320/2 - 200,
            y = 1480/2 - 200,
            xScale = 1,
            yScale = 1,
            xOffset = 2320/2,
            yOffset = 1480/2,
            tween = {1.5, {x = 2320/2 - 200, y = 1480/2 - 200, xScale = 1.02, yScale = 1.02}, "in-out-cubic"},
          },
          [2] = {
            anim = "End",
            x = 2320/2 - 200 ,
            y = 1480/2 - 200,
            xScale = 1.07,
            yScale = 1.07,
            xOffset = 2320/2,
            yOffset = 1480/2,
            tween = {3.0, {x = 2320/2 - 200, y = 1480/2 - 200, xScale = 1, yScale = 1}, "out-cubic"},
          },
          [3] = {
            anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [4] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},

          },
        },
      },
    },
  },
  [12] = {
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = {
        sounds = {
        },
		music = {"End_Ex_Sister", {fade = {duration = 4, rate = -1/4}}},
        anims = {
          Zero = RM:loadAnimation('s01_0_p012_m01_Zero_'),
          Box = RM:loadAnimation('s01_0_p012_m01_Box_'),
        },
        transitionTrigger = {
          [1] = "timer", [2] = 2.2,
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
          },
          [2] = {
            anim = "Zero",
			x = 0- 100,
            y = 0,
            tween = {4.0, {x = 0 + 200, y = 0}, "in-out-linear"},
          },
        },
      },
    },
  },
  [13] = {
    bg = {
      anim = QuitRoomBackgroundBlur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Kitty = RM:loadAnimation('s01_0_p008_m02_KittyZoom_'), -- NOTE: earlier sprite here
          Box = RM:loadAnimation('s01_0_p013_m01_Box_'),
        },
        transitionTrigger = {
          [1] = "timer", [2] = 2.2,
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
          },
          [2] = {
            anim = "Kitty",
			x = 0 + 100,
            y = 0,
            tween = {4.0, {x = 0 - 200, y = 0}, "in-out-linear"},
          },
        },
      },
      [2] = {
        sounds = {
			{"Quick Flash Back Scene 1", {delay = 2}}
        },
        anims = {
          KittyEye = RM:loadAnimation('s01_0_p013_m02_KittyEye_'),
          Box = RM:loadAnimation('s01_0_p013_m01_Box_'),
          White = White,
          
        },
        transitionTrigger = {
          [1] = "timer", [2] = 3.0,
        },
        drawData = {
          [1] = {
            anim = "KittyEye",
			x = 2320/2 - 200 ,
            y = 1480/2 - 200,
            xScale = 1.0,
            yScale = 1.0,
            xOffset = 2320/2,
            yOffset = 1480/2,
			tween = {3.0, {xScale = 1.2, yScale = 1.2}, "in-linear"},
          },
         [2] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
          },
                [3] = {
            anim = "White",
            alpha = 0, tween = {3.0, {alpha = .8}, "in-expo"},
          },
        },
      },
    },
  },
  [14] = {
    bg = {
      anim = FlashbackBG,
    },
    moments = {
      [1] = {
        sounds = {
			{"Stare"},
        },
		music = {"stop"},
        anims = {
          SoldierEye = RM:loadAnimation('s01_0_p014_m01_SoldierEye_'),
          Box = RM:loadAnimation('s01_0_p014_m01_Box_'),
        },
        transitionTrigger = {
          [1] = "timer", [2] = 3.5,
        },
        drawData = {
          [2] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
          },
          [1] = {
            anim = "SoldierEye",
			x = 2320/2 - 200 ,
            y = 1480/2 - 200,
            xScale = 1.2,
            yScale = 1.2,
            xOffset = 2320/2,
            yOffset = 1480/2,
			tween = {3.5, {xScale = 1.0, yScale = 1.0}, "in-linear"},
          },
        },
      },
      [2] = {
        sounds = {
        },
        anims = {
          SoldierZoomout = RM:loadAnimation('s01_0_p014_m02_SoldierZoomout_'),
   --       Box = RM:loadAnimation('s01_0_p014_m02_Box_'),
        },
        transitionTrigger = {
          [1] = "timer", [2] = 5.2,
        },
        drawData = {
     --     [1] = {
     --       anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
     --     },
          [1] = {
            anim = "SoldierZoomout",
			x = 2320/2 - 200 ,
            y = 1480/2 - 200,
            xScale = 2.0,
            yScale = 2.0,
            xOffset = 2320/2,
            yOffset = 1480/2,
			tween = {5.2, {xScale = 1.0, yScale = 1.0}, "in-linear"},
          },
        },
    },
  },
  },
  [15] = {
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = {
        sounds = {
			{"Kick Echo"},
        },
        anims = {
          EndKicking = RM:loadAnimation('s01_0_p015_m01_EndKicking_'),
          ZeroScared = RM:loadAnimation('s01_0_p015_m01_ZeroScared_'),
          Box = RM:loadAnimation('s01_0_p015_m01_Box_'),
          Effect = RM:loadAnimation('s01_0_p019_m01_Effect_'),
          Kitty = RM:loadAnimation('s01_0_p015_m01_Kitty_'),
        },
        transitionTrigger = {
          [1] = "timer", [2] = 1.9,
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
          },
          [2] = {
            anim = "Effect",
			red=0, green=0, blue=0,
		  },
		  [3] = {
            anim = "Kitty",
			x = 0 + 200,
            y = 0,
			tween = {0.5, {x = 0 - 50, y = 0}, "out-quad"},
          },
          [4] = {
            anim = "EndKicking",
			x = 0 + 200,
            y = 0,
			tween = {0.3, {x = 0, y = 0}, "out-quad"},
          },
          [5] = {
            anim = "ZeroScared",
			x = 0,
            y = 0 + 200,
			tween = {0.5, {x = 0, y = 0}, "in-out-bounce"},
          },
         
        },
      },
    },
  },
  [16] = {
    bg = {
      anim = FlashbackBG,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Zero = RM:loadAnimation('s01_0_p016_m01_Zero_'),
          --Box = RM:loadAnimation('s01_0_p016_m01_Box_'),
          End = RM:loadAnimation('s01_0_p017_m02_End_'), -- NOTE: other asset
		  Kitty = RM:loadAnimation('s01_0_p016_m02_Kitty_'),
          InputBox = InputBox, TextBox = RM:loadAnimation('s01_0_p016_m01_Text_'),
		  RealityBG = RM:loadAnimation('quit_quarters_blur_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
			[1] = {
			  anim = "RealityBG",
			  },
			--[1] = {
--            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
--          },
          [2] = {
            anim = "End",
			x = 0 + 80,
			y = 0 - 2045 - 20,
			tween = {1.4, {x = 0, y = -2045}, "in-out-quad"},
          },
		  [3] = {
		   anim = "Kitty",
		   x = 0 + 100,
		   y = 0 - 2045 - 30,
		   tween = {1.4, {x = 0, y = -2045}, "in-out-quad"},
		  },
          [4] = {
            anim = "Zero",
			x = 0 - 200,
			y = 0 - 2045 + 50,
			tween = {1.5, {x = 0, y = -2045}, "in-out-quad"},
           },
          [5] = {
            anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [6] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
          },
        },
      },
      [2] = { 
        sounds = {
			{"Flash Back Scene 1", {delay = 0.1}},
        },
        anims = {
		  Zero = RM:loadAnimation('s01_0_p016_m01_Zero_'),
		  End = RM:loadAnimation('s01_0_p017_m02_End_'), 
          Kitty = RM:loadAnimation('s01_0_p016_m02_Kitty_'),
          InputBox = InputBox, TextBox = RM:loadAnimation('s01_0_p016_m01_Text_'),
		  RealityBG = RM:loadAnimation('quit_quarters_blur_'),          
          --Box = RM:loadAnimation('s01_0_p016_m02_Box_'),
		  White = White,

        },
        transitionTrigger = {
          [1] = "timer", [2] = 1.5,
        },
        drawData = {
--          [1] = {
--            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
--          },
		  [1] = {
		    anim = "RealityBG",
			
		    },
          [2] = {
            anim = "End",
			x = 0,
			y = 0 - 2045,
			--alpha = 1
			--tween = {3.0, {x = 0, y = -2045 - }, "in-quad"},
          },
		  [3] = {
		   anim = "Kitty",
		   x = 0,
		   y = 0 - 2045,
		   --alpha = 1
		   --tween = {1.4, {x = 0, y = -2045}, "in-out-quad"},
		  },
          [4] = {
            anim = "Zero",
			x = 0,
			y = 0 - 2045,
			--tween = {1.5, {x = 0, y = -2045}, "in-out-quad"},
           },
          [5] = {
            anim = "TextBox",
			},
		  [6] = {
		    anim = "White",
            alpha = 0, tween = {1.2, {alpha = 1}, "in-linear"},
			},
		},
	},		
[3] = { 
        sounds = {
        },
        anims = {
          ZeroFlash = RM:loadAnimation('s01_0_p016_m02_Zero_'),
		  EndFlash = RM:loadAnimation('s01_0_p017_m02_EndFlashback_'), -- NOTE: other asset
		  Soldier = RM:loadAnimation('s01_0_p016_m02_Soldier_'), 
        },
        transitionTrigger = {
          [1] = "timer", [2] = 5.0,
        },
        drawData = {	
			[1] = {
			anim = "EndFlash",
			x = 0,
			y = 0 - 2045,
			tween = {5.0, {x = 0, y = 0}, "in-out-quart" }, 
          },
		  [2] = {
			anim = "Soldier",
			x = 0,
			y = 0 - 2045,
			tween = {5.0, {x = 0, y = 0 + 0}, "in-out-quart" }, 
          },		  
		  [3] =  {
			anim = "ZeroFlash",
			x = 0,
			y = 0 - 2045,
			tween = {5.0, {x = 0, y = 0}, "in-out-quart" }, 
		  },
        },
      },
	 },
    },
  [17] = {
    bg = {
      anim = FlashbackBG,
    },
    moments = {
      [1] = {
        sounds = {
			{"Calm before the Storm", {delay = 0.1}}
        },
        anims = {
          End = RM:loadAnimation('s01_0_p017_m02_EndFlashback_'),
        },
        transitionTrigger = {
          [1] = "timer", [2] = 1.0,
        },
        drawData = {
--          [1] = {
--            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
--          },
          [1] = {
            anim = "End",
			x = 2320/2 - 200 ,
            y = 1480/2 - 200,
            xScale = 1.0,
            yScale = 1.0,
            xOffset = 2320/2,
            yOffset = 1480/2,
			tween = {1.0, {x = 2320/2 - 200 - 50, y = 1480/2 - 200, xScale = 1.2, yScale = 1.2}, "in-expo" },	
          },
        },
      },
      [2] = {
        sounds = {
			{"Intense Moment"},
			{"Jumpscare"}
        },
        anims = {
          EndFlash = RM:loadAnimation('s01_0_p018_m01_EndFlashback_'),
		  End = RM:loadAnimation('s01_0_p018_m01_End_'),
		  RealityBG = RM:loadAnimation('quit_quarters_blur_'),
		  Effect = RM:loadAnimation('s01_0_p019_m01_Effect_'),
          },
        transitionTrigger = {
          [1] = "timer", [2] = 3.5,
        },
        drawData = {
--          [1] = {
--            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
--          },
          [1] = {
			anim = "RealityBG",
			alpha = 0,
			tween = {3.0, {alpha = 1}, "in-expo" },
			},
		  [2] = {
			anim = "End",
			x = 0,
			y = 15,
			alpha = 0,
			tween = {3.0, {alpha = 1}, "in-expo" },
			},
		  [3] = {
            anim = "EndFlash",
			alpha = 1,
			tween = {3.0, {alpha = 0}, "in-expo" },
			},
		  [4] = {
			anim = "Effect",
			red=0, green=0, blue=0, alpha = 0.5,
			tween = {3.0, {alpha = 0}, "in-expo" },
		  },
          },
        },
      },
    },
  [18] = {
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = {
        sounds = {
			{"Earth2"},
        },
        anims = {
          Box = RM:loadAnimation('s01_0_p014_m01_Box_'),
          Effect = RM:loadAnimation('s01_0_p019_m01_Effect_'),
          Zero = RM:loadAnimation('s01_0_p019_m01_Zero_'),
        },
        transitionTrigger = {
          [1] = "timer", [2] = 1.8,
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
          },
          [2] = {
            anim = "Zero",
            x = 2320/2 - 200 ,
            y = 1480/2 - 200 + 200,
            xScale = 1.07,
            yScale = 1.07,
            xOffset = 2320/2,
            yOffset = 1480/2,
            tween = {1.1, {x = 2320/2 - 200, y = 1480/2 - 200, xScale = 1, yScale = 1}, "out-quart"},
          },
          [3] = {
            anim = "Effect",
          },
        },
      },
    },
  },
  [19] = {
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = {  
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s01_0_p020_m01_Box_'),
          InputBox = InputBox, TextBox = RM:loadAnimation('s01_0_p020_m01_Text_'),
          EndZero = RM:loadAnimation('s01_0_p020_m01_EndZero_'),
        },
        transitionTrigger = {
          [1] = "waitForInput"
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
          },
          [2] = {
            anim = "EndZero",
            x = 2320/2 - 200 ,
            y = 1480/2 - 200 + 200,
            xScale = 1.07,
            yScale = 1.07,
            xOffset = 2320/2,
            yOffset = 1480/2,
            tween = {1.0, {x = 2320/2 - 200, y = 1480/2 - 200, xScale = 1, yScale = 1}, "in-out-quad"},
          },
          [3] = {
             anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [4] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},

          },
        },
      },
    },
  },
  [20] = {
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = { 	
        sounds = {
        },
        anims = {
          PullFX = RM:loadAnimation('s01_0_p021_m01_PullFX_'),
          TurnFX = RM:loadAnimation('s01_0_p021_m01_TurnFX_'),
          Box = RM:loadAnimation('s01_0_p021_m01_Box_'),
          EndPullingZero = RM:loadAnimation('s01_0_p021_m01_EndPullingZero_'),
          InputBox = InputBox, TextBox = RM:loadAnimation('s01_0_p021_m01_Text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
          },
          [2] = {
            anim = "EndPullingZero", 
			x = 0 - 200,
			y = 0,
			tween = {0.5, {x = 0}, "out-quad" },
          },
          [3] = {
            anim = "PullFX",
			alpha = 1,
			tween = {1.0, {alpha = 0}, "in-linear" },
          },
          [4] = {
            anim = "TurnFX",
			alpha = 1,
			tween = {0.5, {alpha = 0}, "in-linear" },
          },
          [5] = {
            anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [6] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
          },
        },
      },
    },
  },
  [21] = {
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s01_0_p022_m01_Box_'),
          ZeroAngry = RM:loadAnimation('s01_0_p022_m01_ZeroAngry_'),
          InputBox = InputBox, TextBox = RM:loadAnimation('s01_0_p022_m01_Text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
          },
          [2] = {
            anim = "ZeroAngry",
          },
          [3] = {
            anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [4] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
          },
        },
      },
    },
  },
  [22] = {
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation('s01_0_p023_m01_End_'),
          Box = RM:loadAnimation('s01_0_p023_m01_Box_'),
        },
        transitionTrigger = {
          [1] = "timer", [2] = 1.8,
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
          },
          [2] = {
            anim = "End",
            x = 2320/2 - 200 - 100,
            y = 1480/2 - 200+ 20,
            xScale = 1.03,
            yScale = 1.03,
            xOffset = 2320/2,
            yOffset = 1480/2,
            tween = {1.8, {x = 2320/2 - 200, y = 1480/2 - 200, xScale = 1, yScale = 1}, "in-quad"},
          },
        },
      },
    },
  },
  [23] = {
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          ZeroCrying = RM:loadAnimation('s01_0_p024_m01_ZeroCrying_'),
          Box = RM:loadAnimation('s01_0_p024_m01_Box_'),
          InputBox = InputBox, TextBox = RM:loadAnimation("s01_0_p024_m01_Text_"),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
          },
          [2] = {
            anim = "ZeroCrying",
            x = 2320/2 - 200 - 100,
            y = 1480/2 - 200+ 20,
            xScale = 1.03,
            yScale = 1.03,
            xOffset = 2320/2,
            yOffset = 1480/2,
            tween = {1, {x = 2320/2 - 200, y = 1480/2 - 200, xScale = 1, yScale = 1}, "out-quad"},
          },
          [3] = {
            anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [4] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
          },
        },
      },
    },
  },
  [24] = {
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = {
        sounds = {
			{"Slash2"},
			{"Absorb1"},
        },
        anims = {
          ZeroBiteFX = RM:loadAnimation('s01_0_p025_m01_ZeroBiteFX_'),
          ZeroBiting = RM:loadAnimation('s01_0_p025_m01_ZeroBiting_'),
          Box = RM:loadAnimation('s01_0_p025_m01_Box_'),
        },
        transitionTrigger = {
          [1] = "timer", [2] = 1.0,
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
          },
          [2] = {
            anim = "ZeroBiting",
			x = 0,
			y = 0,
			shake = {0.5, {"x", "y",}, 80, 100, -100/0.5}, 
          },
          [3] = {
            anim = "ZeroBiteFX",
			x = 0,
			y = 0,
			shake = {0.5, {"x", "y",}, 80, 100, -100/0.5}, 
          },
        },
      },
    },
  },
  [25] = {
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = {
        sounds = {
        },
		music = {"Conflict Theme Placeholder"},
        anims = {
          ZeroPullingAway = RM:loadAnimation('s01_0_p026_m01_ZeroPullingAway_'),
          EndPullingAway = RM:loadAnimation('s01_0_p026_m01_EndPullingAway_'),
          Box = RM:loadAnimation('s01_0_p026_m01_Box_'),
          PullFX = RM:loadAnimation('s01_0_p026_m01_PullFX_'),
          InputBox = InputBox, TextBox = RM:loadAnimation('s01_0_p026_m01_Text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
          },
          [2] = {
            anim = "ZeroPullingAway",
                        x = 2320/2 - 200 + 100,
            y = 1480/2 - 200,
            xScale = 1.03,
            yScale = 1.03,
            xOffset = 2320/2,
            yOffset = 1480/2,
            tween = {1.0, {x = 2320/2 - 200 + 30, y = 1480/2 - 200, xScale = 1, yScale = 1}, "in-out-quad"},
          },
          [3] = {
            anim = "EndPullingAway",
            x = 2320/2 - 200 - 100,
            y = 1480/2 - 200,
            xScale = 1.0,
            yScale = 1.0,
            xOffset = 2320/2,
            yOffset = 1480/2,
            tween = {0.2, {x = 2320/2 - 200 + 30, y = 1480/2 - 200, xScale = 1.05, yScale = 1.05}, "in-out-quad"},
          },
          [4] = {
            anim = "PullFX",
            alpha = 1,
            tween = {.7, {alpha = 0}, "in-quart"},
          },
          [5] = {
            anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [4] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
          },
        },
      },
    },
  },
  [26] = {
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s01_0_p027_m01_Box_'),
          ZeroShouting = RM:loadAnimation('s01_0_p027_m01_ZeroShouting_'),
          InputBox = InputBox, TextBox = RM:loadAnimation('s01_0_p027_m01_Text_'),
          Effect = RM:loadAnimation('s01_0_p027_m01_Effect_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
          },
          [2] = {
            anim = "ZeroShouting",
            x = 2320/2 - 200,
            y = 1480/2 - 200 + 100,
            xScale = .7,
            yScale = .7,
            xOffset = 2320/2,
            yOffset = 1480/2,
            tween = {0.1, {x = 2320/2 - 200, y = 1480/2 - 200, xScale = 1, yScale = 1}, "in-linear"},
          },
          [3] = {
            anim = "Effect",
          },
          [4] = {
            anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [5] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
          },

        },
      },
    },
  },
  [27] = {
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s01_0_p028_m01_Box_'),
          End = RM:loadAnimation('s01_0_p028_m01_End_'),
          InputBox = InputBox, TextBox = RM:loadAnimation('s01_0_p028_m01_Text_'),
		  Text2 = RM:loadAnimation('s01_0_p028_m02_Text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
            x = 2320/2 - 200 - 100,
            y = 1480/2 - 200 + 30,
            xScale = .93,
            yScale = .93,
            xOffset = 2320/2,
            yOffset = 1480/2,
            tween = {1.5, {x = 2320/2 - 200, y = 1480/2 - 200, xScale = 1.0, yScale = 1.0}, "in-out-quad"},
          },
          [2] = {
            anim = "End",
            x = 2320/2 - 200 - 100,
            y = 1480/2 - 200 + 30,
            xScale = .9,
            yScale = .9,
            xOffset = 2320/2,
            yOffset = 1480/2,
            tween = {0.1, {x = 2320/2 - 200 - 30, y = 1480/2 - 200, xScale = 1.0, yScale = 1.0}, "in-out-quad"},
          },
          [3] = {
            anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [4] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
		},
	},
  },
		
		[2] = {
		        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s01_0_p028_m01_Box_'),
          End = RM:loadAnimation('s01_0_p028_m01_End_'),
          InputBox = InputBox, TextBox = RM:loadAnimation('s01_0_p028_m02_Text_'),
		  },
		transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
			x = 2320/2 - 200, 
			y = 1480/2 - 200, 
			 xScale = 1,
            yScale = 1,
            xOffset = 2320/2,
            yOffset = 1480/2,
			},
          [2] = {
            anim = "End",
			x = 2320/2 - 200 - 30, 
			y = 1480/2 - 200,
			xScale = 1,
            yScale = 1,
            xOffset = 2320/2,
            yOffset = 1480/2,	
			tween = {0.1, {x = 2320/2 - 200 - 30, y = 1480/2 - 200, xScale = 1.2, yScale = 1.2}, "in-out-quad"},			
          },
          [3] = {
                        anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [4] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
			},
          },
        },
      },
	 },
  [28] = {
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s01_0_p028_m01_Box_'),
          End = RM:loadAnimation('s01_0_p029_m01_End_'),
          InputBox = InputBox, TextBox = RM:loadAnimation('s01_0_p029_m01_Text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,

          },
          [2] = {
            anim = "End",
            x = 2320/2 - 200 - 100,
            y = 1480/2 - 200 + 30,
            xScale = 1.2,
            yScale = 1.2,
            xOffset = 2320/2,
            yOffset = 1480/2,
			tween = {0.1, {x = 2320/2 - 200 - 30, y = 1480/2 - 200, xScale = 1.5, yScale = 1.5}, "in-out-quad"},	
          },
          [3] = {
            anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [4] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
			},
		},
	},
		[2] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s01_0_p028_m01_Box_'),
          End = RM:loadAnimation('s01_0_p029_m01_End_'),
          InputBox = InputBox, TextBox = RM:loadAnimation('s01_0_p029_m02_Text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,

          },
          [2] = {
            anim = "End",
            x = 2320/2 - 200 - 100,
            y = 1480/2 - 200 + 30,
            xScale = 1.5,
            yScale = 1.5,
            xOffset = 2320/2,
            yOffset = 1480/2,
--			tween = {0.1, {x = 2320/2 - 200 - 70, y = 1480/2 - 200, xScale = 1,7, yScale = 1,7}, "in-out-quad"},	
            shake = {0.5, {"x", "y",}, 80, 100, -100/0.5}, 
		  },
          [3] = {
            anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [4] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
          },
        },
      },
    },
  },
  [29] = {
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s01_0_p028_m01_Box_'),
          
          ZeroCry = RM:loadAnimation('s01_0_p030_m01_ZeroCry_'),
        },
        transitionTrigger = {
          [1] = "timer", [2] = 2.2,
        },
        drawData = {
                    [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,

          },
          [2] = {
            anim = "ZeroCry",
            x = 2320/2 - 200 + 100,
            y = 1480/2 - 200 - 30,
            xScale = 1.1,
            yScale = 1.1,
            xOffset = 2320/2,
            yOffset = 1480/2,
            tween = {1.7, {x = 2320/2 - 200 + 30, y = 1480/2 - 200, xScale = 1.0, yScale = 1.0}, "in-out-quad"},

          },
        },
      },
    },
  },
  [30] = {
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          EndHolding = RM:loadAnimation('s01_0_p031_m01_EndHolding_'),
          Box = RM:loadAnimation('s01_0_p031_m01_Box_'),
          ZeroWalkAway = RM:loadAnimation('s01_0_p031_m01_ZeroWalkAway_'),
          InputBox = InputBox, TextBox = RM:loadAnimation('s01_0_p031_m01_Text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
          },
          [2] = {
            anim = "EndHolding",
            x = 2320/2 - 200 - 10,
            y = 1480/2 - 200 ,
            xScale = 1.01,
            yScale = 1.01,
            xOffset = 2320/2,
            yOffset = 1480/2,
            tween = {1.7, {x = 2320/2 - 200 + 30, y = 1480/2 - 200, xScale = 1.0, yScale = 1.0}, "out-quart"},
          },
          [3] = {
            anim = "ZeroWalkAway",
            x = 2320/2 - 200 + 100,
            y = 1480/2 - 200 ,
            xScale = 1.01,
            yScale = 1.01,
            xOffset = 2320/2,
            yOffset = 1480/2,
            tween = {1.7, {x = 2320/2 - 200 + 30, y = 1480/2 - 200, xScale = 1.0, yScale = 1.0}, "out-quart"},
          },
          [4] = {
            anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [5] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
          },
        },
      },
	  [2] = {
        sounds = {
        },
        anims = {
          EndHolding = RM:loadAnimation('s01_0_p031_m01_EndHolding_'),
          Box = RM:loadAnimation('s01_0_p031_m01_Box_'),
          ZeroWalkAway = RM:loadAnimation('s01_0_p031_m01_ZeroWalkAway_'),
          InputBox = InputBox, TextBox = RM:loadAnimation('s01_0_p031_m02_Text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
          },
          [2] = {
            anim = "EndHolding",
            x = 2320/2 - 200 + 30,
            y = 1480/2 - 200 ,
            xScale = 1.0,
            yScale = 1.0,
            xOffset = 2320/2,
            yOffset = 1480/2,
          },
          [3] = {
            anim = "ZeroWalkAway",
            x = 2320/2 - 200 + 30,
            y = 1480/2 - 200 ,
            xScale = 1.0,
            yScale = 1.0,
            xOffset = 2320/2,
            yOffset = 1480/2,
          },
          [4] = {
                        anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [5] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
            },
         },
       },
    },
  },
  [31] = { 
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s01_0_p032_m01_Box_'),
          End = RM:loadAnimation('s01_0_p032_m01_End_'),
          InputBox = InputBox, TextBox = RM:loadAnimation('s01_0_p032_m01_Text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
            x = 2320/2 - 200 - 10,
            y = 1480/2 - 200 ,
            xScale = .99,
            yScale = .99,
            xOffset = 2320/2,
            yOffset = 1480/2,
            tween = {1.7, {x = 2320/2 - 200 + 30, y = 1480/2 - 200, xScale = 1.0, yScale = 1.0}, "out-quart"},
          },
          [2] = {
            anim = "End",
            x = 2320/2 - 200 - 10,
            y = 1480/2 - 200 ,
            xScale = 1.01,
            yScale = 1.01,
            xOffset = 2320/2,
            yOffset = 1480/2,
            tween = {1.7, {x = 2320/2 - 200 + 30, y = 1480/2 - 200, xScale = 1.0, yScale = 1.0}, "out-quart"},
          },
          [3] = {
                        anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [4] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
          },
        },
      },
      [2] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s01_0_p032_m01_Box_'),
          EndZero = RM:loadAnimation('s01_0_p032_m01_End_'),
          InputBox = InputBox, TextBox = RM:loadAnimation('s01_0_p032_m02_Text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
            x = 2320/2 - 200 + 30,
            y = 1480/2 - 200 ,
            xScale = 1,
            yScale = 1,
            xOffset = 2320/2,
            yOffset = 1480/2,
          },
          [2] = {
            anim = "EndZero",
            x = 2320/2 - 200 +30,
            y = 1480/2 - 200,
            xScale = 1.0,
            yScale = 1.0,
            xOffset = 2320/2,
            yOffset = 1480/2,
          },
          [3] = {
                        anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [4] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},

          },
        },
      },
    },
  },
  [32] = {
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          ZeroShouting = RM:loadAnimation('s01_0_p027_m01_ZeroShouting_'), -- NOTE:other asset
          Box = RM:loadAnimation('s01_0_p033_m01_Box_'),
          InputBox = InputBox, TextBox = RM:loadAnimation('s01_0_p033_m01_Text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
          },
          [2] = {
            anim = "ZeroShouting",
            x = 2320/2 - 200,
            y = 1480/2 - 200,
            xScale = 1.05,
            yScale = 1.05,
            xOffset = 2320/2,
            yOffset = 1480/2,
            tween = {1.7, {x = 2320/2 - 200, y = 1480/2 - 200, xScale = 1.0, yScale = 1.0}, "out-quart"},
          },
          [3] = {
            anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [4] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},

          },
        },
      },
      [2] = { -- ADD sprite shake to kick
        sounds = {
			{"Kick Echo"},
        },
        anims = {
          EndKicked = RM:loadAnimation('s01_0_p033_m01_EndKicked_'),
          Box = RM:loadAnimation('s01_0_p033_m01_Box_'),
          ZeroKicking = RM:loadAnimation('s01_0_p033_m01_ZeroKicking_'),
		  Effect = RM:loadAnimation('s01_0_p027_m01_Effect_'),
        },
        transitionTrigger = {
          [1] = "timer", [2] = 1.0,
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
          },
          [2] = {
            anim = "ZeroKicking",
          },
		  [3] = {
		    anim = "Effect"
		  },
          [4] = {
            anim = "EndKicked",
          },
        },
      },
    },
  },
  [33] = {
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          InputBox = InputBox, TextBox = RM:loadAnimation('s01_0_p034_m01_Text_'),
          Box = RM:loadAnimation('s01_0_p034_m01_Box_'),
          ZeroRunning = RM:loadAnimation('s01_0_p034_m01_ZeroRunning_'),
          EndSurprised = RM:loadAnimation('s01_0_p034_m01_EndSurprised_'),
        },
        transitionTrigger = {
          [1] = "timer", [2] = 1.7,
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
          },
          [2] = {
            anim = "EndSurprised",
          },
          [3] = {
            anim = "ZeroRunning",
			x = 2320/2 - 200 + 800,
            y = 1480/2 - 200 + 500,
            xScale = 1.5,
            yScale = 1.5,
            xOffset = 2320/2,
            yOffset = 1480/2,
            tween = {1.7, {x = 2320/2 - 200 - 50, y = 1480/2 - 200 -50, xScale = 1.0, yScale = 1.0}, "out-quart"},
          },
          [4] = {
            anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [5] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
          },
        },
      },
    },
  },
  [34] = {
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          EndShouting = RM:loadAnimation('s01_0_p035_m01_EndShouting_'),
          Box = RM:loadAnimation('s01_0_p035_m01_Box_'),
          InputBox = InputBox, TextBox = RM:loadAnimation('s01_0_p035_m01_Text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
            x = 2320/2 - 200,
            y = 1480/2 - 200,
            xScale = 1.2,
            yScale = 1.2,
            xOffset = 2320/2,
            yOffset = 1480/2,
            tween = {1.2, {x = 2320/2 - 200 + 100, y = 1480/2 - 200, xScale = .92, yScale = .92}, "out-quart"},
          },
          [2] = {
            anim = "EndShouting",
            x = 2320/2 - 200,
            y = 1480/2 - 200,
            xScale = 1.1,
            yScale = 1.1,
            xOffset = 2320/2,
            yOffset = 1480/2,
            tween = {1.2, {x = 2320/2 - 200 + 100, y = 1480/2 - 200, xScale = 1.0, yScale = 1.0}, "out-quart"},
          },
          [3] = {
             anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [4] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},

          },
        },
      },
    },
  },
  [35] = {
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation('s01_0_p036_m01_Box_'),
          End = RM:loadAnimation('s01_0_p036_m01_End_'),
          ZeroRunning = RM:loadAnimation('s01_0_p036_m01_ZeroRunning_'),
        },
        transitionTrigger = {
          [1] = "timer", [2] = 2.3,
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
          },
          [2] = {
            anim = "End",
          },
          [3] = {
            anim = "ZeroRunning",
			x = 2320/2 - 200 + 200,
            y = 1480/2 - 200,
            xScale = 0.7,
            yScale = 0.7,
            xOffset = 2320/2,
            yOffset = 1480/2,
            tween = {1.7, {x = 2320/2 - 200, y = 1480/2 - 200, xScale = 1.0, yScale = 1.0}, "out-quart"},
          },
        },
      },
    },
  },
  [36] = {
    bg = {
      anim = QuitRoomBackgroundBlur
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          ZeroRunning = RM:loadAnimation('s01_0_p037_m01_ZeroRunning_'),
          Box = RM:loadAnimation('s01_0_p037_m01_Box_'),
          EndChasing = RM:loadAnimation('s01_0_p037_m01_EndChasing_'),
          InputBox = InputBox, TextBox = RM:loadAnimation('s01_0_p037_m01_Text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
          gotoScene = "02_0",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
          },
          [2] = {
            anim = "EndChasing",
			x = 2320/2 - 200 + 200,
            y = 1480/2 - 200 + 100,
            xScale = 1.1,
            yScale = 1.1,
            xOffset = 2320/2,
            yOffset = 1480/2,
            tween = {1.7, {x = 2320/2 - 200, y = 1480/2 - 200, xScale = 1.0, yScale = 1.0}, "out-quart"},
          },
          [3] = {
            anim = "ZeroRunning",
			x = 2320/2 - 200 + 800,
            y = 1480/2 - 200 + 150,
            xScale = 1.5,
            yScale = 1.5,
            xOffset = 2320/2,
            yOffset = 1480/2,
            tween = {1.7, {x = 2320/2 - 200 - 50, y = 1480/2 - 200 -50, xScale = 1.0, yScale = 1.0}, "out-quart"},
          },
          [4] = {
            anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [5] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
          },
        },
      },
    },
  },
}
