
local RM = require 'resourceManager.resourceManager'
RM.prefix = 'assets/VN/scene04_1_spareOption/'

local background = RM:loadAnimation('Inside_robot_')
local background_blur = RM:loadAnimation('inside_robot_blur_')
local background_flipped = RM:loadAnimation('inside_robot_flipped_')
local background_blur_flipped = RM:loadAnimation('inside_robot_blur_flipped_')

local boxDarken = 0.1
local boxAlpha = 0.8

local InputBox = RM:loadAnimation('Input_Box_')


return {
  [1] = {
    bg = {
      anim = background_blur_flipped,
    },
    moments = {
      [1] = {
        sounds = {
          {"Final Gunshot Spare"},
        },
        music = {"Conflict to Resolve Theme (Happy) Full"},
        anims = {
          White = RM:loadAnimation('white'),
          Box = RM:loadAnimation('s04_1_p001_m01_Box_'),
          End = RM:loadAnimation('s04_1_p001_m01_End_'),
          Quit = RM:loadAnimation('s04_1_p001_m01_Quit_'),
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
            anim = "End",
            x = 2320/2 - 200 + 0,
            y = 1480/2 - 200 - 0,
            xScale = 1,
            yScale = 1,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,

            tween = {2, {
                x = 2320/2 - 200-80,
                y = 1480/2 - 200,
                xScale = .9,
                yScale = .9,
                alpha = 1,
                }, "in-out-quad"
            },
          },
          [3] = {
            anim = "Quit",
            x = 2320/2 - 200 + 0,
            y = 1480/2 - 200 - 0,
            xScale = 1,
            yScale = 1,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,

            tween = {2, {
                x = 2320/2 - 200,
                y = 1480/2 - 200,
                xScale = 1.1,
                yScale = 1.1,
                alpha = 1,
                }, "in-out-quad"
            },
          },
          [4] = {
            anim = "White",
            alpha = .63, tween = {2, { alpha = 0 }, "in-out-quad" },

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
          End_Quit = RM:loadAnimation('s04_1_p002_m01_End_Quit_'),
          Box = RM:loadAnimation('s04_1_p002_m01_Box_'),
        },
        transitionTrigger = {
          [1] = "timer",--"waitForInput",
          [2] = 2.3,
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
			x= 0,y =0,
          tween = {2.3, {x = 0, y = 20}, "in-linear" },
          },
          [2] = {
            anim = "End_Quit",
          x= 0,y =0,
          tween = {2.3, {y = 20}, "in-linear" },
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
          Quit = RM:loadAnimation('s04_1_p003_m01_Quit_'),
          Box = RM:loadAnimation('s04_1_p003_m01_Box_'),
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
            anim = "Quit",
            x = 2320/2 - 200 -0,
            y = 1480/2 - 200 -0,
            xScale = 1,
            yScale = 1,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,
            --intensity = 1,

            tween = {2.3, {
                x = 2320/2 - 200+10,
                y = 1480/2 - 200+30,
                xScale = 1,
                yScale = 1,
                alpha = 1,
               -- intensity =0
                }, "out-linear"
            },
          
          },
        },
      },
    },
  },
  [4] = {
    bg = {
      anim = background_blur_flipped,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation('s04_1_p004_m01_End_'),
          Box = RM:loadAnimation('s04_1_p004_m01_Box_'),
          InputBox = InputBox, TextBox = RM:loadAnimation('s04_1_p004_m01_Text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken
          },
          [2] = {
            anim = "End",
            x = 2320/2 - 200 + 2,
            y = 1480/2 - 200 + 10,
            xScale = 1,
            yScale = 1,
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
          [3] = {
            anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [4] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
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
          Quit = RM:loadAnimation('s04_1_p005_m01_Quit_'),
          End_End = RM:loadAnimation('s04_1_p005_m01_End_End_'),
          Box = RM:loadAnimation('s04_1_p005_m01_Box_'),
          Quit = RM:loadAnimation('s04_1_p005_m01_Quit_'),
          InputBox = InputBox, TextBox = RM:loadAnimation('s04_1_p005_m01_Text_'),
        },
        transitionTrigger = {
          [1] = "timer",--"waitForInput",
          [2] = 1.0
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
            x = 2320/2 - 200 - 200,
            y = 1480/2 - 200 - 0,
            xScale = 1,
            yScale = 1,
            xOffset = 2320/2,
            yOffset = 1480/2,

            tween = {1.0, {
                x = 2320/2 - 200,
                y = 1480/2 - 200,
                xScale = 1,
                yScale = 1,
                }, "in-out-quad"
            },
          },
          [2] = {
            anim = "Quit",

            x = 2320/2 - 200 - 500,
            y = 1480/2 - 200 - 0,
            xScale = 1,
            yScale = 1,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,

            tween = {1.0, {
                x = 2320/2 - 200,
                y = 1480/2 - 200,
                xScale = 1,
                yScale = 1,
                alpha = 1,
                }, "in-out-quad"
            },
          },
          [3] = {
            anim = "End_End",
            x = 2320/2 - 200 + 500,
            y = 1480/2 - 200 + 100,
            xScale = .95,
            yScale = .95,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,

            tween = {1.0, {
                x = 2320/2 - 200 + 200,
                y = 1480/2 - 200,
                xScale = 1,
                yScale = 1,
                alpha = 1,
                }, "in-out-quad"
            },
          },
        },
      },
     [2] = {
        sounds = {
        },
        anims = {
          Quit = RM:loadAnimation('s04_1_p005_m01_Quit_'),
          End_End = RM:loadAnimation('s04_1_p005_m01_End_End_'),
          Box = RM:loadAnimation('s04_1_p005_m01_Box_'),
          Quit = RM:loadAnimation('s04_1_p005_m01_Quit_'),
          InputBox = InputBox, TextBox = RM:loadAnimation('s04_1_p005_m01_Text_'),
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
            anim = "End_End",
                x =  200,

          },
          [4] = {
            anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [5] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
          },
        }, 
      },
    },
  },
  [6] = {
    bg = {
      anim = background_blur_flipped,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End_Zero_Quit = RM:loadAnimation('s04_1_p006_m01_End_Zero_Quit_'),
          Box = RM:loadAnimation('s04_1_p006_m01_Box_'),
          InputBox = InputBox, TextBox = RM:loadAnimation('s04_1_p006_m01_Text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken
          },
          [2] = {
            anim = "End_Zero_Quit",
            x = 2320/2 - 200 + 0,
            y = 1480/2 - 200 - 0,
            xScale = 1,
            yScale = 1,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,

            tween = {2, {
                x = 2320/2 - 200 + 50,
                y = 1480/2 - 200 + 50,
                xScale = 1.05,
                yScale = 1.05,
                alpha = 1,
                }, "in-out-quad"
            },
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
          End_Zero_Quit = RM:loadAnimation('s04_1_p006_m01_End_Zero_Quit_'),
          Box = RM:loadAnimation('s04_1_p006_m01_Box_'),
          InputBox = InputBox, TextBox = RM:loadAnimation('s04_1_p006_m02_Text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken
          },
          [2] = {
            anim = "End_Zero_Quit",
            x = 2320/2 - 200 + 50,
            y = 1480/2 - 200 + 50,
            xScale = 1.05,
            yScale = 1.05,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,
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
      anim = background_blur_flipped,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          EEnd_Zero = RM:loadAnimation('s04_1_p007_m01_End_Zero_'),
          Box = RM:loadAnimation('s04_1_p007_m01_Box_'),
          InputBox = InputBox, TextBox = RM:loadAnimation('s04_1_p007_text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
--          [2] = 1.3,
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken
          },
          [2] = {
            anim = "EEnd_Zero",
            x = 2320/2 - 200 + 40,
            y = 1480/2 - 200 - 0,
            xScale = 1,
            yScale = 1,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,

            tween = {1.3, {
                x = 2320/2 - 200,
                y = 1480/2 - 200,
                xScale = 1,
                yScale = 1,
                alpha = 1,
                }, "in-out-quad"
            },
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
      anim = background_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          Quit = RM:loadAnimation('s04_1_p008_m01_Quit_'),
          Box = RM:loadAnimation('s04_1_p008_m01_Box_'),
          InputBox = InputBox, TextBox = RM:loadAnimation('s04_1_p008_m01_Text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
            x = 2320/2 - 200 - 110,
            y = 1480/2 - 200 - 0,
            xScale = 1,
            yScale = 1,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,

            tween = {2, {
                x = 2320/2 - 200+5,
                y = 1480/2 - 200+60,
                xScale = .9,
                yScale = .9,
                alpha = 1,
                }, "in-out-quad"
            },

          },
          [2] = {
            anim = "Quit",
            x = 2320/2 - 200 - 100,
            y = 1480/2 - 200 - 0,
            xScale = 1,
            yScale = 1,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,

            tween = {2, {
                x = 2320/2 - 200,
                y = 1480/2 - 200+60,
                xScale = .9,
                yScale = .9,
                alpha = 1,
                }, "in-out-quad"
            },
          },
          [3] = {
            anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [4] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
          },
        },
      },
    },
  },
  [9] = {
    bg = {
      anim = background_blur,
    },
    moments = { -- I want separate sprites :( 
      [1] = {
        sounds = {
        },
        anims = {
          EEnd_Zero_Quit = RM:loadAnimation('s04_1_p009_m01_End_Zero_Quit_'),
          Box = RM:loadAnimation('s04_1_p009_m01_Box_'),
          InputBox = InputBox, TextBox = RM:loadAnimation('s04_1_p009_m01_Text_'),
        },
        transitionTrigger = {
          [1] = "waitForInput",
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken
          },
          [2] = {
            anim = "EEnd_Zero_Quit",
            x = 2320/2 - 200 + 0,
            y = 1480/2 - 200 - 0,
            xScale = 1,
            yScale = 1,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,

            tween = {1, {
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
  [10] = {
    bg = {
      anim = background_blur_flipped,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          EEnd_Zero = RM:loadAnimation('s04_1_p010_m01_End_Zero_'),
          Box = RM:loadAnimation('s04_1_p010_m01_Box_'),
        },
        transitionTrigger = {
          [1] = "timer",--"waitForInput",
          [2] = 2.4,
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
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
                }, "out-linear"
            },
          },
          [2] = {
            anim = "EEnd_Zero",
            x = 2320/2 - 200 + 0,
            y = 1480/2 - 200 - 0,
            xScale = 1.1,
            yScale = 1.1,
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
  [11] = {
    bg = {
      anim = background_blur_flipped,
    },
    moments = {
      [1] = {
        sounds = {
        },
        anims = {
          End = RM:loadAnimation('s04_1_p011_m01_End_'),
          Box = RM:loadAnimation('s04_1_p011_m01_Box_'),
        },
        transitionTrigger = {
          [1] = "timer",--"waitForInput",
          [2] = 2.0,
        },
        drawData = {
          [1] = {
            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,
            x = 2320/2 - 200 + 0,
            y = 1480/2 - 200 -30,
            xScale = .95,
            yScale = .95,
            xOffset = 2320/2,
            yOffset = 1480/2,

            tween = {2, {
                x = 2320/2 - 200,
                y = 1480/2 - 200,
                xScale = 1.1,
                yScale = 1.1,
                }, "out-quad"
            },
          },
          [2] = {
            anim = "End",
            x = 2320/2 - 200 + 0,
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
  [12] = {
    bg = {
      anim = background_blur,
    },
    moments = {
      [1] = {
        sounds = {
        },
		music = {"Conflict to Resolve Theme (Happy) Full", {fade = {duration = 8, rate = -1/8}}},
        anims = {
          Box1 = RM:loadAnimation('s04_1_p012_m01_Box_'),
          Box2 = RM:loadAnimation('s04_1_p013_m01_Box_'),
          Box3 = RM:loadAnimation('s04_1_p014_m01_Box_'),
          Box4 = RM:loadAnimation('s04_1_p015_m01_Box_'),
          Zero = RM:loadAnimation('s04_1_p012_m01_Zero_'),
          Quit = RM:loadAnimation('s04_1_p012_m01_Quit_'),
          Text1 = RM:loadAnimation('s04_1_p012_m01_Text_'),
          Text2 = RM:loadAnimation('s04_1_p012_m02_Text_'),
          Text3 = RM:loadAnimation('s04_1_p012_m03_Text_'),
        },
        transitionTrigger = {
          [1] = "timer",
          [2] = 10,
--          [1] = "waitForInput",
          gotoScene = "05_0",
        },
        drawData = {
          [1] = {
            anim = "Quit",
            x = 2320/2 - 200 + 0,
            y = 1480/2 - 200 + 320,
            xScale = 1,
            yScale = 1,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,

            tween = {8, {
                x = 2320/2 - 200,
                y = 1480/2 - 200 + 270,
                xScale = .9,
                yScale = .9,
                alpha = 1,
                }, "out-quad"
            },
          },
          [2] = {
            anim = "Box1",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken
          },
          [3] = {
            anim = "Text1",
            x =  0,
            y =  270,
            alpha = 0, 
			tween = {1, {  alpha = 1 }, "in-expo" }, 
          },

          
         


          [4] = {
            anim = "Box2",alpha=0,red=boxDarken,green=boxDarken,blue=boxDarken,
            alpha = 0, tween = {3, { alpha = boxAlpha }, "in-expo" },

          },
    
          [5] = {
            anim = "Text2",
            x =  0,
            y =  270,
            alpha = 0, tween = {3, { alpha = 1 }, "in-expo" },
          },

          [6] = {
            anim = "Box3",alpha=0,red=boxDarken,green=boxDarken,blue=boxDarken,
            alpha = 0, tween = {7, { alpha = boxAlpha }, "in-expo" },
          },
		  [7] = {
            anim = "Text3",
            x =  0,
            y =  0,
            alpha = 0, tween = {5, { alpha = 1 }, "in-expo" },
          },
          [8] = {
            anim = "Box4",alpha=0,red=boxDarken,green=boxDarken,blue=boxDarken,
            alpha = 0, tween = {10, { alpha = 1 }, "in-expo" },
			},
		
          [9] = {
            anim = "Zero",
            x = 2320/2 - 200 + 0,
            y = 1480/2 - 200 + 0,
            xScale = 1,
            yScale = 1,
            xOffset = 2320/2,
            yOffset = 1480/2,
            alpha = 1,

            tween = {8, {
                x = 2320/2 - 200,
                y = 1480/2 - 200+800,
                xScale = 2,
                yScale = 2,
                alpha = 0,
                }, "out-quad"
            },
          },
        },
      },
    }, 
  },
}
