
local RM = require "resourceManager.resourceManager"


RM.prefix = "assets/Backgrounds/"

local White = RM:loadAnimation("white")
local Black = RM:loadAnimation("black")


local ElevatorRoom = RM:loadAnimation("Elevator_room_")
local ElevatorRoom_blur = RM:loadAnimation("Elevator_room_blur_")

local QuitRoom = RM:loadAnimation("quit_quarters_")
local QuitRoom_blur = RM:loadAnimation("quit_quarters_blur_")

--local RobotRoom = RM:loadAnimation("robot_room_") -- Not used currently
local RobotRoom_blur = RM:loadAnimation("robot_room_blur_")




RM.prefix = "assets/GUI/"
local InputBox = RM:loadAnimation("Input_Box_")



RM.prefix = "assets/VN/scene02_0_quitEncounter/"


local boxDarken = 0.1
local boxAlpha = 0.8


return {
  [1] = {
    bg = {
      anim = ElevatorRoom_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        music = {
          "Conflict Theme Placeholder",
          {
            startVolume = 1,
          },
        },
        anims = {
          Zero = RM:loadAnimation("s02_0_p001_m01_Zero_"),
          Box = RM:loadAnimation("s02_0_p001_m01_Box_"),
        },
        transitionTrigger = {
          [1] = "timer",--"waitForInput",
          [2] = 1.8,
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
          },
          [2] = {
            anim = "Zero",
            x = 2000, y = 400, tween = {4.5, { x = -2000, y = -400 }, "out-quart" },
          },
        },
      },
    },
  },
  [2] = {
    bg = {
      anim = ElevatorRoom_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Zero = RM:loadAnimation("s02_0_p002_m01_Zero_"),
          Box = RM:loadAnimation("s02_0_p002_m01_Box_"),
        },
        transitionTrigger = {
          [1] = "timer",--"waitForInput",
          [2] = 1.0,
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
          },
          [2] = {
            anim = "Zero",
            x = 1000, y = 0, tween = {1.0, { x = 0, y = 0 }, "in-linear" },

          },

        },
      },
    },
  },
  [3] = {
    bg = {
      anim = ElevatorRoom_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Zero = RM:loadAnimation("s02_0_p003_m01_Zero_"),
          Box = RM:loadAnimation("s02_0_p003_m01_Box_"),
          InputBox = InputBox,
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=.93,red=boxDarken,green=boxDarken,blue=boxDarken,
          },
          [2] = {
            anim = "Zero",
            x = 200, y = 0, tween = {1.0, { x = 0, y = 0 }, "out-quart" },
          },
          [3] = {
            anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
          },
        },
      },
    },
  },
  [4] = {
    bg = {
      anim = ElevatorRoom_blur,
    },
    moments = {
      [1] = {
        sounds = {
          {"Table Slide"}
        },
        anims = {
          Box = RM:loadAnimation("s02_0_p004_m01_Box_"),
          Zero = RM:loadAnimation("s02_0_p004_m01_Zero_"),
          Table = RM:loadAnimation("s02_0_p004_m01_Table_"),
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
            x = 2320/2 - 200 + 200,
            y = 1480/2 - 200 - 100,
            xScale = .94,
            yScale = .94,
            xOffset = 2320/2,
            yOffset = 1480/2,
            tween = {.7, {x = 2320/2 - 200, y = 1480/2 - 200, xScale = 1, yScale = 1}, "out-quad"},
          },
          [3] = {
            anim = "Table",
          },
        },
      },
    },
  },
  [5] = {
    bg = {
      anim = ElevatorRoom_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation("s02_0_p005_m01_Box_"),
          End = RM:loadAnimation("s02_0_p005_m01_End_"),
          Hand = RM:loadAnimation("s02_0_p005_m01_Hand_"),
        },
        transitionTrigger = {
          [1] = "timer", [2] = 1.5, -- [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "End",
            x = -100, y = 0, tween = {1.0, { x = 0, y = 0 }, "out-quart" },
          },
          [2] = {
            anim = "Box",alpha=.95,red=boxDarken,green=boxDarken,blue=boxDarken,
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
      anim = ElevatorRoom_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation("s02_0_p006_m01_Box_"),
          End = RM:loadAnimation("s02_0_p006_m01_End_"),
          Zero = RM:loadAnimation("s02_0_p006_m01_Zero_"),
        },
        transitionTrigger = {
          [1] = "timer", [2] = 1.7, -- [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
          },
          [2] = {
            anim = "Zero",
          },
          [3] = {
            anim = "End",
            x = 2320/2 - 200 + 2000,
            y = 1480/2 - 200,
            xScale = 1,
            yScale = 1,
            xOffset = 2320/2,
            yOffset = 1480/2,
            tween = {.7, {x = 2320/2 - 200 - 2000, y = 1480/2 - 200, xScale = 1, yScale = 1}, "out-linear"},
          },
        },
      },
    },
  },
  [7] = {
    bg = {
      anim = ElevatorRoom_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation("s02_0_p007_m01_Box_"),
          Zero = RM:loadAnimation("s02_0_p007_m01_Zero_"),
          Table = RM:loadAnimation("s02_0_p007_m01_Table_"),
          End = RM:loadAnimation("s02_0_p007_m01_End_"),

        },
        transitionTrigger = {
          [1] = "timer", [2] = 2.7, -- [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
          },
          [2] = {
            anim = "End",
            x = 2320/2 - 200-700, 
            y = 1480/2 - 200,
            xScale = 1,
            yScale = 1,
            xOffset = 2320/2-500, -- 500 is magic number to offset the center of the tiny sprite
            yOffset = 1480/2,
            alpha = 1,
            tween = {2.0, {x = 2320/2 - 200-700, y = 1480/2 - 200, alpha = 0, xScale = .5, yScale = .5}, "out-linear"},
          },
          [3] = {
            anim = "Table",
          },
          [4] = {
            anim = "Zero",
          },
        },
      },
    },
  },
  [8] = {
    bg = {
      anim = ElevatorRoom_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Zero = RM:loadAnimation("s02_0_p008_m01_Zero_"),
          Box = RM:loadAnimation("s02_0_p008_m01_Box_"),
          InputBox = InputBox,
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
          },
          [3] = {
            anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
          },
        },
      },
    },
  },
  [9] = {
    bg = {
      anim = ElevatorRoom_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation("s02_0_p009_m01_Box_"),
          Zero = RM:loadAnimation("s02_0_p009_m01_Zero_"),
          Table = RM:loadAnimation("s02_0_p009_m01_Table_"),
        },
        transitionTrigger = {
          [1] = "timer", [2] = 1.4, -- [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
          },
          [2] = {
            anim = "Zero",
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
      anim = ElevatorRoom_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        music = {"Conflict Theme Placeholder", {fade = {duration = 6, rate = -1/6}}},

        anims = {
          Zero = RM:loadAnimation("s02_0_p010_m01_Zero_"),
          Table = RM:loadAnimation("s02_0_p010_m01_Table_"),

          Box = RM:loadAnimation("s02_0_p010_m01_Box_"),
          Black = Black,

        },
        transitionTrigger = {
          [1] = "timer", [2] = 2.0, -- [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
            x= - 200, 

          },
          [2] = {
            anim = "Zero",
            x= - 200, 
            y = 0 + 80, 
            tween = {1.0, { x = - 200, y = 0 }, "out-quart" },

          },
          [3] = {
            anim = "Table",
            x= - 200, 

          },
          [4] = {
            anim = "Black",
            alpha = 0, tween = {2, {alpha = 1}, "in-linear"},
          }
        },
      },
    },
  },
  [11] = {
    bg = {
      anim = ElevatorRoom,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Zero = RM:loadAnimation("s02_0_p011_m01_Zero_"),
          Box = RM:loadAnimation("s02_0_p011_m01_Box_"),
          Black = Black,

        },
        transitionTrigger = {
          [1] = "timer", [2] = 2.8, -- [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
          },
          [2] = {
            anim = "Zero",
            x = -10,y= 100, tween = {2.8, {x=0,y = 0}, "in-linear"},

          },
          [3] = {
            anim = "Black",
            alpha = 1, tween = {1.5, {alpha = 0}, "in-linear"},
          }
        },
      },
    },
  },
  [12] = {
    bg = {
      anim = QuitRoom,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Background = QuitRoom,
          Zero = RM:loadAnimation("s02_0_p012_m01_Zero_"),
          Box = RM:loadAnimation("s02_0_p012_m01_Box_"),
        },
        transitionTrigger = {
          [1] = "timer",--"waitForInput",
          [2] = 4.0,
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
            x = 2320/2 - 200 +150,
            y = 1480/2 - 200,
            xScale = 1,
            yScale = 1,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,
            tween = {2.2, {x = 2320/2 - 200+ 300, y = 1480/2 - 200+100, xScale = 1.2, yScale = 1.2}, "in-linear"},
          },
          [3] = {
            anim = "Zero",
            x = 2320/2 - 200 + 200,
            y = 1480/2 - 200,
            xScale = 1.2,
            yScale = 1.2,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,
            tween = {2.2, {x = 2320/2 - 200+100, y = 1480/2 - 200, xScale = .8, yScale = .8}, "in-linear"},
          },

        },
      },
    },
  },
  [13] = {
    bg = {
      anim = QuitRoom_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation("s02_0_p013_m01_Box_"),
          Zero = RM:loadAnimation("s02_0_p013_m01_Zero_"),
          Tiger = RM:loadAnimation("s02_0_p013_m01_Tiger_"),
          InputBox = InputBox,
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
            x = 2320/2 - 200 + 30,
            y = 1480/2 - 200 - 10,
            xScale = 1,
            yScale = 1,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,
            tween = {1.3, {x = 2320/2 - 200, y = 1480/2 - 200, xScale = 1, yScale = 1}, "out-quint"},
          },
          [3] = {
            anim = "Tiger",
            x = 2320/2 - 200-20,
            y = 1480/2 - 200,
            xScale = 1,
            yScale = 1,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,
            tween = {.6, {x = 2320/2 - 200 + 10, y = 1480/2 - 200, xScale = 1, yScale = 1}, "out-linear"},
          },
          [4] = {
            anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
          },
        },
      },
    },
  },
  [14] = {
    bg = {
      anim = QuitRoom_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        music = {"stop"},
        anims = {
          Kitty = RM:loadAnimation("s02_0_p014_m01_Kitty_"),
          Box = RM:loadAnimation("s02_0_p014_m01_Box_"),
        },
        transitionTrigger = {
          [1] = "timer", [2] = 2.0, -- [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
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
      anim = QuitRoom_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation("s02_0_p015_m01_Box_"),
          Zero = RM:loadAnimation("s02_0_p015_m01_Zero_"),
          Zero2 = RM:loadAnimation("s02_0_p015_m02_Zero_"),
          Quit = RM:loadAnimation("s02_0_p015_m01_Quit_"),
        },
        transitionTrigger = {
          [1] = "timer", [2] = 2.5, -- [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
            x = 2320/2 - 200 - 200,
            y = 1480/2 - 200,
            xScale = 1.13,
            yScale = 1.13,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,
            tween = {2, {x = 2320/2 - 200 - 800, y = 1480/2 - 200, xScale = 1, yScale = 1}, "in-out-quint"},
          },
          [2] = {
            anim = "Quit",
            x = 2320/2 - 200 + 600,
            y = 1480/2 - 200 - 0,
            xScale = 1.13,
            yScale = 1.13,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,
            tween = {2, {x = 2320/2 - 200 + 100, y = 1480/2 - 200, xScale = 1, yScale = 1}, "in-out-quint"},
          },
          [3] = {
            anim = "Zero",
            x = 2320/2 - 200 - 300,
            y = 1480/2 - 200 + 60,
            xScale = .9,
            yScale = .9,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,
            tween = {2, {x = 2320/2 - 200, y = 1480/2 - 200, xScale = 1, yScale = 1}, "in-out-quart"},
          },
          [4] = {
            -- This shadow makes no sense, we should have blur insted
            anim = "Zero2",
            x = 2320/2 - 200 - 300,
            y = 1480/2 - 200 + 60,
            xScale = .9,
            yScale = .9,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 0,
            tween = {2, {x = 2320/2 - 200, y = 1480/2 - 200, alpha = 1, xScale = 1, yScale = 1}, "in-out-quart"},
          },
        },
      },
    },
  },

