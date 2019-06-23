config = {}
config.GAME_READY = 1
config.GAME_STARTED = 2
config.TIMER = 2

function distanceBetween(x1, y1, x2, y2)
  return math.sqrt((y2 - y1)^2 + (x2 - x1)^2)
end

function love.load()
  button = {}
  button.x = 200
  button.y = 200
  button.size = 50
  button.isInside = function (x, y) return distanceBetween(button.x, button.y, x, y) <= button.size end
  button.jump = function ()
    button.size = math.random(25, 60)
    button.x = math.random(button.size, love.graphics.getWidth() - button.size)
    button.y = math.random(button.size, love.graphics.getHeight() - button.size)
  end

  score = 0
  timer = CONFIG.TIMER
  gameState = CONFIG.INITIAL_STATE

  myFont = love.graphics.newFont(40)
end

function love.update(dt)
  if gameState == config.GAME_STARTED then
    if timer > 0 then
      timer = timer - dt
    end
    if timer < 0 then
      timer = 0
      gameState = config.GAME_READY
    end
  end
end

function love.draw()
  if gameState == config.GAME_STARTED then
    love.graphics.setColor(255/255, 0, 0, 1)
    love.graphics.circle('fill', button.x, button.y, button.size)
  end

  love.graphics.setFont(myFont)
  love.graphics.setColor(255/255, 255/255, 255/255, 1)
  love.graphics.print('Score: ' .. score)
  love.graphics.print('Time: ' .. math.ceil(timer), 300, 0)
end

function love.mousepressed(x, y, b)
  if b == 1 and gameState == config.GAME_STARTED and button.isInside(love.mouse.getX(), love.mouse.getY()) then
    score = score + 1
    button.jump()
  end
  if b == 1 and gameState == config.GAME_READY then
    score = 0
    timer = config.TIMER
    gameState = config.GAME_STARTED
  end
end