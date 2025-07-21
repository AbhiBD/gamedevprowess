function love.load()

    love.window.setMode(800, 600, {resizable=true, vsync=1, minwidth=300, minheight=300})
    
    anim8 = require 'libraries/anim8'
    love.graphics.setDefaultFilter('nearest', 'nearest')
    
    player = {}
    player.x = 400
    player.y = 200
    player.speed = 3
    player.sprite = love.graphics.newImage('sprites/char.png')
    player.spritesheet = love.graphics.newImage('sprites/spritesheet1.png')
    player.grid = anim8.newGrid(68,72, player.spritesheet:getWidth(), player.spritesheet:getHeight())

    player.animations = {}
    player.animations.down = anim8.newAnimation(player.grid('1-4', 1), 0.15)
    player.animations.left = anim8.newAnimation(player.grid('1-4', 2), 0.15)
    player.animations.right = anim8.newAnimation(player.grid('1-4', 3), 0.15)
    player.animations.up = anim8.newAnimation(player.grid('1-4', 4), 0.15)

    background = love.graphics.newImage('sprites/pallet.png')
    backgroundproperties = {}
    backgroundproperties.scale = 3.25

    player.state = player.animations.down
 
end

function love.update(dt)

    local isMoving = false

    if love.keyboard.isDown("d") then
        player.x = player.x + player.speed
        player.animations.right:update(dt)
        player.state = player.animations.right
        isMoving = true
    end
    if love.keyboard.isDown("a") then
        player.x = player.x - player.speed
        player.animations.left:update(dt)
        player.state = player.animations.left
        isMoving = true
    end
    if love.keyboard.isDown("w") then
        player.y = player.y - player.speed
        player.animations.up:update(dt)
        player.state = player.animations.up
        isMoving = true
    end
    if love.keyboard.isDown("s") then
        player.y = player.y + player.speed
        player.animations.down:update(dt)
        player.state = player.animations.down
        isMoving = true
    end

    if isMoving == false then
        player.state:gotoFrame(1)
    end
    
end

function love.draw()
    love.graphics.draw(background,0,0,nil, backgroundproperties.scale)

    player.state:draw(player.spritesheet, player.x,player.y, nil, 2)
    
end