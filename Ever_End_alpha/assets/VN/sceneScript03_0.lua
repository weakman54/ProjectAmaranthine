

local RM = require 'resourceManager.resourceManager'


RM.prefix = "assets/"
local Gas  = RM:loadAnimation("FX/Gas_")


RM.prefix = 'assets/VN/scene03_0_midFightScene/'

local background = RM:loadAnimation('inside_robot_flipped_')
local background_blur = RM:loadAnimation('inside_robot_blur_flipped_')

-- The Original images are now called flipped here in code because we use the flipped image files as the standard background.
local background_flipped = RM:loadAnimation('inside_robot_')
local background_blur_flipped = RM:loadAnimation('inside_robot_')


local boxAlpha = 0.8
local boxDarken = 0.1

local FlashbackBG = RM:loadAnimation('FlashbackBG_')

local InputBox = RM:loadAnimation('Input_Box_')



return {
  [1] = {
	bg = {
	  anim = background,
	},
	moments = {
	  [1] = {
		sounds = {
		},
		music = {"Ambient Cicada"},
		anims = {
		  EEnd_Quit = RM:loadAnimation('s03_0_p001_m01_End_Quit_'),
		  Box = RM:loadAnimation('s03_0_p001_m01_Box_'),
		  Gas = Gas,
		},
		transitionTrigger = {
		  [1] = "timer",--"waitForInput",
		  [2] = 1.2,
		},
		drawData = {
		  [1] = {
			anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,
		  },
		  [2] = {
			anim = "EEnd_Quit",
		  },
		  [3] = {
			anim = "Gas",
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
		  Quit = RM:loadAnimation('s03_0_p002_m01_Quit_'),
		  Box = RM:loadAnimation('s03_0_p002_m01_Box_'),
		  Gas = Gas,
		  InputBox = InputBox, TextBox = RM:loadAnimation('s03_0_p002_m01_Text_'),
		},
		transitionTrigger = {
		  [1] = "waitForInput",
		},
		drawData = {
		  [1] = {
			anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,
		  },
		  [2] = {
			anim = "Quit",
		  },
		  [3] = {
			anim = "Gas",
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
		  Quit = RM:loadAnimation('s03_0_p002_m01_Quit_'),
		  Box = RM:loadAnimation('s03_0_p002_m01_Box_'),
		  Gas = Gas,
		  InputBox = InputBox, TextBox = RM:loadAnimation('s03_0_p002_m02_Text_'),
		},
		transitionTrigger = {
		  [1] = "waitForInput",
		},
		drawData = {
		  [1] = {
			anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,
		  },
		  [2] = {
			anim = "Quit",
		  },
		  [3] = {
			anim = "Gas",
		  },
		  [4] = {
            anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [5] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
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
		  EEnd = RM:loadAnimation('s03_0_p003_m01_End_'),
		  Box = RM:loadAnimation('s03_0_p003_m01_Box_'),
		  Gas = Gas,
		},
		transitionTrigger = {
		  [1] = "timer",--"waitForInput",
		  [2] = 2.0
		},
		drawData = {
		  [1] = {
			anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,
		  },
		  [2] = {
			anim = "EEnd",
		  },
		  [3] = {
			anim = "Gas",
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
		  Quit_Zero = RM:loadAnimation('s03_0_p004_m01_Quit_Zero_'),
		  Quit_Zero2 = RM:loadAnimation('s03_0_p004_m02_Quit_Zero_'),
		  Box = RM:loadAnimation('s03_0_p004_m01_Box_'),
		  Gas = Gas,
		},
		transitionTrigger = {
		  [1] = "timer",--"waitForInput",
		  [2] = 2.0
		},
		drawData = {
		  [1] = {
			anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,




		  },
		  [2] = {
			anim = "Quit_Zero2",
		  },
		  [3] = {
			anim = "Quit_Zero",
			alpha = 1, tween = {.7, {alpha = 0}, "in-quart"}
		  },
		  [4] = {
			anim = "Gas",
		  },
		},
	  },
	},
  },
  [5] = {
	bg = {
	  anim = background,
	},
	moments = {
	  [1] = {
		sounds = {
		},
		anims = {
		  Box = RM:loadAnimation('s03_0_p005_m01_Box_'),
		  EEnd = RM:loadAnimation('s03_0_p005_m01_End_'),
		  Gas = Gas,
		  InputBox = InputBox, TextBox = RM:loadAnimation('s03_0_p005_m01_Text_'),
		},
		transitionTrigger = {
		  [1] = "waitForInput",
		},
		drawData = {
		  [1] = {
			anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,




		  },
		  [2] = {
			anim = "EEnd",
			x = 2320/2 - 200 - 90,
			y = 1480/2 - 200 - 10,
			xScale = 1.1,
			yScale = 1.1,
			xOffset = 2320/2,
			yOffset = 1480/2,
			tween = {3, {x = 2320/2 - 200, y = 1480/2 - 200, xScale = 1, yScale = 1}, "in-linear"}
		  },
		  [3] = {
			anim = "Gas",
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
	  anim = background_blur,
	},
	moments = {
	  [1] = {
		sounds = {
		},
		anims = {
		  Box = RM:loadAnimation('s03_0_p006_m01_Box_'),
		  EEnd = RM:loadAnimation('s03_0_p006_m01_End_'),
		  Gas = Gas,
		  InputBox = InputBox, TextBox = RM:loadAnimation('s03_0_p006_m01_Text_'),
		},
		transitionTrigger = {
		  [1] = "waitForInput",

		},
		drawData = {
		  [1] = {
			anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,




		  },
		  [2] = {
			anim = "EEnd",
		  },
		  [3] = {
			anim = "Gas",
		  },
		  [4] = {
            anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [5] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
		  },
		},
	  },
	},
  },
  [7] = {
	bg = {
	  anim = background,
	},
	moments = {
	  [1] = {
		sounds = {
		},
		anims = {
		  Black = RM:loadAnimation('black'),
		},
		transitionTrigger = {
		  [1] = "timer",--"waitForInput",
		  [2] = .2
		},
		drawData = {
		  [1] = {
			anim = "Black"
		  },
		},
	  },
	  [2] = {
		sounds = {
		  {"Kick Echo"},
		},
		anims = {
		  Box = RM:loadAnimation('s03_0_p007_m01_Box_'),
		  EEnd = RM:loadAnimation('s03_0_p007_m01_End_'),
		  Quit = RM:loadAnimation('s03_0_p007_m01_Quit_'),
		  Sword = RM:loadAnimation('s03_0_p007_m01_Sword_'),
		  Gas = Gas,
		},
		transitionTrigger = {
		  [1] = "timer",--"waitForInput",
		  [2] = 1.0
		},
		drawData = {
		  [1] = {
			anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,
		  },
		  [2] = {
			anim = "EEnd",
			x = 0,
			y = 0,

			tween = {2.4, {x =- 100, y =- 40}, "out-quart"}
		  },
		  [3] = {
			anim = "Quit",

			x = 0,
			y = 0,

			tween = {2.4, {x =- 75, y =- 30}, "out-quart"}
		  },
		  [4] = {
			anim = "Sword",
			x = 0,
			y = 0,
			tween = {3, {x = 40, y = -25}, "out-quart"}
		  },
		  [5] = {
			anim = "Gas",
		  },
		},
	  },
	},
  },
  [8] = {
	bg = {
	  anim = background,
	},
	moments = {
	  [1] = {
		sounds = {
		  {"Player Fall by Kick"},
		},
		music = {"Ambient Cicada", {fade = {duration = 3, rate = -1/3}}},
		anims = {
		  EEnd = RM:loadAnimation('s03_0_p008_m01_End_'),
		  Box = RM:loadAnimation('s03_0_p008_m01_Box_'),
		  Gas = Gas,
		},
		transitionTrigger = {
		  [1] ="waitForInput",
		},
		drawData = {
		  [1] = {
			anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,
		  },
		  [2] = {
			anim = "EEnd",
			x = 100,
			y = -50,
			tween = {2, {x = 0, y = 0}, "out-expo"}
		  },
		  [3] = {
			anim = "Gas",
		  },
		},
	  },
	},
  },
  [10] = {
	bg = {
	  anim = background_blur,
	},
	moments = {
	  [1] = {
		sounds = {
		  {"Flash Back IN", {delay = 0.1}},
		},
		anims = {
		  Box = RM:loadAnimation('s03_0_p010_m01_Box_'),
		  Effect = RM:loadAnimation('s03_0_p010_m01_Effect_'),
		  Zero = RM:loadAnimation('s03_0_p010_m01_Zero_'),
		  White = RM:loadAnimation('white'),
		  Gas = Gas,
		},
		transitionTrigger = {
		  [1] = "timer",--"waitForInput",
		  [2] = 2.7
		},
		drawData = {
		  [1] = {
			anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,
		  },
		  [2] = {
			anim = "Effect",
		  },
		  [3] = {
			anim = "Zero",
			xScale = 0.9,
			yScale = 0.9,
			xOffset = 2320/2,
			yOffset = 1480/2,
			x = 2320/2 - 200,
			y = 1480/2 - 200,

			tween = {3.0, {xScale = 1.1, yScale = 1.1}, "in-linear"}
		  },
		  [4] = {
			anim = "Gas",
			alpha = 1,

			tween = {3.0, {alpha = 0}, "in-cubic"}
		  },
		  [5] = {
			anim = "White",
			alpha = 0,

			tween = {3.0, {alpha = 1}, "in-cubic"}
		  },
		},
	  },
	},
  },
  [12] = {
	bg = {
	  anim = FlashbackBG,
	},
	moments = {
	  [1] = {
		sounds = {
		},
		music = {"stop"},
		anims = {
		  EEnd = RM:loadAnimation('s03_0_p012_m01_End_'),
		  White = RM:loadAnimation('white'),
		},
		transitionTrigger = {
		  [1] = "timer",--"waitForInput",
		  [2] = 3.0
		},
		drawData = {
		  [1] = {
			anim = "EEnd",            
		  },
		  [2] = {
			anim = "White",
			alpha = 1,
			tween = {3.0, {alpha = 0}, "in-cubic"}
		  },
		},
	  },
	},
  },
  [13] = {
	bg = {
	  anim = FlashbackBG,
	},
	moments = {
	  [1] = {
		sounds = {
		},
		anims = {
		  EEnd = RM:loadAnimation('s03_0_p012_m01_End_'),
		  Zero = RM:loadAnimation('s03_0_p013_m01_Zero_'),
		},
		transitionTrigger = {
		  [1] = "timer", [2] = 3.0,
		},
		drawData = {
		  [1] = {
			anim = "EEnd",
			alpha = 1, tween = {3.0, {alpha = 0}, "in-linear"}
		  },
		  [2] = {
			anim = "Zero",
			alpha = 0, tween = {3.0, {alpha = 1}, "in-linear"}
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
		},
		anims = {
		  Zero = RM:loadAnimation('s03_0_p013_m01_Zero_'),

		  Soldier = RM:loadAnimation('s03_0_p014_m01_Soldier_'),
		  Zero2 = RM:loadAnimation('s03_0_p014_m01_Zero_'),
		},
		transitionTrigger = {
		  [1] = "timer", [2] = 3.0,
		},
		drawData = {
		  [1] = {
			anim = "Zero",
			alpha = 1, tween = {3.0, {alpha = 0}, "in-linear"}
		  },
		  [2] = {
			anim = "Soldier",
			alpha = 0, tween = {3.0, {alpha = 1}, "in-linear"}

		  },
		  [3] = {
			anim = "Zero2",
			alpha = 0, tween = {3.0, {alpha = 1}, "in-linear"}

		  },
		},
	  },
	},
  },
  [15] = {
	bg = {
	  anim = FlashbackBG,
	},
	moments = {
	  [1] = {
		sounds = {
		},
		anims = {
		  Soldier = RM:loadAnimation('s03_0_p014_m01_Soldier_'),
		  Zero2 = RM:loadAnimation('s03_0_p014_m01_Zero_'),

		End_Zero = RM:loadAnimation('s03_0_p015_m01_End_Zero_'),
		},
		transitionTrigger = {
		  [1] = "timer", [2] = 3.0,
		},
		drawData = {
		  [1] = {
			anim = "Soldier",
			alpha = 1, tween = {3.0, {alpha = 0}, "in-linear"}

		  },
		  [2] = {
			anim = "Zero2",
			alpha = 1, tween = {3.0, {alpha = 0}, "in-linear"}

		  },
		  [3] = {
			anim = "End_Zero",
			alpha = 0, tween = {3.0, {alpha = 1}, "in-linear"}

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
		  {"Flashback Slash"},
		},
		anims = {
		End_Zero = RM:loadAnimation('s03_0_p015_m01_End_Zero_'),

		  Soldier_End = RM:loadAnimation('s03_0_p016_m01_Soldier_End_'),
		},
		transitionTrigger = {
		  [1] = "timer", [2] = 3.0,
		},
		drawData = {
		  [1] = {
			anim = "End_Zero",
			alpha = 1, tween = {3.0, {alpha = 0}, "in-linear"}

		  },
		  [2] = {
			anim = "Soldier_End",
			alpha = 0, tween = {3.0, {alpha = 1}, "in-linear"}
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
		},
		anims = {
		  Soldier_End = RM:loadAnimation('s03_0_p016_m01_Soldier_End_'),

		  Zero = RM:loadAnimation('s03_0_p017_m01_Zero_'),
		},
		transitionTrigger = {
		  [1] = "timer", [2] = 3.0,
		},
		drawData = {
		  [1] = {
			anim = "Soldier_End",
			alpha = 1, tween = {3.0, {alpha = 0}, "in-linear"}
		  },
		  [2] = {
			anim = "Zero",
			alpha = 0, tween = {3.0, {alpha = 1}, "in-linear"}

		  },
		},
	  },
	},
  },
  [18] = {
	bg = {
	  anim = FlashbackBG,
	},
	moments = {
	  [1] = {
		sounds = {
		},
		anims = {
		  Zero = RM:loadAnimation('s03_0_p017_m01_Zero_'),

		  EEnd = RM:loadAnimation('s03_0_p018_m01_End_'),
		},
		transitionTrigger = {
		  [1] = "timer", [2] = 3.0,
		},
		drawData = {
		  [1] = {
			anim = "Zero",
			alpha = 1, tween = {3.0, {alpha = 0}, "in-linear"}

		  },
		  [2] = {
			anim = "EEnd",
			alpha = 0, tween = {3.0, {alpha = 1}, "in-linear"}

		  },
		},
	  },
	},
  },
  [19] = {
	bg = {
	  anim = FlashbackBG,
	},
	moments = {
	  [1] = {
		sounds = {
		},
		anims = {
		  EEnd = RM:loadAnimation('s03_0_p018_m01_End_'),


		End2 = RM:loadAnimation('s03_0_p019_m01_End_'),
		},
		transitionTrigger = {
		  [1] = "timer", [2] = 3.0,
		},
		drawData = {
		  [1] = {
			anim = "EEnd",
			alpha = 1, tween = {3.0, {alpha = 0}, "in-linear"}

		  },
		  [2] = {
			anim = "End2",
			alpha = 0, tween = {3.0, {alpha = 1}, "in-linear"}

		  },
		},
	  },
	},
  },
  [20] = {
	bg = {
	  anim = background_blur,
	},
	moments = {
	  [1] = {
		sounds = {
		  {"Flash Back OUT"},
		},
		anims = {
		  Box = RM:loadAnimation('s03_0_p020_m01_Box_'),
		  Effect = RM:loadAnimation('s03_0_p020_m01_Effect_'),
		  Zero = RM:loadAnimation('s03_0_p020_m01_Zero_'),
		  White = RM:loadAnimation('white'),
		  Gas = Gas,
		},
		transitionTrigger = {
		  [1] = "timer",--"waitForInput",
		  [2] = .75--1.27
		},
		drawData = {
		  [1] = {
			anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,
		  },
		  [2] = {
			anim = "Effect",
		  },
		  [3] = {
			anim = "Zero",
			xScale = .9,
			yScale = .9,
			xOffset = 2320/2,
			yOffset = 1480/2,
			x = 2320/2 - 200 ,
			y = 1480/2 - 200,
		  },
		  [4] = {
			anim = "White",
			alpha = 1,
			tween = {1.2, {alpha = 0}, "out-cubic"}
		  },
		  [5] = {
			anim = "Gas",
			alpha = 0,
			tween = {1.2, {alpha = 1}, "out-cubic"}
		  },
		},
	  },
	  [2] = {
		sounds = {
		},
		anims = {
		  Box = RM:loadAnimation('s03_0_p020_m01_Box_'),
		  Effect = RM:loadAnimation('s03_0_p020_m01_Effect_'),
		  Zero = RM:loadAnimation('s03_0_p020_m01_Zero_'),
		  Gas = Gas,
		},
		transitionTrigger = {
		  [1] = "timer",--"waitForInput",
		  [2] = .75--1.27
		},
		drawData = {
		  [1] = {
			anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,
		  },
		  [2] = {
			anim = "Effect",
		  },
		  [3] = {
			anim = "Zero",
			xOffset = 2320/2,
			yOffset = 1480/2,
			x = 2320/2 - 200 ,
			y = 1480/2 - 200,
			xScale = .9,
			yScale = .9,
			tween = {1.2, {y = 1480/2 - 200 -75, xScale = 1.2, yScale = 1.2}, "out-cubic"}
		  },
		  [4] = {
			anim = "Gas",
		  },
		},
	  },
	},
  },
  [21] = {
	bg = {
	  anim = background_blur,
	},
	moments = {
	  [1] = {
		sounds = {
		  {"Intense Moment"}
		},
		anims = {
		  Zero = RM:loadAnimation('s03_0_p021_m01_Zero_'),
		  Box = RM:loadAnimation('s03_0_p021_m01_Box_'),
		  Gas = Gas,
		},
		transitionTrigger = {
		  [1] = "timer", [2] = 2.0,
		},
		drawData = {
		  [1] = {
			anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,
		  },
		  [2] = {
			anim = "Zero",
		  },
		  [3] = {
			anim = "Gas",
		  },
		},
	  },
	},
  },
  [22] = {
	bg = {
	  anim = background_blur,
	},
	moments = {
	  [1] = {
		sounds = {
		},
		anims = {
		  Quit = RM:loadAnimation('s03_0_p022_m01_Quit_'),
		  Box = RM:loadAnimation('s03_0_p022_m01_Box_'),
		  Gas = Gas,
		},
		transitionTrigger = {
		  [1] = "timer", [2] = 2.0,

		},
		drawData = {
		  [1] = {
			anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,
		  },
		  [2] = {
			anim = "Quit",
		  },
		  [3] = {
			anim = "Gas",
		  },
		},
	  },
	},
  },
  [23] = {
	bg = {
	  anim = background_blur,
	},
	moments = {
	  [1] = {
		sounds = {
		},
		anims = {
		  Zero = RM:loadAnimation('s03_0_p023_m01_Zero_'),
		  Box = RM:loadAnimation('s03_0_p023_m01_Box_'),
		  Gas = Gas,
		},
		transitionTrigger = {
		  [1] = "timer", [2] = 2.0,

		},
		drawData = {
		  [1] = {
			anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,
		  },
		  [2] = {
			anim = "Zero",
		  },
		  [3] = {
			anim = "Gas",
		  },
		},
	  },
	},
  },
  [24] = {
	bg = {
	  anim = background_blur,

	},
	moments = {
	  [1] = {
		sounds = {
		  {"Miss"},
		},
		anims = {
		  Zero = RM:loadAnimation('s03_0_p024_m01_Zero_'),
		  Box = RM:loadAnimation('s03_0_p024_m01_Box_'),
		  Gas = Gas,
		},
		transitionTrigger = {
		  [1] = "timer", [2] = 2.0,

		},
		drawData = {
		  [1] = {
			anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,
		  },
		  [2] = {
			anim = "Zero",
		  },
		  [3] = {
			anim = "Gas",
		  },
		},
	  },
	},
  },
  [25] = {
	bg = {
	  anim = background_blur,

	},
	moments = {
	  [1] = {
		sounds = {
		},
		anims = {
		  Zero = RM:loadAnimation('s03_0_p025_m01_Zero_'),
		  Box = RM:loadAnimation('s03_0_p025_m01_Box_'),
		  Gas = Gas,
		},
		transitionTrigger = {
		  [1] = "timer", [2] = 2.0,

		},
		drawData = {
		  [1] = {
			anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,
		  },
		  [2] = {
			anim = "Zero",
		  },
		  [3] = {
			anim = "Gas",
		  },
		},
	  },
	},
  },
  [26] = {
	bg = {
	  anim = background_blur,
	},
	moments = {
	  [1] = {
		sounds = {
		  {"High Dodge"}
		},
		anims = {
		  Zero = RM:loadAnimation('s03_0_p026_m01_Zero_'),
		  Box = RM:loadAnimation('s03_0_p026_m01_Box_'),
		  Gas = Gas,
		},
		transitionTrigger = {
		  [1] = "timer", [2] = 2.0,

		},
		drawData = {
		  [1] = {
			anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,
		  },
		  [2] = {
			anim = "Zero",
		  },
		  [3] = {
			anim = "Gas",
		  },
		},
	  },
	},
  },
  -- Scrapped
  --  [27] = {
  --    bg = {
  --      anim = background_blur,
  --    },
  --    moments = {
  --      [1] = {
  --        sounds = {
  --        },
  --        anims = {
  --          Zero = RM:loadAnimation('s03_0_p027_m01_Zero_'),
  --          Box = RM:loadAnimation('s03_0_p027_m01_Box_'),
  --          Gas = Gas,
  --        },
  --        transitionTrigger = {
  --          [1] = "waitForInput",
  --        },
  --        drawData = {
  --          [1] = {
  --            anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,
  --          },
  --          [2] = {
  --            anim = "Zero",
  --          },
  --          [3] = {
  --            anim = "Gas",
  --          },
  --        },
  --      },
  --    },
  --  },
  [28] = {
	bg = {
	  anim = background_blur,
	},
	moments = {
	  [1] = {
		sounds = {
		  {"Switch Break"}
		},
		anims = {
		  Zero = RM:loadAnimation('s03_0_p028_m01_Zero_'),
		  Box = RM:loadAnimation('s03_0_p028_m01_Box_'),
		  Gas = Gas,
		},
		transitionTrigger = {
		  [1] = "timer", [2] = 2.0,

		},
		drawData = {
		  [1] = {
			anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,
		  },
		  [2] = {
			anim = "Zero",
		  },
		  [3] = {
			anim = "Gas",
		  },
		},
	  },
	},
  },
  [29] = {
	bg = {
	  anim = background_blur,
	},
	moments = {
	  [1] = {
		sounds = {
		},
		anims = {
		  Quit_End = RM:loadAnimation('s03_0_p029_m01_Quit_End_'),
		  Box = RM:loadAnimation('s03_0_p029_m01_Box_'),
		  Gas = Gas,
		},
		transitionTrigger = {
		  --          [1] = "waitForInput",
		  [1] = "timer",
		  [2] = 2.8,
		},
		drawData = {
		  [1] = {
			anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,
		  },
		  [2] = {
			anim = "Quit_End",
			-- plz separate quit and end
			-- I want to do a thing where end comes in from left and quit from right to create the illusion of rotation. Sorta like how pokemon battles start
		  },
		  [3] = {
			anim = "Gas",
			alpha = 1,
			tween = {2, {alpha = 0}},
		  },
		},
	  },
	},
  },
  [30] = {
	bg = {
	  anim = background_blur,
	},
	moments = {
	  [1] = {
		sounds = {
		},
		anims = {
		  Box = RM:loadAnimation('s03_0_p030_m01_Box_'),
		  Quit = RM:loadAnimation('s03_0_p030_m01_Quit_'),
		  InputBox = InputBox, TextBox = RM:loadAnimation('s03_0_p030_m01_Text_'),
		},
		transitionTrigger = {
		  [1] = "waitForInput",
		},
		drawData = {
		  [1] = {
			anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,
		  },
		  [2] = {
			anim = "Quit",
			xOffset = 2320/2,
			yOffset = 1480/2,
			x = 2320/2 - 200 -10,
			y = 1480/2 - 200 +25,
			xScale = .95,
			yScale = .95,
			tween = {5, {x = 2320/2 - 200, y = 1480/2 - 200 ,xScale = 1, yScale = 1}, "out-linear"}
		  },
		  [3] = {
            anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [4] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
		  },
		},
	  },
	},
  },
  [31] = {
	bg = {
	  anim = background_blur,
	},
	moments = {
	  [1] = {
		sounds = {
		},
		anims = {
		  Quit = RM:loadAnimation('s03_0_p031_m01_Quit_'),
		  Box = RM:loadAnimation('s03_0_p031_m01_Box_'),
          InputBox = InputBox,
		},
		transitionTrigger = {
		  [1] = "timer",--"waitForInput",
		  [2] = 1.8
		},
		drawData = {
		  [1] = {
			anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,
		  },
		  [2] = {
			anim = "Quit",
			xOffset = 2320/2,
			yOffset = 1480/2,
			x = 2320/2 - 200,
			y = 1480/2 - 200 + 400,
			xScale = 1.4,
			yScale = 1.4,
			tween = {1.8, {y = 1480/2 - 200 ,xScale = 1, yScale = 1}, "in-out-cubic"}
		  },
          [3] = {
            anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
          },
		},
	  },
	  [2] = {
		sounds = {
		},
		anims = {
		  Quit = RM:loadAnimation('s03_0_p031_m01_Quit_'),
		  Box = RM:loadAnimation('s03_0_p031_m01_Box_'),
		},
		transitionTrigger = {
		  [1] = "waitForInput",
		},
		drawData = {
		  [1] = {
			anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,
		  },
		  [2] = {
			anim = "Quit",
		  },
		},
	  },
	},
  },
  [32] = {
	bg = {
	  anim = background,
	},
	moments = {
	  [1] = {
		sounds = {
		},
		anims = {
		  Black = RM:loadAnimation('black'),
		},
		transitionTrigger = {
		  [1] = "timer",--"waitForInput",
		  [2] = .1
		  --          [2] = .363
		},
		drawData = {
		  [1] = {
			anim = "Black"
		  },
		},
	  },
	  [2] = {
		sounds = {
		  {"Kick"},
		  {"Damage3"},
		},

		anims = {
		  Box = RM:loadAnimation('s03_0_p032_m01_Box_'),
		  EEnd = RM:loadAnimation('s03_0_p032_m01_End_'),
		  Quit = RM:loadAnimation('s03_0_p032_m01_Quit_'),
		},
		transitionTrigger = {
		  [1] = "timer",--"waitForInput",
		  [2] = 0.5,
		},
		drawData = {
		  [1] = {
			anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,
		  },
		  [2] = {
			anim = "EEnd",
			x = 0,
			y = 0,
			tween = {0.5, {x = -50, y = 50}, "out-quart"},
		  },
		  [3] = {
			anim = "Quit",
			x = 0,
			y = 0,
			tween = {0.5, {x = 50, y = -50}, "out-quart"},
		  },
		},
	  },
	  [3] = {
		sounds = {
		},
		--        music = {"End_Ex_Soldier"},
		anims = {
		  Box = RM:loadAnimation('s03_0_p032_m01_Box_'),
		  EEnd = RM:loadAnimation('s03_0_p032_m01_End_'),
		  Quit = RM:loadAnimation('s03_0_p032_m01_Quit_'),
		},
		transitionTrigger = {
		  [1] = "timer",        
		  [2] = 0.5,

		  --          [1] = "waitForInput",
		},
		drawData = {
		  [1] = {
			anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,
		  },
		  [2] = {
			anim = "EEnd",
			x = -50,
			y = 50,
		  },
		  [3] = {
			anim = "Quit",
			x = 50,
			y = -50,
		  },
		},
	  },
	},
  },
  [33] = {
	bg = {
	  anim = background_blur,
	},
	moments = {
	  [1] = {
		sounds = {
		},
		music = {"End_Ex_Soldier"},
		anims = {
		  Quit = RM:loadAnimation('s03_0_p033_m01_Quit_'),
		  Box = RM:loadAnimation('s03_0_p033_m01_Box_'),
		},
		transitionTrigger = {
		  [1] = "timer", [2] = 2.0,

		},
		drawData = {
		  [1] = {
			anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,
		  },
		  [2] = {
			anim = "Quit",
		  },
		},
	  },
	},
  },
  [34] = {
	bg = {
	  anim = background_blur,
	},
	moments = {
	  [1] = {
		sounds = {
		},
		anims = {
		  Box = RM:loadAnimation('s03_0_p034_m01_Box_'),
		  EEnd = RM:loadAnimation('s03_0_p034_m01_End_'),
		  InputBox = InputBox, TextBox = RM:loadAnimation('s03_0_p034_m01_Text_'),
		},
		transitionTrigger = {
		  [1] = "timer", [2] = 2.0,
		},
		drawData = {
		  [1] = {
			anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,
		  },
		  [2] = {
			anim = "EEnd",
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
	  anim = background_blur,
	},
	moments = {
	  [1] = {
		sounds = {
			{"Sword Slide"},
		},
		anims = {
		  Box = RM:loadAnimation('s03_0_p035_m01_Box_'),
		  EEnd = RM:loadAnimation('s03_0_p035_m01_End_'),
		  Sword = RM:loadAnimation('s03_0_p035_m01_Sword_'),
		},
		transitionTrigger = {
		  [1] = "timer", [2] = 1.0,
		},
		drawData = {
		  [1] = {
			anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,
		  },
		  [2] = {
			anim = "EEnd",
			x = 0, y = - 700,
		  },
		  [3] = {
			anim = "Sword",
		    x = 0, y = 1000, tween = {1, {x=0, y = -700}, "out-cubic"}
	--		x = 1500, y = -700, tween = {1, {x=0, y = -700}, "out-cubic"}
		  },
		},
	  },
	  [2] = {
		sounds = {
		},
		anims = {
		  Box = RM:loadAnimation('s03_0_p035_m01_Box_'),
		  Box2 = RM:loadAnimation('s03_0_p035_m03_Box_'),
		  EEnd = RM:loadAnimation('s03_0_p035_m01_End_'),
		  Sword = RM:loadAnimation('s03_0_p035_m01_Sword_'),
		},
		transitionTrigger = {
		  [1] = "timer", [2] = 2.5,
		},
		drawData = {
		  [1] = {
			anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,
			x = 0, y = 0, tween = {2.5, {y = 700, alpha = 0}, "in-out-quart"}

		  },
		  [2] = {
			anim = "Box2",alpha=0,red=boxDarken,green=boxDarken,blue=boxDarken,
			tween = {2.0, {alpha = boxAlpha}, "in-quart"}

		  },
		  [3] = {
			anim = "EEnd",
			x = 0, y = - 700, tween = {2.5, {y = 0}, "in-out-quart"}
		  },
		  [4] = {
			anim = "Sword",
			x = 0, y = -700, tween = {2.5, {x=0, y = 0}, "in-out-quart"}
		  }
		},
	  },
	  [3] = {
		sounds = {
		},
		anims = {
		  EEnd = RM:loadAnimation('s03_0_p035_m02_End_'),

		End2 = RM:loadAnimation('s03_0_p035_m03_End_'),
		  Box = RM:loadAnimation('s03_0_p035_m03_Box_'),
		},
		transitionTrigger = {
		  [1] = "timer", [2] = 2.0,
		},
		drawData = {
		  [1] = {
			anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,
		  },
		  [2] = {
			anim = "EEnd",
		  },
		  [3] = {
			anim = "End2",
			alpha = 0, tween = {.5, {alpha = 1}, "in-quart"}
		  },
		},
	  },
	},
  },
  [38] = {
	bg = {
	  anim = background_blur,

	},
	moments = {
	  [1] = {
		sounds = {
		},
		anims = {
		End_Zero = RM:loadAnimation('s03_0_p038_m01_End_Zero_'),
		  Box = RM:loadAnimation('s03_0_p038_m01_Box_'),
		},
		transitionTrigger = {
		  [1] = "timer", [2] = 1.5,
		},
		drawData = {
		  [1] = {
			anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,
		  },
		  [2] = {
			anim = "End_Zero",
		  },
		},
	  },
	},
  },
  [39] = {
	bg = {
	  anim = background_blur,
	},
	moments = {
	  [1] = {
		sounds = {
		},
		anims = {
		  Zero = RM:loadAnimation('s03_0_p039_m01_Zero_'),
		  Box = RM:loadAnimation('s03_0_p039_m01_Box_'),
		},
		transitionTrigger = {
		  [1] = "timer", [2] = 2.0,
		},
		drawData = {
		  [1] = {
			anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,
		  },
		  [2] = {
			anim = "Zero",
		  },
		},
	  },
	},
  },
  [40] = {
	bg = {
	  anim = background_blur,
	},
	moments = {
	  [1] = {
		sounds = {
		},
		anims = {
		EndSurprised = RM:loadAnimation('s03_0_p040_m01_End_'),
		EndNod = RM:loadAnimation('s03_0_p041_m01_End_'),
		  Box = RM:loadAnimation('s03_0_p040_m01_Box_'),
          InputBox = InputBox,
		},
		transitionTrigger = {
		  [1] = "waitForInput",
		},
		drawData = {
		  [1] = {
			anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,
		  },
		  [2] = {
			anim = "EndSurprised",
		  },
          [3] = {
            anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
          },
		},
	  },
	  [2] = {
		sounds = {
		},
		anims = {
		EndSurprised = RM:loadAnimation('s03_0_p040_m01_End_'),
		EndNod = RM:loadAnimation('s03_0_p041_m01_End_'),
		  Box = RM:loadAnimation('s03_0_p040_m01_Box_'),
		},
		transitionTrigger = {
		  [1] = "timer",--"waitForInput",
		  [2] = .3
		},
		drawData = {
		  [1] = {
			anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,
		  },
		  [2] = {
			anim = "EndSurprised",
			alpha = 1,
			tween = {.1, {alpha = 0}, "in-quart"}
		  },
		  [3] = {
			anim = "EndNod",
			alpha = 0,
			tween = {.05, {alpha = 1}, "in-quart"}
		  },
		},
	  },
	  [3] = {
		sounds = {
		},
		anims = {
		EndNod = RM:loadAnimation('s03_0_p041_m01_End_'),
		EndNormal = RM:loadAnimation('s03_0_p041_m02_End_'),
		  Box = RM:loadAnimation('s03_0_p040_m01_Box_'),
		},
		transitionTrigger = {
		  [1] = "timer", [2] = 0.8,
		},
		drawData = {
		  [1] = {
			anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,
		  },
		  [2] = {
			anim = "EndNod",
			alpha = 1,
			tween = {.1, {alpha = 0}, "in-quart"}
		  },
		  [3] = {
			anim = "EndNormal",
			alpha = 0,
			tween = {.05, {alpha = 1}, "in-quart"}
		  },
		},
	  },
	},
  },
  [42] = {
	bg = {
	  anim = background_flipped,
	},
	moments = {
	  [1] = {
		sounds = {
		},
		anims = {
		  Quit_End = RM:loadAnimation('s03_0_p042_m01_Quit_End_'),
		  Box = RM:loadAnimation('s03_0_p042_m01_Box_'),
		  InputBox = InputBox, TextBox = RM:loadAnimation('s03_0_p042_m01_Text_'),
		},
		transitionTrigger = {
		  [1] = "waitForInput",
		},
		drawData = {
		  [1] = {
			anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,
		  },
		  [2] = {
			anim = "Quit_End",
			x = 150,
			y = 0, 
			tween = {0.7, {x = 0, y = 0}, "out-quad" },
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
		  Quit_End = RM:loadAnimation('s03_0_p042_m01_Quit_End_'),
		  Box = RM:loadAnimation('s03_0_p042_m01_Box_'),
		  InputBox = InputBox, TextBox = RM:loadAnimation('s03_0_p042_m02_Text_'),
		},
		transitionTrigger = {
		  [1] = "waitForInput",
		},
		drawData = {
		  [1] = {
			anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,
		  },
		  [2] = {
			anim = "Quit_End",
		  },
		  [3] = {
            anim = "TextBox", 
			}, 
			[4] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
		  },
		},
	  },
	},
  },
  [43] = {
	bg = {
	  anim = background_blur,
	},
	moments = {
	  [1] = {
		sounds = {
		},
		anims = {
		  Quit = RM:loadAnimation('s03_0_p043_m01_Quit_'),
		  Box = RM:loadAnimation('s03_0_p043_m01_Box_'),
		  InputBox = InputBox, TextBox = RM:loadAnimation('s03_0_p043_m01_Text_'),
		},
		transitionTrigger = {
		  [1] = "waitForInput",
		},
		drawData = {
		  [1] = {
			anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,
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
	  anim = background_blur,
	},
	moments = {
	  [1] = {
		sounds = {
		},
		anims = {
		  Box = RM:loadAnimation('s03_0_p044_m01_Box_'),
		  EEnd = RM:loadAnimation('s03_0_p044_m01_End_'),
		  InputBox = InputBox, TextBox = RM:loadAnimation('s03_0_p044_m01_Text_'),
		},
		transitionTrigger = {
		  [1] = "waitForInput",
		},
		drawData = {
		  [1] = {
			anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,
		  },
		  [2] = {
			anim = "EEnd",
		  },
		  [3] = {
            anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [4] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
		  },
		},
	  },
	},
  },
  [45] = {
	bg = {
	  anim = background_blur,
	},
	moments = {
	  [1] = {
		sounds = {
		},
		anims = {
		  Quit = RM:loadAnimation('s03_0_p045_m01_Quit_'),
		  Box = RM:loadAnimation('s03_0_p045_m01_Box_'),
		  InputBox = InputBox, TextBox = RM:loadAnimation('s03_0_p045_m01_Text_'),
		},
		transitionTrigger = {
		  [1] = "waitForInput",
		},
		drawData = {
		  [1] = {
			anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,
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
  [46] = {
	bg = {
	  anim = background_blur,
	},
	moments = {
	  [1] = {
		sounds = {
		},
		anims = {
		  Box = RM:loadAnimation('s03_0_p046_m01_Box_'),
		  EEnd = RM:loadAnimation('s03_0_p046_m01_End_'),
		  InputBox = InputBox, TextBox = RM:loadAnimation('s03_0_p046_m01_Text_'),
		},
		transitionTrigger = {
		  [1] = "waitForInput",
		},
		drawData = {
		  [1] = {
			anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,
		  },
		  [2] = {
			anim = "EEnd",
		  },
		  [3] = {
            anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [4] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
		  },
		},
	  },
	},
  },
  [47] = {
	bg = {
	  anim = background_blur,
	},
	moments = {
	  [1] = {
		sounds = {
		},
		anims = {
		  Quit = RM:loadAnimation('s03_0_p047_m01_Quit_'),
		  Box = RM:loadAnimation('s03_0_p047_m01_Box_'),
		  InputBox = InputBox, TextBox = RM:loadAnimation('s03_0_p047_m01_Text_'),
		},
		transitionTrigger = {
		  [1] = "waitForInput",
		},
		drawData = {
		  [1] = {
			anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,
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
	  [48] = {
	bg = {
	  anim = background_blur,
	},
	moments = {
	  [1] = {
		sounds = {
		},
		anims = {
		  Quit = RM:loadAnimation('s03_0_p048_m01_Quit_'),
		  Box = RM:loadAnimation('s03_0_p047_m01_Box_'),
		  InputBox = InputBox, TextBox = RM:loadAnimation('s03_0_p047_m02_Text_'),
		},
		transitionTrigger = {
		  [1] = "waitForInput",
		},
		drawData = {
		  [1] = {
			anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,
		  },
		  [2] = {
			anim = "Quit",
		  },
		  [3] = {
            anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [4] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
		  },
		},
	  },
	  --      [2] = {
	  --        sounds = {
	  --        },
	  --        anims = {
	  --          bg = RM:loadAnimation('s03_0_p047_m02_bg_'),
	  --          Box = RM:loadAnimation('s03_0_p047_m02_Box_'),
	  --        },
	  --        transitionTrigger = {
	  --          [1] = "waitForInput",
	  --        },
	  --        drawData = {
	  --          [1] = {
	  --            anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,
	  --
	  --
	  -- 
	  --
	  --          },
	  --          [2] = {
	  --            anim = "bg",
	  --          },
	  --        },
	  --      },
	  --      [3] = {
	  --        sounds = {
	  --        },
	  --        anims = {
	  --          Box = RM:loadAnimation('s03_0_p047_m03_Box_'),
	  --        },
	  --        transitionTrigger = {
	  --          [1] = "waitForInput",
	  --        },
	  --        drawData = {
	  --          [1] = {
	  --            anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,
	  --
	  --
	  -- 
	  --
	  --          },
	  --        },
	  --      },
	},
  },
  [49] = {
	bg = {
	  anim = background_blur,
	},
	moments = {
	  [1] = {
		sounds = {
		},
		anims = {
		  Quit = RM:loadAnimation('s03_0_p049_m01_Quit_'),
		  InputBox = InputBox, TextBox = RM:loadAnimation('s03_0_p049_m01_Text_'),
		},
		transitionTrigger = {
		  [1] = "waitForInput",
		},
		drawData = {
		  [1] = {
			anim = "Quit",
			x = 0,
			y = 10,
			tween = {1, {y = 0}, "out-quart"}
		  },
		  [2] = {
            anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [3] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
		  },
		},
	  },
	},
  },



  -- Caution:
  -- Panel order after this is changed so the panel numbering mismatch filenames.
  -- The correct panel order: p050, p054, p055, p056, p057, p053
  -- This note is only to avoid confusion
  

  [50] = {
	bg = {
	  anim = background_flipped,
	},
	moments = {
	  [1] = {
		sounds = {
		},
		anims = {
		  EEnd = RM:loadAnimation('s03_0_p050_m01_End_'),
		  Box = RM:loadAnimation('s03_0_p050_m01_Box_'),
		},
		transitionTrigger = {
		  		  [1] = "timer", [2] = 1.0,

		},
		drawData = {
		  [1] = {
			anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,
		  },
		  [2] = {
			anim = "EEnd",
			x = 20,
			y = 5,
			tween = {1.5, {x = 0}, "out-linear"}
		  },
		},
	  },
	  [2] = {
		sounds = {
		},
		anims = {
		  Box = RM:loadAnimation('s03_0_p050_m02_Box_'),
		  EEnd = RM:loadAnimation('s03_0_p050_m01_End_'),
		End2 = RM:loadAnimation('s03_0_p050_m02_End_'),
		  Hand = RM:loadAnimation('s03_0_p050_m02_Hand_'),
		  InputBox = InputBox, TextBox = RM:loadAnimation('s03_0_p050_m02_Text_'),
		},
		transitionTrigger = {
		  [1] = "waitForInput",
		},
		drawData = {
		  [1] = {
			anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,
		  },
		  [2] = {
			anim = "EEnd",

			alpha = 1,
			tween = {.2, {alpha = 0}, "in-quart"}
		  },
		  [3] = {
			anim = "End2",
			alpha = 0,
			tween = {.1, {alpha = 1}, "in-quart"}
		  },
		  [4] = {
			anim = "Hand",
			x = 0,
			y = 500,
			tween = {.15, {y = 0}, "in-linear"}
		  },
		  [5] = {
            anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [6] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
		  },
		},
	  },
	},
  },
  --  [49] = {
  --    bg = {
  --      anim = background_blur,
  --    },
  --    moments = {
  --      [1] = {
  --        sounds = {
  --        },
  --        anims = {
  --          Quit = RM:loadAnimation('s03_0_p051_m01_Quit_'),
  --          Box = RM:loadAnimation('s03_0_p051_m01_Box_'),
  --        },
  --        transitionTrigger = {
  --          [1] = "waitForInput",
  --        },
  --        drawData = {
  --          [1] = {
  --            anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,
  --
  --
  -- 
  --
  --          },
  --          [2] = {
  --            anim = "Quit",
  --            xScale = .9,
  --            yScale = .9,
  --            xOffset = 2320/2,
  --            yOffset = 1480/2,
  --            x = 2320/2 - 200,
  --            y = 1480/2 - 200,
  ----            tween = {1, { y = 1480/2 - 200,     }, "in-linear"} -- TODO: Make it possible to have multiple tweens with different timing 
  --            tween = {3, { xScale = 1, yScale = 1}, "out-quad"}
  --          },
  --        },
  --      },
  --    },
  --  },
  --  [50] = {
  --    bg = {
  --      anim = background_blur,
  --    },
  --    moments = {
  --      [1] = {
  --        sounds = {
  --        },
  --        anims = {
  --          Quit = RM:loadAnimation('s03_0_p052_m01_Quit_'),
  --          Box = RM:loadAnimation('s03_0_p052_m01_Box_'),
  --        },
  --        transitionTrigger = {
  --          [1] = "waitForInput",
  --        },
  --        drawData = {
  --          [1] = {
  --            anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,
  --
  --
  -- 
  --
  --          },
  --          [2] = {
  --            anim = "Quit",
  --          },
  --        },
  --      },
  --    },
  --  },




  [53] = { -- 54 rearranged
	bg = {
	  anim = background_blur,
	},
	moments = {
	  -- TODO: Add moment here with text and sword
	  [1] = {
		sounds = {
		},
		anims = {
		  Quit = RM:loadAnimation('s03_0_p054_m01_Quit1_'),
		  Sword = RM:loadAnimation('s03_0_p054_m01_QuitSword_'),
		  Box = RM:loadAnimation('s03_0_p054_m01_Box_'),
		  InputBox = InputBox, TextBox = RM:loadAnimation('s03_0_p054_m01_Text_'),
		},
		transitionTrigger = {
		  [1] = "waitForInput", -- HACK: to show text, should be show text, then drop sword next mooment
		  --          [1] = "timer",--"waitForInput",
		  --          [2] = .82
		},
		drawData = {
		  [1] = {
			anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,




		  },
		  [2] = {
			anim = "Quit",
		  },
		  [3] = {
			anim = "Sword",
			x = 30,
			y = -500,
			tween = {.75, {x = 0, y = 0}, "in-bounce"}
		  },
		  [4] = {
            anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [5] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
		  },
		},
	  },
	},
  },
  [54] = { --55 rearranged
	bg = {
	  anim = background_blur,
	},
	moments = {
	  [1] = {
		sounds = {
		},
		anims = {
		  Quit = RM:loadAnimation('s03_0_p055_m01_Quit_'),
		  Box = RM:loadAnimation('s03_0_p055_m01_Box_'),
		  InputBox = InputBox, TextBox = RM:loadAnimation('s03_0_p055_m01_Text_'),
		},
		transitionTrigger = {
		  "waitForInput",
		},
		drawData = {
		  [1] = {
			anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,
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
  [55] = { --56 rearranged
	bg = {
	  anim = background_blur,
	},
	moments = {
	  [1] = {
		sounds = {
		},
		anims = {
		  Quit = RM:loadAnimation('s03_0_p056_m01_Quit_'),
		  Box = RM:loadAnimation('s03_0_p056_m01_Box_'),
		},
		transitionTrigger = {
          [1] = "timer", [2] = 1.0, -- [1] = "waitForInput",
		},
		drawData = {
		  [1] = {
			anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,
		  },
		  [2] = {
			anim = "Quit",
		  },
		},
	  },
	},
  },
  [56] = { -- 57, just rearranged
	bg = {
	  anim = background_blur,
	},
	moments = {
	  [1] = {
		sounds = {
		},
		anims = {
		  Quit = RM:loadAnimation('s03_0_p057_m01_Quit_'),
		  Box = RM:loadAnimation('s03_0_p057_m01_Box_'),
		  InputBox = InputBox, TextBox = RM:loadAnimation('s03_0_p057_m01_Text_'),
		  White = RM:loadAnimation('white'),
		},
		transitionTrigger = {
		  [1] = "waitForInput",
		},
		drawData = {
		  [1] = {
			anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,





		  },
		  [2] = {
			anim = "Quit",
		  },
		  [3] = {
            anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [4] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
		  },
		  [5] = {
			anim = "White",
			alpha = .8,	tween = {1.4, {alpha = 0}, "out-quint"}
		  },
		},
	  },
	},
  },
  [57] = { -- 53 rearranged
	bg = {
	  anim = background_blur,
	},
	moments = {
	  [1] = {
		sounds = {
		},
		anims = {
		  EEnd = RM:loadAnimation('s03_0_p053_m01_End_'),
		  Box = RM:loadAnimation('s03_0_p053_m01_Box_'),
		  InputBox = InputBox, TextBox = RM:loadAnimation('s03_0_p053_m01_Text_'),
		},
		transitionTrigger = {
		  [1] = "waitForInput",
		  enemyToGoTo = "enemyQuit3",
		},
		drawData = {
		  [1] = {
			anim = "Box", alpha = boxAlpha, red = boxDarken, green = boxDarken, blue = boxDarken,




		  },
		  [2] = {
			anim = "EEnd",
		  },
		  [3] = {
            anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [4] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},
		  },
		},
	  },
	},
  },
}
