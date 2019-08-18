function love.load()
    button = {}
    button.x = 200
    button.y = 200
    button.size = 50

    score = 0
    timer = 10
    gameState = 1

    myFont = love.graphics.newFont(40)
end

function love.update(dt)
    if gameState == 2 then
        if timer > 0 then
            timer = timer - dt
        end

        if timer < 0 then
            timer = 0
            gameState = 1
        end
    end
end

function love.draw()
    if gameState == 2 then
        love.graphics.setColor(255, 0, 0)
        love.graphics.circle('fill', button.x, button.y, button.size)
    else
        love.graphics.printf('Click to start...', 0, love.graphics.getHeight() / 2, love.graphics.getWidth(), 'center')
    end

    love.graphics.setFont(myFont)
    love.graphics.setColor(1, 1, 1)
    love.graphics.print('Score: ' .. score)
    love.graphics.print('Timer: ' .. math.ceil(timer), love.graphics.getWidth()-200, 0)
end

function love.mousepressed(x, y, btn, istouch)
    if btn == 1 and gameState == 2 then
        if distanceBetween(button.x, button.y, love.mouse.getX(), love.mouse.getY()) < button.size then
            score = score + 1
            button.x = math.random(button.size, love.graphics.getWidth() - button.size)
            button.y = math.random(button.size + 40, love.graphics.getHeight() - button.size)
        end
    end
    if gameState == 1 then
        gameState = 2
        score = 0
        timer = 10
    end
end

function distanceBetween(x1, y1, x2, y2)
    return math.sqrt((y2 - y1) ^ 2 + (x2 - x1) ^ 2)
end
