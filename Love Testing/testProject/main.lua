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
end

function love.update(dt)

end

function love.draw()
    love.graphics.setColor(1,0,0, 0.2)
    love.graphics.circle('fill', target.x, target.y, target.radius)
end

