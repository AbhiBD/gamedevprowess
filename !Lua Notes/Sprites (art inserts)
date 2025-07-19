function love.load()
    player = {}
    player.x = 400
    player.y = 200
    player.speed = 5

-- all sprites, be it the background or character need to be declared in the love.load function
-- love.graphics.newImage('<filedirectory>') is the format used
-- make sure the file containing the sprites is withing the game folder

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

-- background is drawn first
-- placing it at 0, 0 aligns it perfectly within the window as it aligns using the upper left corner of the image

    love.graphics.draw(background, 0, 0)

-- player is drawn overtop the background otherwise it wouldnt be seen

    love.graphics.draw(player.sprite, player.x, player.y)
end