-- Panel 16 doesn"t exist, and that is ok.

  [17] = {
    bg = {
      anim = QuitRoom_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Zero = RM:loadAnimation("s02_0_p017_m01_Zero_"),
          Quit = RM:loadAnimation("s02_0_p017_m01_Quit_"),

          Box = RM:loadAnimation("s02_0_p017_m01_Box_"),
        },
        transitionTrigger = {
          [1] = "timer", [2] = 2.85, -- [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
            x = 2320/2 - 200,
            y = 1480/2 - 200 + 30,
            xScale = 1,
            yScale = 1,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,
            tween = {2.8, {x = 2320/2 - 200, y = 1480/2 - 200, xScale = 1, yScale = 1}, "in-out-cubic"},
          },
          [2] = {
            anim = "Zero",
            x = 2320/2 - 200,
            y = 1480/2 - 200 + 70,
            xScale = 1,
            yScale = 1,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,
            tween = {2.8, {x = 2320/2 - 200, y = 1480/2 - 200, xScale = 1, yScale = 1}, "in-out-cubic"},
          },
          [3] = {
            anim = "Quit",
            x = 2320/2 - 200,
            y = 1480/2 - 200 + 300,
            xScale = 1,
            yScale = 1,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,
            tween = {2.8, {x = 2320/2 - 200, y = 1480/2 - 200, xScale = 1, yScale = 1}, "in-out-cubic"},
          },
        },
      },
    },
  },
  [18] = {
    bg = {
      anim = QuitRoom_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit = RM:loadAnimation("s02_0_p018_m01_Quit_"),
          Box = RM:loadAnimation("s02_0_p018_m01_Box_"),
          Black = Black,
        },
        transitionTrigger = {
          [1] = "timer", [2] = 3.3, -- [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
          },
          [2] = {
            anim = "Quit",
            x = 2320/2 - 200,
            y = 1480/2 - 200 + 20,
            xScale = 1,
            yScale = 1,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,
            tween = {1.4, {x = 2320/2 - 200, y = 1480/2 - 200, xScale = 1, yScale = 1}, "in-bounce"},
          },
          [3] = {
            anim = "Black",
            alpha = 0,
            tween = {2.5, {alpha = 1}, "in-cubic"},
          }
        },
      },
    },
  },
  [19] = {
    bg = {
      anim = RobotRoom_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation("s02_0_p019_m01_End_"),
          Box = RM:loadAnimation("s02_0_p019_m01_Box_"),
          Black = Black,

        },
        transitionTrigger = {

          [1] = "timer",--"waitForInput",
          [2] = 1.65,
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
            xScale = .9,
            yScale = .9,
          },
          [2] = {
            anim = "End",
            x = 2320/2 - 200 + 1400,
            y = 1480/2 - 200 - 0,
            xScale = 1,
            yScale = 1,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,
            tween = {1.7, {x = 2320/2 - 200 - 1400, y = 1480/2 - 200, xScale = 1, yScale = 1}, "in-quart"},
          },
          [3] = {
            anim = "Black",
            alpha = 1,
            tween = {.1, {alpha = 0}, "out-expo"},
          }
        },
      },
    },
  },
  [20] = {
    bg = {
      anim = RobotRoom_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation("s02_0_p020_m01_End_"),
          Box = RM:loadAnimation("s02_0_p020_m01_Box_"),
          InputBox = InputBox,
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
            x = 2320/2 - 200 + 1000,
            y = 1480/2 - 200 - 0,
            xScale = 1,
            yScale = 1,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,
            tween = {1.2, {x = 2320/2 - 200 - 50, y = 1480/2 - 200, xScale = 1, yScale = 1}, "out-quart"},
          },
          [3] = {
            anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
          },
        },
      },
    },
  },
  [21] = {
    bg = {
      anim = RobotRoom_blur,
    },
    moments = {
      [1] = {
        sounds = {
          {"Door Walls Closing NEW"}, -- NEEDS FIX JBOB! :-)
        },
        anims = {
          End = RM:loadAnimation("s02_0_p021_m01_End_"),
          Box = RM:loadAnimation("s02_0_p021_m01_Box_"),
          LeftDoor =  RM:loadAnimation("s02_0_p021_m01_LeftDoor_"),
          RightDoor =  RM:loadAnimation("s02_0_p021_m01_RightDoor_"),
        },
        transitionTrigger = {
          [1] = "timer",--"waitForInput",
          [2] = 1.0,
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
            x = 2320/2 - 200,
            y = 1480/2 - 200 - 100,
            xScale = .9,
            yScale = .9,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,
            tween = {1.0, {x = 2320/2 - 200, y = 1480/2 - 200, xScale = 1, yScale = 1}, "out-linear"},
          },
          [2] = {
            anim = "End",
            x = 2320/2 - 200,
            y = 1480/2 - 200 - 50,
            xScale = .9,
            yScale = .9,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,
            tween = {1.0, {x = 2320/2 - 200, y = 1480/2 - 200, xScale = 1, yScale = 1}, "out-linear"},
          },
          [3] = {
            anim = "LeftDoor",
            x = 2320/2 - 200,
            y = 1480/2 - 200 - 500,
            xScale = .9,
            yScale = .9,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,
            tween = {1.0, {x = 2320/2 - 200, y = 1480/2 - 200, xScale = 1, yScale = 1}, "out-linear"},
          },
          [4] = {
            anim = "RightDoor",
            x = 2320/2 - 200,
            y = 1480/2 - 200 - 500,
            xScale = .9,
            yScale = .9,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,
            tween = {1.0, {x = 2320/2 - 200, y = 1480/2 - 200, xScale = 1, yScale = 1}, "out-linear"},
          },
        },
      },
      [2] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation("s02_0_p021_m01_End_"),
          Box = RM:loadAnimation("s02_0_p021_m01_Box_"),
          LeftDoor =  RM:loadAnimation("s02_0_p021_m01_LeftDoor_"),
          RightDoor =  RM:loadAnimation("s02_0_p021_m01_RightDoor_"),
          LeftEffect = RM:loadAnimation("s02_0_p021_m01_LeftEffect_"),
          RightEffect = RM:loadAnimation("s02_0_p021_m01_RightEffect_"),
        },
        transitionTrigger = {
          [1] = "timer",--"waitForInput",
          [2] = 1.8,
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
            x = 2320/2 - 200,
            y = 1480/2 - 200,
            xScale = 1,
            yScale = 1,
            xOffset = 2320/2,
            yOffset = 1480/2,
          },
          [3] = {
            anim = "LeftDoor",
            x = 2320/2 - 200,
            y = 1480/2 - 200,
            xScale = 1,
            yScale = 1,
            xOffset = 2320/2,
            yOffset = 1480/2,
          },
          [4] = {
            anim = "RightDoor",
            x = 2320/2 - 200,
            y = 1480/2 - 200,
            xScale = 1,
            yScale = 1,
            xOffset = 2320/2,
            yOffset = 1480/2,
          },
          [5] = {
            anim = "LeftEffect",
            alpha = 1,
            tween = {2.0, {alpha = 0 }, "out-expo"},
          },
          [6] = {
            anim = "RightEffect",
            alpha = 1,
            tween = {2.0, {alpha = 0 }, "out-expo"},
          },	
        },
      },
    },
  },
  [22] = {
    bg = {
      anim = RobotRoom_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation("s02_0_p022_m01_End_"),
          Box = RM:loadAnimation("s02_0_p022_m01_Box_"),
          InputBox = InputBox, TextBox = RM:loadAnimation("s02_0_p022_m01_text_"),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
            x = 2320/2 - 200,
            y = 1480/2 - 200 - 100,
            xScale = .9,
            yScale = .9,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,
            tween = {10, {x = 2320/2 - 200, y = 1480/2 - 200, xScale = 1, yScale = 1}, "out-linear"},
          },
          [2] = {
            anim = "End",
            x = 2320/2 - 200,
            y = 1480/2 - 200 - 100,
            xScale = 1.2,
            yScale = 1.2,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,
            tween = {1.0, {x = 2320/2 - 200, y = 1480/2 - 200, xScale = 1, yScale = 1}, "out-cubic"},
          },
          [3] = {
            anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [4] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
          },
        },
      },
    },
  },
  [23] = {
    bg = {
      anim = RobotRoom_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        music = {"Quit_Chill_Theme_Full"},
        anims = {
          Box = RM:loadAnimation("s02_0_p023_m01_Box_"),
          Quit = RM:loadAnimation("s02_0_p023_m01_Quit_"),
          End = RM:loadAnimation("s02_0_p023_m01_End_"),
          Screen = RM:loadAnimation("s02_0_p023_m01_screen_"),
        },
        transitionTrigger = {
          [1] = "timer", [2] = 2.6,
        },
        drawData = {
          [1] = {
            anim = "Quit",
            x = 2320/2 - 200 + 700,
            y = 1480/2 - 200 - 37,
            xScale = 1.2,
            yScale = 1.2,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,
            tween = {1.9, {x = 2320/2 - 200, y = 1480/2 - 200, xScale = 1, yScale = 1}, "in-out-quad"},
          },
          [2] = {
            anim = "Screen",
            x = 2320/2 - 200 + 680,
            y = 1480/2 - 200,
            xScale = 1.2,
            yScale = 1.2,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,
            tween = {1.9, {x = 2320/2 - 200, y = 1480/2 - 200, xScale = 1.1, yScale = 1.1}, "in-out-quad"},
          },
          [3] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
            x = 2320/2 - 200 + 680,
            y = 1480/2 - 200,
            xScale = 1.2,
            yScale = 1.2,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,
            tween = {1.9, {x = 2320/2 - 200, y = 1480/2 - 200, xScale = 1.1, yScale = 1.1}, "in-out-quad"},
          },
          [4] = {
            anim = "End",
            x = 2320/2 - 200 - 192,
            y = 1480/2 - 200 + 20,
            xScale = 1,
            yScale = 1,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,
            tween = {1.9, {x = 2320/2 - 200, y = 1480/2 - 200, xScale = 1, yScale = 1}, "in-out-quad"},
          },
        },
      },
    },
  },
  [24] = {
    bg = {
      anim = RobotRoom_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit = RM:loadAnimation("s02_0_p024_m01_Quit_"),
          ShadowQuit = RM:loadAnimation("s02_0_p024_m01_DarkQuit_"),
          Box = RM:loadAnimation("s02_0_p024_m01_Box_"),
          Screen = RM:loadAnimation("s02_0_p025_m01_Screen_"),
        },
        transitionTrigger = {
          [1] = "timer",--"waitForInput",
          [2] = 2.0,
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
          },
          [2] = {
            anim = "ShadowQuit",
          },
          [3] = {
            anim = "Quit",
            alpha = 0.07, tween = {2.5, {alpha = 1}, "in-out-cubic"},
          },
          [4] = {
            anim = "Screen",
            alpha = 0.9,
          },
        },
      },
    },
  },
  [25] = {
    bg = {
      anim = RobotRoom_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation("s02_0_p025_m01_Box_"),
          Zero = RM:loadAnimation("s02_0_p025_m01_Zero_"),
          Shadow = RM:loadAnimation("s02_0_p025_m01_DarkZero_"),
          Screen = RM:loadAnimation("s02_0_p025_m01_Screen_"),
        },
        transitionTrigger = {
          [1] = "timer", [2] = 2.0, -- [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
          },
          [2] = {
            anim = "Shadow",
          },
          [3] = {
            anim = "Zero",
            alpha = .3, tween = {2.0, {alpha = 1}, "in-out-cubic"},
          },
          [4] = {
            anim = "Screen",
            alpha = 0.9,
          },
        },
      },
    },
  },
  [26] = {
    bg = {
      anim = RobotRoom_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation("s02_0_p026_m01_Box_"),
          End = RM:loadAnimation("s02_0_p026_m01_End_"),

        },
        transitionTrigger = {
          [1] = "timer",--"waitForInput",
          [2] = .7,        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
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
      anim = RobotRoom_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation("s02_0_p026_m01_Box_"),
          Box2 = RM:loadAnimation("s02_0_p027_m01_Box_"),

          End = RM:loadAnimation("s02_0_p026_m01_End_"),
          End2 = RM:loadAnimation("s02_0_p027_m01_End_"),
        },
        transitionTrigger = {
          [1] = "timer", [2] = 2.0, -- [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
            alpha = 1, tween = {1, { alpha = 0 }, "in-linear" },

          },
          [2] = {
            anim = "Box2",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
            alpha = 0, tween = {2, { alpha = 1 }, "in-linear" },

          },
          [3] = {
            anim = "End",
            alpha = 1, tween = {.4, { alpha = 0 }, "in-quart" },

          },
          [4] = {
            anim = "End2",
            alpha = 0, tween = {.7, { alpha = 1 }, "out-quart" },

          },
        },
      },
    },
  },
  [28] = {
    bg = {
      anim = RobotRoom_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation("s02_0_p028_m01_Box_"),
          Quit_Zero = RM:loadAnimation("s02_0_p028_m01_Quit_Zero_"),
          InputBox = InputBox, TextBox = RM:loadAnimation("s02_0_p028_m01_text_"),
          Screen = RM:loadAnimation("s02_0_p028_m01_screen_"),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
          },
          [2] = {
            anim = "Quit_Zero",
            x = 100, y = 10, tween = {1.7, { x = 0, y = 0 }, "in-out-cubic" },
          },
          [3] = {
            anim = "Screen",
            x = 100, y = 10, tween = {1.7, { x = 0, y = 0 }, "in-out-cubic" },
          },
          [4] = {
            anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, 
          }, 
          [5] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
          },
        },
      },
      [2] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation("s02_0_p028_m01_Box_"),
          Quit_Zero = RM:loadAnimation("s02_0_p028_m01_Quit_Zero_"),
          InputBox = InputBox, TextBox = RM:loadAnimation("s02_0_p028_m02_Text_"),
          Screen = RM:loadAnimation("s02_0_p028_m01_screen_"),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
          },
          [2] = {
            anim = "Quit_Zero",
          },
          [3] = {
            anim = "Screen",
          },
          [4] = {
            anim = "TextBox", 
          }, 
          [5] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
          },
        },
      },
      [3] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation("s02_0_p028_m01_Box_"),
          Quit_Zero = RM:loadAnimation("s02_0_p028_m01_Quit_Zero_"),
          InputBox = InputBox, TextBox = RM:loadAnimation("s02_0_p028_m03_Text_"),
          Screen = RM:loadAnimation("s02_0_p028_m01_screen_"),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
          },
          [2] = {
            anim = "Quit_Zero",
          },
          [3] = {
            anim = "Screen",
          },
          [4] = {
            anim = "TextBox", 
            }, [5] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
          },
        },
      },
    },
  },
  [29] = {
    bg = {
      anim = RobotRoom_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation("s02_0_p029_m01_Box_"),
          Quit_Zero = RM:loadAnimation("s02_0_p029_m01_Quit_Zero_"),
          InputBox = InputBox, TextBox = RM:loadAnimation("s02_0_p029_m01_text_"),
          Screen = RM:loadAnimation("s02_0_p028_m01_screen_"),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
          },
          [2] = {
            anim = "Quit_Zero",
          },
          [3] = {
            anim = "Screen",
          },
          [4] = {
            anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [5] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
          },
        },
      },
    },
  },
  [30] = {
    bg = {
      anim = RobotRoom_blur,
    },
    moments = {
      [1] = {
        sounds = {
          {"Frogy Laugh VN"}
        },
        anims = {
          Box = RM:loadAnimation("s02_0_p030_m01_Box_"),
          Quit = RM:loadAnimation("s02_0_p030_m01_Quit_"),
          laugh = RM:loadAnimation("s02_0_p030_m01_text_"),
          Screen = RM:loadAnimation("s02_0_p030_m01_screen_"),
        },
        transitionTrigger = {
          [1] = "timer",--"waitForInput",
          [2] = .4,
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
          },
          [2] = {
            anim = "Quit",
            alpha = 0.9
          },
          [3] = {
            anim = "Screen",
          },
          [4] = {
            anim = "laugh",

            x = 2320/2 - 200 + 100,
            y = 1480/2 - 200 + 0,
            xScale = 1,
            yScale = 1,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,

            tween = {0.3, {
                x = 2320/2 - 200 + 100,
                y = 1480/2 - 200 - 300,
                xScale = 1,
                yScale = 1,
                alpha = 0,
                }, "out-quart"
            },

          },

        },
      },
      [2] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation("s02_0_p030_m01_Box_"),
          Quit = RM:loadAnimation("s02_0_p030_m01_Quit_"),
          laugh = RM:loadAnimation("s02_0_p030_m02_text_"),
          Screen = RM:loadAnimation("s02_0_p030_m01_screen_"),
        },
        transitionTrigger = {
          [1] = "timer",--"waitForInput",
          [2] = 0.4,
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
          },
          [2] = {
            anim = "Quit",
          },
          [3] = {
            anim = "Screen",
          },
          [4] = {
            anim = "laugh",
            x = 2320/2 - 200 + 00,
            y = 1480/2 - 200 - 100,
            xScale = 1,
            yScale = 1,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,

            tween = {0.3, {
                x = 2320/2 - 200 + 0,
                y = 1480/2 - 200 - 400,
                xScale = 1,
                yScale = 1,
                alpha = 0,
                }, "out-quart"
            },

          },

        },
      },
      [3] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation("s02_0_p030_m01_Box_"),
          Quit = RM:loadAnimation("s02_0_p030_m01_Quit_"),
          laugh = RM:loadAnimation("s02_0_p030_m03_text_"),
          Screen = RM:loadAnimation("s02_0_p030_m01_screen_"),
        },
        transitionTrigger = {
          [1] = "timer", [2] = 1.0,
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
          },
          [2] = {
            anim = "Quit",
          },
          [3] = {
            anim = "Screen",
          },
          [4] = {
            anim = "laugh",
            x = 2320/2 - 200 - 200,
            y = 1480/2 - 200 - 100,
            xScale = 1,
            yScale = 1,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,

            tween = {0.3, {
                x = 2320/2 - 200 - 200,
                y = 1480/2 - 200 - 400,
                xScale = 1,
                yScale = 1,
                alpha = 0,
                }, "out-quart"
            },

          },

        },
      },
    },
  },
  [31] = {
    bg = {
      anim = RobotRoom_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation("s02_0_p031_m01_Box_"),
          End = RM:loadAnimation("s02_0_p031_m01_End_"),
          Quit_Zero = RM:loadAnimation("s02_0_p031_m01_Quit_Zero_"),
          InputBox = InputBox, TextBox = RM:loadAnimation("s02_0_p031_m01_text_"),
          Screen = RM:loadAnimation("s02_0_p031_m01_screen_"),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {

          [1] = {
            anim = "End",
            x = 0 + 200,
            y = 300,
            rotation = -.1,
            tween = {1.0, {x = 0}, "out-quad" },
          },
          [2] = {
            anim = "Screen",
          },
          [3] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
            x = 0,
            y = 150,
          },
          [4] = {
            anim = "TextBox", 
            alpha = 0, x = 100, y = 200, 
            tween = {.1, {alpha = 1}, "in-linear"}, 
          }, 
          [5] = {
            anim = "Quit_Zero",
            x = 0 - 100,
            y = 0,
            tween = {1.0, {x = 0}, "out-quad" },
          },
          [6] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
          },
        },
      },
    },
  },
  [32] = {
    bg = {
      anim = RobotRoom_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation("s02_0_p032_m01_Box_"),
          End = RM:loadAnimation("s02_0_p032_m01_End_"),
          InputBox = InputBox, TextBox = RM:loadAnimation("s02_0_p032_m01_text_"),
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
            x = 2320/2 - 200 - 0,
            y = 1480/2 - 200 + 50,
            xScale = .96,
            yScale = .96,
            xOffset = 2320/2,
            yOffset = 1480/2,

            tween = {1.2, {
                x = 2320/2 - 200 - 0,
                y = 1480/2 - 200 - 0,
                xScale = 1,
                yScale = 1,
                }, "out-quart"
            },
          },
          [3] = {
            anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [4] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
          },
        },
      },
    },
  },
  [33] = {
    bg = {
      anim = RobotRoom_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation("s02_0_p033_m01_Box_"),
          Zero = RM:loadAnimation("s02_0_p033_m01_Zero_"),
          Screen = RM:loadAnimation("s02_0_p031_m01_screen_"),
        },
        transitionTrigger = {
          [1] = "timer", [2] = 2.0, -- [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
          },
          [2] = {
            anim = "Zero",
            x = 2320/2 - 200 - 0,
            y = 1480/2 - 200 + 20,
            xScale = .96,
            yScale = .96,
            xOffset = 2320/2,
            yOffset = 1480/2,

            tween = {1.2, {
                x = 2320/2 - 200 - 0,
                y = 1480/2 - 200 - 0,
                xScale = 1,
                yScale = 1,
                }, "out-quart"
            },
            [3] = {
              anim = "Screen",
            },
          },
          [3] = {
            anim = "Screen",
            x = 2320/2 - 200 - 0,
            y = 1480/2 - 200 + 20,
            xScale = .96,
            yScale = .96,
            xOffset = 2320/2,
            yOffset = 1480/2,

            tween = {1.2, {
                x = 2320/2 - 200 - 0,
                y = 1480/2 - 200 - 0,
                xScale = 1,
                yScale = 1,
                }, "out-quart" },
          },
        },
      },
    },
  },
  [34] = {
    bg = {
      anim = RobotRoom_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation("s02_0_p034_m01_Box_"),
          Quit_Zero = RM:loadAnimation("s02_0_p034_m01_Quit_Zero_"),
          InputBox = InputBox, TextBox = RM:loadAnimation("s02_0_p034_m01_text_"),
        },
        transitionTrigger = {
          [1] = "timer", [2] = 2.0, -- [1] = "waitForInput",

        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
          },
          [2] = {
            anim = "Quit_Zero",
          },
          [3] = {
            anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, 
          },
        },
      },
      [2] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation("s02_0_p034_m01_Box_"),
          Quit_Zero = RM:loadAnimation("s02_0_p034_m01_Quit_Zero_"),

          Quit_Zero2 = RM:loadAnimation("s02_0_p034_m02_Quit_Zero_"),
          InputBox = InputBox, TextBox = RM:loadAnimation("s02_0_p034_m02_text_"),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
          },
          [2] = {
            anim = "Quit_Zero",
            alpha = 1, tween = {.8, {alpha = 0,}, "out-linear"}

          },
          [3] = {
            anim = "Quit_Zero2",
            alpha = 0, tween = {1.0, {alpha = 1,}, "out-linear"}
          },
          [4] = {
            anim = "TextBox", }, [5] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
          },
        },
      },
    },
  },
  [35] = {
    bg = {
      anim = RobotRoom_blur,
    },
    moments = {
      [1] = {
        sounds = {
          {"Earth2"},
        },
        music = {"stop"},
        anims = {
          Box = RM:loadAnimation("s02_0_p035_m01_Box_"),
          Quit = RM:loadAnimation("s02_0_p035_m01_Quit_"),
          InputBox = InputBox, TextBox = RM:loadAnimation("s02_0_p035_m01_text_"),
          Screen = RM:loadAnimation("s02_0_p035_m01_screen_"),
          Effect = RM:loadAnimation("intenseFX_"),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
          },
          [2] = {
            anim = "Quit",
          },
          [3] = {
            anim = "Screen",
            alpha = 0.8,
          },
          [4] = {
            anim = "Effect",
          },
          [5] = {
            anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [6] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
          },
        },
      },
    },
  },
  [36] = {
    bg = {
      anim = RobotRoom_blur,
    },
    moments = {
      [1] = {
        sounds = {
          {"Wind1"},
        },
        anims = {
          Box = RM:loadAnimation("s02_0_p036_m01_Box_"),
          End = RM:loadAnimation("s02_0_p036_m01_End_"),
          Effect = RM:loadAnimation("intenseFX_"),
          Robot = RM:loadAnimation("s02_0_p036_m01_Robot_"),
        },
        transitionTrigger = {
          [1] = "timer", [2] = .8, -- [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
          },
          [2] = {
            anim = "Effect",
            red=4, green=4, blue=4,
          },
          [3] = {
            anim = "End",
          },
          [4] = {
            anim = "Robot",
            x = 2320/2 - 200 + 500,
            y = 1480/2 - 200 + 500,
            xScale = 1.6,
            yScale = 1.6,
            xOffset = 2320/2,
            yOffset = 1480/2,
            tween = {0.8, {x = 2320/2 - 200, y = 1480/2 - 200, xScale = 1.1, yScale = 1.1, }, "out-linear"},
          },
        },
      },
      [2] = {
        sounds = {
          {"Telegraph Echo"},
        },
        anims = {
          End = RM:loadAnimation("s02_0_p036_m02_End_"),
          Star = RM:loadAnimation("s02_0_p036_m02_Star_"),
          Effect = RM:loadAnimation("intenseFX_"),
          Robot = RM:loadAnimation("s02_0_p036_m02_Robot_"),
        },
        transitionTrigger = {
          [1] = "timer", [2] = 0.1, -- [1] = "waitForInput",
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
            x = 2320/2 - 200,
            y = 1480/2 - 200,
            xScale = 1.1,
            yScale = 1.1,
            xOffset = 2320/2,
            yOffset = 1480/2,
            tween = {0.1, {x = 2320/2 - 200 - 5, y = 1480/2 - 200 - 5, xScale = 1, yScale = 1, }, "out-quart"},
          },
          [4] = {
            anim = "Star",
            x = 2320/2 - 200,
            y = 1480/2 - 200,
            xScale = 1.1,
            yScale = 1.1,
            xOffset = 2320/2,
            yOffset = 1480/2,
            tween = {0.1, {x = 2320/2 - 200 - 5, y = 1480/2 - 200 - 5, xScale = 1, yScale = 1, }, "out-quart"},
          },
        },
      },
      [3] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation("s02_0_p036_m02_End_"),
          Star = RM:loadAnimation("s02_0_p036_m02_Star_"),
          Effect = RM:loadAnimation("intenseFX_"),
          Robot = RM:loadAnimation("s02_0_p036_m02_Robot_"),
          InputBox = InputBox,
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
            x = 2320/2 - 200 - 10,
            y = 1480/2 - 200 - 10,
            xScale = 1,
            yScale = 1,
            xOffset = 2320/2,
            yOffset = 1480/2,
          },
          [4] = {
            anim = "Star",
            x = 2320/2 - 200 - 10,
            y = 1480/2 - 200 - 10,
            xScale = 1,
            yScale = 1,
            xOffset = 2320/2,
            yOffset = 1480/2,
          },
          [5] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
          },
        },
      },
    },
  },
  [37] = {
    bg = {
      anim = RobotRoom_blur,
    },
    moments = {
      [1] = {
        sounds = {
          {"High Dodge Echo"}
        },
        anims = {
          Box = RM:loadAnimation("s02_0_p037_m01_Box_"),
          End = RM:loadAnimation("s02_0_p037_m01_End_"),
          Robot = RM:loadAnimation("s02_0_p037_m01_Robot_"),
        },
        transitionTrigger = {
          [1] = "timer", [2] = 2.0, 
        },
        drawData = {
          [1] = {
            anim = "Box", alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
          },
          [2] = {
            anim = "End",
            x = 0,
            y = 0 + 30,
            tween = {2.0, {x = 300, y = 0}, "out-quad" }, 
          },
          [3] = {
            anim = "Robot",
            x = 0 + 10,
            y = 0,
            tween = {2.0, {x = 0, y = 0}, "in-linear" }, 
          },
        },
      },
    },
  },
  [38] = {
    bg = {
      anim = RobotRoom_blur,
    },
    moments = {
      [1] = {
        sounds = {
          {"Robot Reveal 1", {delay = 0.3}}
        },
        music = {"Build_up_Theme Full"},
        anims = {
          Box = RM:loadAnimation("s02_0_p038_m01_Box_"),
          RobotArm = RM:loadAnimation("s02_0_p038_m01_Robot_"),
          RobotBod = RM:loadAnimation("s02_0_p039_m01_RobBody_"),
          Black = Black,
        },
        transitionTrigger = {
          [1] = "timer", [2] =3.0, -- [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
          },
          [2] = {
            anim = "RobotBod",
          },
          [3] = {
            anim = "Black",
            alpha = 1,
            tween = {2.5, {alpha = 0.5 }, "in-linear" },
          },
          [4] = {
            anim = "RobotArm",
          },
        },
      },
      [2] = {
        sounds = {
          {"Robot Reveal 2"},
        },
        anims = {
          Box = RM:loadAnimation("s02_0_p038_m01_Box_"),
          RobotArm = RM:loadAnimation("s02_0_p039_m02_RobArm_"),
          RobotBod = RM:loadAnimation("s02_0_p039_m01_RobBody_"),
          Black = Black,
        },
        transitionTrigger = {
          [1] = "timer", [2] = 2.5, -- [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
          },
          [2] = {
            anim = "RobotBod",
          },
          [3] = {
            anim = "RobotArm",
            x = 0,
            y = 10,
            tween = {1.0, {y = 0}, "out-quad" },
          },
          [4] = {
            anim = "Black",
            alpha = 0.5, 
            tween = {2.5, {alpha = 0 }, "in-linear" },
          },
        },
      },
    },
  },
  --[39] = {
  --  bg = {
  --    anim = RobotRoom_blur,
  --  },
  --  moments = {
  --    [1] = {
  --      sounds = {
  --      },
  --      anims = {
  --        Box = RM:loadAnimation("s02_0_p039_m01_Box_"),
  --        Robot = RM:loadAnimation("s02_0_p039_m01_Robot_"),
  --      },
  --      transitionTrigger = {
  --        [1] = "timer", [2] = 2.0, -- [1] = "waitForInput",
  --      },
  --      drawData = {
  --        [1] = {
  --          anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
  --        },
  --        [2] = {
  --          anim = "Robot",
  --        },
  --      },
  --    },
  --  },
  --},
  [40] = {
    bg = {
      anim = RobotRoom_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation("s02_0_p040_m01_Box_"),
          End = RM:loadAnimation("s02_0_p040_m01_End_"),
          Robot = RM:loadAnimation("s02_0_p040_m01_Robot_"),
          InputBox = InputBox,
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
          },
          [2] = {
            anim = "Robot",
            x = - 100,
            tween = {1.0, {x = 0}, "out-quad"},
          },
          [3] = {
            anim = "End",
            x = 100,
            tween = {1.0, {x = 0}, "out-quad"},
          },
          [4] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
          },
        },
      },
    },
  },
  [41] = {
    bg = {
      anim = RobotRoom_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation("s02_0_p041_m01_Box_"),
          Quit = RM:loadAnimation("s02_0_p041_m01_Quit_"),
          InputBox = InputBox, TextBox = RM:loadAnimation("s02_0_p041_m01_text_"),
          Screen = RM:loadAnimation("s02_0_p041_m01_screen_"),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
          },
          [2] = {
            anim = "Quit",
            x = 2320/2 - 200 + 100,
            y = 1480/2 - 200 + 20,
            xScale = .98,
            yScale = .98,
            xOffset = 2320/2,
            yOffset = 1480/2,

            tween = {1.2, {
                x = 2320/2 - 200 - 0,
                y = 1480/2 - 200 - 0,
                xScale = 1,
                yScale = 1,
                }, "out-quart",
            },
          },
          [3] = {
            anim = "Screen",
          },
          [4] = {
            anim = "TextBox", 
            alpha = 0, tween = {.1, {alpha = 1 }, "in-linear" }, 
          }, 
          [5] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
          },
        },
        [3] = {
          anim = "Screen",
        },
        [4] = {
          anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [5] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
        },
      },
    },
  },
  [42] = {
    bg = {
      anim = RobotRoom_blur,
    },
    moments = {
      [1] = {
        sounds = {
          {"Intense Moment"},
        },
        music = {"stop"},
        anims = {
          Box = RM:loadAnimation("s02_0_p042_m01_Box_"),
          Quit = RM:loadAnimation("s02_0_p042_m01_Quit_"),
          InputBox = InputBox, TextBox = RM:loadAnimation("s02_0_p042_m01_text_"),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = { 
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
          },
          [2] = {
            anim = "Quit",
          },
          [3] = {
            anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [4] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
          },
        },
      },
    },
  },
  [44] = {
    bg = {
      anim = RobotRoom_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          ProTip = RM:loadAnimation("s02_0_p043_m01_Tips_"),
        },
        transitionTrigger = {
          [1] = "waitForInput",
          enemyToGoTo = "enemyQuit1",
        },
        drawData = { 
          [1] = { 
            anim = "ProTip", 
          },
        },
      },
    },
  },  
}