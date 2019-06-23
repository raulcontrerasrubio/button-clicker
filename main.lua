function love.load()
  button = {}
  button.x = 200
  button.y = 200
  button.size = 50
  button.isInside = function (x, y) return math.sqrt((button.y - y)^2 + (button.x - x)^2) <= button.size end

  score = 0
  timer = 0

  myFont = love.graphics.newFont(40)

end

function love.update(dt)

end

function love.draw()
  love.graphics.setColor(255/255, 0, 0, 1)
  love.graphics.circle('fill', button.x, button.y, button.size)

  love.graphics.setFont(myFont)
  love.graphics.setColor(255/255, 255/255, 255/255, 1)
  love.graphics.print('Score:' .. score)
end

function love.mousepressed(x, y, b)
  if b == 1 and button.isInside(x, y) then
      score = score + 1
  end
end