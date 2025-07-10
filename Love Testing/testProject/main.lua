-- EXAMPLE 1

-- Adds 1 to variable number every frame

function love.load()
    number = 0
end

function love.update(dt)
    number = number + 1
end

function love.draw()
    love.graphics.print(number)
    love.graphics.setColor(204/255, 102/255, 255/255)
end

-- setColor follows the structure (Red, Green, Blue, Alpha) 
-- we divide by 255 to convert from 0-255 to 0-1 to fit the love format
-- (32 byte colour depth to 1 byte colour depth)

-- EXAMPLE 2

function love.load()
    target = {}
    target.x = 100
    target.y = 100
    target.radius = 50

    score = 0
    timer = 0

    gameFont = love.graphics.newFont(40)
end

function love.update(dt)

end

function love.draw()
    love.graphics.setColor(1,0,0, 0.7)
    love.graphics.circle('fill', target.x, target.y, target.radius)


    love.graphics.setColor(1, 1, 1)
    love.graphics.setFont(gameFont)
    love.graphics.print(score,0,0)

end

function love.mousepressed(x, y, button, istouch, press)
    if button == 1 then
        if distanceBetween(x,y,target.x,target.y) <= target.radius then
            score = score + 1
        end
    end
end

function distanceBetween(x1, y1, x2, y2)
    return math.sqrt((x2-x1)^2 + (y2-y1)^2)
end