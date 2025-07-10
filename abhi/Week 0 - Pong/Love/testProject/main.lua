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
end


-- EXAMPLE 2

