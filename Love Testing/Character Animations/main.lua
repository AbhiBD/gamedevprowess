function love.load()
    player = {}
    player.x = 400
    player.y = 200
    player.speed = 5
    player.sprite = love.graphics.newImage('sprites/char.png')
    background = love.graphics.newImage('sprites/background.png')
    backgroundproperties = {}
    backgroundproperties.scale = 6.3
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
    love.graphics.scale(backgroundproperties.scale, backgroundproperties.scale)
    love.graphics.draw(background,0,0)
    love.graphics.scale(1/backgroundproperties.scale,1/backgroundproperties.scale)
    love.graphics.draw(player.sprite, player.x, player.y)
end