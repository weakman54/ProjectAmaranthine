
require "strict"


require "minimalistSoundManager"

Gamestate = require "hump.gamestate"
Timer  = require "hump.timer"
Signal = require "hump.signal"


require "enemy"
require "player"


local Animation = require "animation"
local AC = require "animationCollection"


local stateBattle = require "stateBattle"


local background



function love.load(arg)
  love.graphics.setNewFont(48)  

  if arg[#arg] == "-debug" then 
    love.graphics.print("Debugload...", 100, 100)
    love.graphics.present()
    require("mobdebug").start()
  end

  love.graphics.print("Loading...", 100, 100)
  love.graphics.present()


  enemy:initialize()
  player:initialize()
  
  
  Gamestate.registerEvents()
  Gamestate.switch(stateBattle)
  
--  bgm = love.audio.play("assets/Immortal_Feeling.flac")
end


function love.update(dt)
  love.audio.update()
  Timer.update(dt)
end


function love.draw()
end


function love.keypressed(key)
  if key == "escape" then love.event.quit() return end
end







