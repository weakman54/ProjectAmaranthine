

local scenes
local curSceneI = 1
local curTextI = 1





function love.load(arg)
  if arg[#arg] == "-debug" then require("mobdebug").start() end

  love.graphics.setNewFont(48)
  love.graphics.print("Loading...", 150, 100)
  love.graphics.present()

  scenes = {
    {
      bg = love.graphics.newImage("assets/Scene1.png"),
      texts = {
        {text = "Scene1, text1", x = 100, y = 500},
        {text = "Scene1, text2", x = 150, y = 150},
      },
    },
    {
      bg = love.graphics.newImage("assets/Scene2.png"),
      texts = {
        {text = "asldkfj", x = 100, y = 100},
        {text = "herp derp", x = 105, y = 100},
        {text = "carp", x = 100, y = 105},
      },
    },
  }
end


function love.update(dt)

end


function love.draw()
  local curScene = scenes[curSceneI]
  local curText = curScene.texts[curTextI]

  love.graphics.setColor(255, 255, 255)
  love.graphics.draw(curScene.bg, x, y, r, sx, sy, 200, 200)

  love.graphics.setColor(000, 000, 000)
  love.graphics.print(curText.text, curText.x, curText.y, r, sx, sy, 0, 0)
end


function moveForward()
  local curScene = scenes[curSceneI]

  curTextI = curTextI + 1

  if curTextI > #curScene.texts then
    curTextI = 1
    curSceneI = curSceneI + 1

    if curSceneI > #scenes then
      curSceneI = 1
    end
  end
end


function love.keypressed(key)
  if key == "escape" then
    love.event.quit()

  elseif key == "space" then
    moveForward()

  end
end
