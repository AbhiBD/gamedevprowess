-- Player movement: 

-- initialise the player table, such as its position values and the speed in which it moves

function love.load()
    player = {}
    player.x = 400
    player.y = 200
    player.speed = 5
end

-- the direction of the movement corresponds to an arrow key
-- love.keyboard.isDown("<direction>") used in an if statement can be used to check if a key is pressed

function love.update(dt)

    -- use a constant*dt instead of using player.speed, to make the speed constant over varying frame rates
    -- for e.g 120*dt makes sure that a character moves the same distance no matter the fps 
    -- for e.g 3 pixels per frame at 20fps, means the character moves 60 pixels per second
    -- 3 pixels per frame at 60 fps, means the character moves 180 pixels per second

    if love.keyboard.isDown("right") then
        player.x = player.x + player.speed
    end
    if love.keyboard.isDown("left") then
        player.x = player.x - player.speed
    end
    if love.keyboard.isDown("up") then
        player.y = player.y - player.speed
    end
    if love.keyboard.isDown("down") then
        player.y = player.y + player.speed
    end
end

-- used to make the character (a simple circle)

function love.draw()
    love.graphics.circle('fill', player.x, player.y, 50)
end