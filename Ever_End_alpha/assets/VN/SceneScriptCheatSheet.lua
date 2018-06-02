-- Boxes with the box alpha etc:

            anim = "Box",alpha=boxAlpha,red=boxDarken,green=boxDarken,blue=boxDarken,

-- Timer types:

          [1] = "waitForInput", --[1] = "timer", [2] = 1.0,
          [1] = "timer", [2] = 1.0, -- [1] = "waitForInput",

-- Default everything tween

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

-- Text box fixes

Text = RM
TextBox = RM

anim = "Text"
anim = "TextBox"

TextBox = RM
InputBox = InputBox, TextBox = RM

            anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"},
            anim = "TextBox", alpha = 0, tween = {.1, {alpha = 1 }, "in-linear"}, }, [4] = {anim = "InputBox", alpha = 0, tween = {.1, {alpha = 1}, "in-linear"},

}, }, [4]
^ Replace the number to relevant moment


-- Name fixes because editor bullshit:

End =
EEnd =

anim = "End",
anim = "EEnd",

End_Quit =
EEnd_Quit =



anim = "End_Quit",
anim = "EEnd_Quit",

End_Zero =
EEnd_Zero = 

anim = "End_Zero",
anim = "EEnd_Zero",




1. make sure boxes exist
2. Make sure boxes transparent
3. make sure right boxes blurry





Tween types:

linear
quad
cubic
quart
quint
expo

bounce
elastic