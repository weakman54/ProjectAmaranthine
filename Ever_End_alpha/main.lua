



function love.load(arg)
  -- BOILERPLATE vvvvvvvvvvv
  love.graphics.setNewFont(48)

  if arg[#arg] == "-debug" then
    love.graphics.print("Debug Load...")
    love.graphics.present()
    require("mobdebug").start() 
  end

  love.graphics.print("Loading...", 150, 100)
  love.graphics.present()
  -- BOILERPLATE ^^^^^^^^


end


function love.update(dt)

end


function love.draw()
  
end


function love.keypressed(key)
  if key == "escape" then
    love.event.quit()

  elseif key == "" then

  end
end






















