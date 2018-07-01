
local RM = require "resourceManager.resourceManager"


RM.prefix = "assets/Backgrounds/"

--local White = RM:loadAnimation("white")
local Black = RM:loadAnimation("black")


local InsideRobot = RM:loadAnimation("inside_robot_")
local InsideRobot_blur = RM:loadAnimation("inside_robot_blur_")
--local InsideRobot_flipped = RM:loadAnimation("inside_robot_flipped_")
local InsideRobot_blur_flipped = RM:loadAnimation("inside_robot_blur_flipped_")



RM.prefix = "assets/GUI/"
local InputBox = RM:loadAnimation("Input_Box_")






RM.prefix = "assets/FX/"





RM.prefix = "assets/VN/scene04_0_aftermath/"


local boxDarken = 0.1
local boxAlpha = 0.8


return {
  [1] = {
    bg = {
      anim = InsideRobot,
    },
    moments = {
      [1] = {
        sounds = {
          {"Final Kick"},
        },
        anims = {
          Box = RM:loadAnimation("s04_0_p001_m01_Box_"),
          EEnd =RM:loadAnimation("s04_0_p001_m01_End_"),
          Quit = RM:loadAnimation("s04_0_p001_m01_QuitOnly_"),
          Cap = RM:loadAnimation("s04_0_p001_m01_Cap_"),
          Sword = RM:loadAnimation("s04_0_p001_m01_Sword_"),
          Black = Black,
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
            x = 2320/2 - 200 + 0,
            y = 1480/2 - 200 - 0,
            xScale = 1,
            yScale = 1,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,

            tween = {3, {
                x = 2320/2 - 200,
                y = 1480/2 - 200,
                xScale = 1.1,
                yScale = 1.1,
                alpha = 1,
                }, "out-quad"
            },
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
          [6] = {
            anim = "Black",

            alpha = 0,

            tween = {3, {

                alpha = 1,
                }, "out-cubic"
            },
          },
        },
      },
    },
  },
  [2] = {
    bg = {
      anim = InsideRobot_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation("s04_0_p002_m01_Box_"),
          Quit = RM:loadAnimation("s04_0_p002_m01_Quit_"),
          Black = Black,

        },
        transitionTrigger = {
          [1] = "timer",--"waitForInput",
          [2] = 3.0
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken
          },
          [2] = {
            anim = "Quit",
          },
          [3] = {
            anim = "Black",
            alpha = 1, tween = {3, { alpha = 0 }, "in-linear" },
          },
        },
      },
      [2] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation("s04_0_p002_m01_Box_"),
          EEnd =RM:loadAnimation("s04_0_p002_m02_End_"),
          Quit1 = RM:loadAnimation("s04_0_p002_m01_Quit_"),
          Quit2 = RM:loadAnimation("s04_0_p002_m02_Quit_"),
        },
        transitionTrigger = {
          [1] = "timer",--"waitForInput",
          [2] = 1.5
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken
          },  
          [2] = {
            anim = "EEnd",
            x = -500, alpha = 0.5, tween = {1.5, { x = 0, alpha =  1 }, "out-quart" },


          },
          [3] = {
            anim = "Quit1",


          },
          [4] = {
            anim = "Quit2",
            alpha = 0, tween = {1.5, { alpha = 1 }, "out-quart" },

          },
        },
      },
      [3] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation("s04_0_p002_m01_Box_"),
          EEnd =RM:loadAnimation("s04_0_p002_m02_End_"),
          Quit1 = RM:loadAnimation("s04_0_p002_m01_Quit_"),
          Quit2 = RM:loadAnimation("s04_0_p002_m02_Quit_"),
          InputBox = InputBox,

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
            anim = "Quit1",
          },
          [4] = {
            anim = "Quit2",
          },
          [5] = {
            anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
          },
        },
      },
      [4] = {
        sounds = {
          {"Gun Cock"},
        },
        music = {"Conflict to Resolve Theme (Happy) Intro"},
        anims = {
          Box = RM:loadAnimation("s04_0_p002_m01_Box_"),
          Quit2 = RM:loadAnimation("s04_0_p002_m02_Quit_"),
          EEnd = RM:loadAnimation("s04_0_p002_m02_End_"),
          Gun = RM:loadAnimation("s04_0_p002_m03_Gun_"),
          Quit3 = RM:loadAnimation("s04_0_p002_m03_Quit_"),

        },
        transitionTrigger = {
          [1] = "timer",--"waitForInput",
          [2] = 1.5
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken
          },
          [2] = {
            anim = "EEnd",
          },
          [3] = {
            anim = "Quit2",
          },
          [4] = {
            anim = "Gun",
            x = 0,y = -230, tween = {.7, { x=0,y = 0 }, "out-expo" },
          },
        },
      },
      [5] = {
        sounds = {
        },
        music = {"Conflict to Resolve Theme (Happy) Intro"},
        anims = {
          Box = RM:loadAnimation("s04_0_p002_m01_Box_"),
          Quit2 = RM:loadAnimation("s04_0_p002_m02_Quit_"),
          EEnd = RM:loadAnimation("s04_0_p002_m02_End_"),
          Gun = RM:loadAnimation("s04_0_p002_m03_Gun_"),
          Quit3 = RM:loadAnimation("s04_0_p002_m03_Quit_"),

        },
        transitionTrigger = {
          [1] = "timer",--"waitForInput",
          [2] = 2.3
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken
          },
          [2] = {
            anim = "EEnd",
          },
          [3] = {
            anim = "Quit2",
          },
          [4] = {
            anim = "Quit3",
            alpha = 0, tween = {1.3, { alpha = 1 }, "out-quart" },
          },
          [5] = {
            anim = "Gun",
          },
        },
      },
    },
  },
  [3] = {
    bg = {
      anim = InsideRobot_blur_flipped,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation("s04_0_p003_m01_Box_"),
          EEnd_Quit = RM:loadAnimation("s04_0_p003_m01_End_Quit_"),
        },
        transitionTrigger = {
          [1] = "timer",--"waitForInput",
          [2] = 2.5,
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken
          },
          [2] = {
            anim = "EEnd_Quit",
            x = 2320/2 - 200 + 80,
            y = 1480/2 - 200 - 0,
            xScale = 1.1,
            yScale = 1.1,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,

            tween = {2.5, {
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
  [4] = {
    bg = {
      anim = InsideRobot_blur_flipped,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation("s04_0_p004_m01_Box_"),
          Zero = RM:loadAnimation("s04_0_p004_m01_Zero_"),
          InputBox = InputBox, TextBox = RM:loadAnimation("s04_0_p004_m01_Text_"),
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
            x = 2320/2 - 200 - 100,
            y = 1480/2 - 200 + 20,
            xScale = 1,
            yScale = 1,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,

            tween = {1.5, {
                x = 2320/2 - 200,
                y = 1480/2 - 200,
                xScale = 1,
                yScale = 1,
                alpha = 1,
                }, "out-quad"
            },
          },
          [3] = {
            anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [4] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
          },
        },
      },
    },
  },
  [5] = {
    bg = {
      anim = InsideRobot_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation("s04_0_p005_m01_Box_"),
          Quit = RM:loadAnimation("s04_0_p005_m01_Quit_"),
          InputBox = InputBox, TextBox = RM:loadAnimation("s04_0_p005_m01_Text_"),
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
          [3] = {
            anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [4] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
          },
        },
      },
    },
  },
  [6] = {
    bg = {
      anim = InsideRobot_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation("s04_0_p006_m01_Box_"),
          Quit = RM:loadAnimation("s04_0_p006_m01_Quit_"),
          InputBox = InputBox, TextBox = RM:loadAnimation("s04_0_p006_m01_Text_"),
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
          [3] = {
            anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [4] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
          },
        },
      },
      [2] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation("s04_0_p006_m01_Box_"),
          Quit = RM:loadAnimation("s04_0_p006_m01_Quit_"),
          InputBox = InputBox, TextBox = RM:loadAnimation("s04_0_p006_m02_Text_"),
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
          [3] = {
            anim = "TextBox", }, [4] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
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
          Box = RM:loadAnimation("s04_0_p007_m01_Box_"),
          Quit = RM:loadAnimation("s04_0_p007_m01_Quit_"),
          InputBox = InputBox, TextBox = RM:loadAnimation("s04_0_p007_m01_Text_"),
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
          [3] = {
            anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [4] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
          },
        },
      },
      [2] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation("s04_0_p007_m01_Box_"),
          Quit = RM:loadAnimation("s04_0_p007_m01_Quit_"),
          InputBox = InputBox, TextBox = RM:loadAnimation("s04_0_p007_m02_Text_"),
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
          [3] = {
            anim = "TextBox",  }, [4] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
          },
        },
      },
      [3] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation("s04_0_p007_m01_Box_"),
          Quit = RM:loadAnimation("s04_0_p007_m01_Quit_"),
          InputBox = InputBox, TextBox = RM:loadAnimation("s04_0_p007_m03_Text_"),
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
          [3] = {
            anim = "TextBox",  }, [4] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
          },
        },
      },
    },
  },
  [8] = {
    bg = {
      anim = InsideRobot_blur_flipped,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation("s04_0_p008_m01_Box_"),
          EEnd =RM:loadAnimation("s04_0_p008_m01_End_"),
          InputBox = InputBox, TextBox = RM:loadAnimation("s04_0_p008_m01_Text_"),
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
            anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [4] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
          },
        },
      },
      [2] = {
        choice = true,
        sounds = {
        },
        anims = {
          Box = RM:loadAnimation("s04_0_p008_m01_Box_"),
          EEnd =RM:loadAnimation("s04_0_p008_m01_End_"),
--          Choice = RM:loadAnimation("s04_0_p008_m02_Choice_"),          
          Choice = RM:loadAnimation("s04_0_p008_m02_ChoiceText_"), -- TODO: use proper drawn text things later
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
            anim = "EEnd",
          },
          [3] = {
            anim = "Choice",
          },
        },
      },
    },
  },
}