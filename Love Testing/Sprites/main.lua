function love.load()
    player = {}
    player.x = 400
    player.y = 200
    player.speed = 5
    player.sprite = love.graphics.newImage('Sprites/annie.png')
    background = love.graphics.newImage('Sprites/leaguemap.png')
end

function love.update(dt)

    if love.keyboard.isDown("d") then
        player.x = player.x + player.speed
    end
    if love.keyboard.isDown("a") then
        player.x = player.x - player.speed
    end
    if love.keyboard.isDown("w") then
        player.y = player.y - player.speed
    end
    if love.keyboard.isDown("s") then
        player.y = player.y + player.speed
    end
end

function love.draw()
    love.graphics.scale(10,10)
    love.graphics.draw(background, 0, 0)
    love.graphics.draw(player.sprite, player.x, player.y, nil, 0.1, 0.1)
end