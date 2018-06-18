local RM = require "resourceManager.resourceManager"

local stateMain = {}


function stateMain:init()
  RM.prefix = ""
  self.titleBG = RM:loadAnimation("assets/GUI/Title_screen_")
  self.titleBG.data:play()
  self.titleBG.data:setLooping()

  self.menuGUI = RM:loadAnimation("assets/GUI/title_buttons_")

  self.bgPos = {x = 0, y = 0}
  self.guiAlpha = 1


  self.sm = SM:new()
  local sm = self.sm

  self.sm:add("logo", 
    {
      enter = function()
        stateMain.bgPos.x, stateMain.bgPos.y = 0, 0
        stateMain.guiAlpha = 1
        if FuckTheMainMenu then
          Gamestate.switch(stateVN)
        end
      end,

      update = function(self, dt)
        if input:pressed("systemStart") then
          sm:switch("transition")
        end
      end,

      draw = function(self) 
        love.graphics.printf("Press start", 0, H - 200, W, 'center')
      end,
    })


  self.sm:add("transition", 
    {
      enter = function (self)
        self.text = "Press start"
        self.textY = H - 200 -- TODO: tween the start text up, together with the logo
        Sound:play("End_Ex_Sister")

        HUMPTimer.tween(0.5, stateMain, {guiAlpha = 0}, "out-quad", function() self.text = nil end)

        HUMPTimer.tween(1.5, stateMain.bgPos, {y = -1480}, "out-quad", 
          function()
            HUMPTimer.tween(0.5, stateMain, {guiAlpha = 1}, "out-quad", function() sm:switch("main") end)
          end)
      end,

      update = function(self, dt) 
        self.textY = stateMain.bgPos.y + H - 200
      end,

      draw = function(self)
        if self.text then
          love.graphics.printf(self.text, 0, self.textY, W, 'center')
        else
          stateMain.menuGUI.data:loveDraw(x, y, r, sx, sy, 200, 200)
        end
      end,
    })


  self.sm:add("main",
    {
      update = function(self, dt)
        if input:pressed("comboUp") then
          Gamestate.switch(stateVN, "RESETPLZ") --Hack

        elseif input:pressed("systemBack") or input:pressed("comboDown") then
          love.event.quit()

        end
      end,

      draw = function(self)
        stateMain.menuGUI.data:loveDraw(x, y, r, sx, sy, 200, 200)
--        love.graphics.printf("space/a - Start Battle\ng/right shoulder - Start VN\nx/back - Exit game", 0, H - 200, W, 'center')  
      end,
    })
end


function stateMain:enter()
  Sound:muteMusic()

  self.sm:switch("logo")
end

function stateMain:leave()
  Sound:muteMusic()
end


function stateMain:update(dt)
  self.titleBG.data:update(dt)

  self.sm:update(dt)
end

function stateMain:draw()
  self.titleBG.data:loveDraw(self.bgPos.x, self.bgPos.y, r, sx, sy, 200, 200) 

  love.graphics.setColor(1, 1, 1, self.guiAlpha)
  self.sm:draw()
  love.graphics.setColor(1, 1, 1, 1)
end



return stateMain