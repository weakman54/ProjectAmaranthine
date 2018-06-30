

local RM = require "resourceManager.resourceManager"


RM.prefix = "assets/Backgrounds/"

local White = RM:loadAnimation("white")
local Black = RM:loadAnimation("black")


--local InsideRobot = RM:loadAnimation("Inside_robot_")
local InsideRobot_blur = RM:loadAnimation("inside_robot_blur_")
local InsideRobot_flipped_blur = RM:loadAnimation("inside_robot_flipped_blur_")




RM.prefix = "assets/GUI/"
local InputBox = RM:loadAnimation("Input_Box_")






RM.prefix = "assets/FX/"




RM.prefix = "assets/VN/scene04_2_killOption/"


local boxDarken = 0.1
local boxAlpha = 0.8


return {
  [1] = {
    bg = {
      anim = InsideRobot_blur,
    },
    moments = {
      [1] = {
        sounds = {
          {"Final Gunshot Kill"},
        },
        music = {"stop"},
        anims = {
          White = White,
          Box = RM:loadAnimation("s04_2_p001_m01_Box_"),
          EEnd = RM:loadAnimation("s04_2_p001_m01_End_"),
        },
        transitionTrigger = {
          [1] = "timer",--"waitForInput",
          [2] = 3
        },
        drawData = {
          [1] = {
            anim = "White",
            alpha = 1, tween = {3, { alpha = .66 }, "in-linear" },
          },
          [2] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken
          },
          [3] = {
            anim = "EEnd",
          },
        },
      },
    },
  },
  [2] = {
    bg = {
      anim = InsideRobot_flipped_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation("s04_2_p002_m01_Box_"),
          White = White,
          Zero = RM:loadAnimation("s04_2_p002_m01_Zero_"),
        },
        transitionTrigger = {
          [1] = "timer",--"waitForInput",
          [2] = 2
        },
        drawData = {
          [2] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken
          },  
          [3] = {
            anim = "Zero",
          },
          [1] = {
            anim = "White",
            alpha = .63, tween = {2, { alpha = .33 }, "in-linear" },
          },
        },
      },
    },
  },
  [3] = {
    bg = {
      anim = InsideRobot_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation("s04_2_p003_m01_Box_"),
          White = White,
          EEnd = RM:loadAnimation("s04_2_p003_m01_End_"),
        },
        transitionTrigger = {
          [1] = "timer",--"waitForInput",
          [2] = 3,
        },
        drawData = {
          [1] = {
            anim = "White",
            alpha = .63, tween = {2, { alpha = .33 }, "in-linear" },

          },
          [2] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken
          },
          [3] = {
            anim = "EEnd",
          },
        },
      },
    },
  },
  [4] = {
    bg = {
      anim = InsideRobot_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation("s04_2_p004_m01_Box_"),
          White = White,
          EEnd_Zero = RM:loadAnimation("s04_2_p004_m01_End_Zero_"),
        },
        transitionTrigger = {
          [1] = "timer",--"waitForInput",
          [2] = 2.0
        },
        drawData = {
          [1] = {
            anim = "White",
            alpha = .63, tween = {2, { alpha = .33 }, "in-linear" },

          },
          [2] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken

          },
          [3] = {
            anim = "EEnd_Zero",
            x = 2320/2 - 200 + 200,
            y = 1480/2 - 200 + 100,
            xScale = 1,
            yScale = 1,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,

            tween = {2, {
                x = 2320/2 - 200,
                y = 1480/2 - 200,
                xScale = 1,
                yScale = 1,
                alpha = 1,
                }, "out-quad"
            },
          },
        },
      },
    },
  },
  [5] = {
    bg = {
      anim = InsideRobot_flipped_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation("s04_2_p005_m01_Box_"),
          White = White,
          EEnd_Zero = RM:loadAnimation("s04_2_p005_m01_End_Zero_"),
        },
        transitionTrigger = {
          [1] = "timer",--"waitForInput",
          [2] = 2.7
        },
        drawData = {
          [1] = {
            anim = "White",
            alpha = .63, tween = {2, { alpha = .33 }, "in-linear" },
          },
          [2] = {
            anim = "Box",
          },
          [3] = {
            anim = "EEnd_Zero",
            x = 2320/2 - 200 - 300,
            y = 1480/2 - 200,
            xScale = 1.2,
            yScale = 1.2,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,

            tween = {3, {
                x = 2320/2 - 200,
                y = 1480/2 - 200,
                xScale = 1,
                yScale = 1,
                alpha = 1,
                }, "out-quad"
            },
          },
        },
      },
    },
  },
  [6] = {
    bg = {
      anim = InsideRobot_flipped_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box1 = RM:loadAnimation("s04_2_p009_m01_Box_"),
          Box2 = RM:loadAnimation("s04_2_p009_m01_Box_"),
          White = White,
          EEnd_Zero = RM:loadAnimation("s04_2_p006_m01_End_Zero_"),
        },
        transitionTrigger = {
          [1] = "timer",--"waitForInput",
          [2] = 2.0
        },
        drawData = {

          [1] = {
            anim = "White",
            alpha = .63, tween = {2, { alpha = .63 }, "in-linear" },

          },
          [2] = {
            anim = "Box1",red=boxDarken,green=boxDarken,blue=boxDarken,
            x = -1800, y = 0, tween = {5, { x = -1160 }, "in-linear" },

          },
          [3] = {
            anim = "Box2",red=boxDarken,green=boxDarken,blue=boxDarken,
            x = 1800, y = 0, tween = {5, { x = 1160 }, "in-linear" },

          },
          [4] = {
            anim = "EEnd_Zero",

            x = 2320/2 - 200 - 200,
            y = 1480/2 - 200,
            xScale = 1.2,
            yScale = 1.2,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,

            tween = {3, {
                x = 2320/2 - 200+100,
                y = 1480/2 - 200,
                xScale = 1,
                yScale = 1,
                alpha = 1,
                }, "out-quad"
            },
          },
        },
      },
    },
  },
  [7] = {
    bg = {
      anim = InsideRobot_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box1 = RM:loadAnimation("s04_2_p009_m01_Box_"),
          Box2 = RM:loadAnimation("s04_2_p009_m01_Box_"),
          Black = Black,
          Quit = RM:loadAnimation("s04_2_p007_m01_Quit_"),
        },
        transitionTrigger = {
          [1] = "timer",--"waitForInput",
          [2] = 6.0,
          gotoScene = "05_0",

        },
        drawData = {
          [2] = {
            anim = "Black",
            alpha = .2, tween = {5, { alpha = .5 }, "in-cubic" },
          },
          [3] = {
            anim = "Box1",red=boxDarken,green=boxDarken,blue=boxDarken,
            x = -1700, y = 0, tween = {5, { x = -1160 }, "in-linear" },

          },
          [4] = {
            anim = "Box2",red=boxDarken,green=boxDarken,blue=boxDarken,
            x = 1700, y = 0, tween = {5, { x = 1160 }, "in-linear" },

          },
          [1] = {
            anim = "Quit",
            x = 2320/2 - 200 + 0,
            y = 1480/2 - 200 - 0,
            xScale = .7,
            yScale = .7,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,

            tween = {5, {
                x = 2320/2 - 200,
                y = 1480/2 - 200,
                xScale = .6,
                yScale = .6,
                alpha = 1,
                }, "out-linear"
            },
          },
          [5] = {
            anim = "Black",
            alpha = 0, tween = {5, { alpha = 1 }, "in-cubic" },
          },
        },
      },
    },
  },
}