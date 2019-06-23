function love.load()

end

function love.update(dt)

end

function love.draw()
  love.graphics.setColor(0, 0, 255/255, 1)
  love.graphics.rectangle('fill', 200, 400, 200, 100)
  love.graphics.setColor(255/255, 0, 0, 1)
  love.graphics.circle('fill', 100, 100, 100)
end