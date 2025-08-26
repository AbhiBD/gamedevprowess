function love.load()
    love.window.setMode(720, 480, { resizable = true, vsync = 1, minwidth = 300, minheight = 300 })

-- Importing Libraries uses the Syntax => <variable to call the library> = require 'filepath/file'

    anim8 = require 'libraries/anim8'
    love.graphics.setDefaultFilter('nearest', 'nearest')

    sti     = require 'libraries/sti'
    gameMap = sti('maps/testMap.lua')

    camera  = require 'libraries/camera'
    cam     = camera()

    -- Standard Player Properties

    player = {}
    player.x = 400
    player.y = 200
    player.speed = 1.5
    player.sprite = love.graphics.newImage('sprites/char.png')
    player.spritesheet = love.graphics.newImage('sprites/spritesheet1.png')
    player.grid = anim8.newGrid(68, 72, player.spritesheet:getWidth(), player.spritesheet:getHeight())

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

    cam:lookAt(player.x, player.y)

    local w = love.graphics.getWidth()
    local h = love.graphics.getHeight()

    if cam.x < w / 2 then
        cam.x = w / 2
    end

    if cam.y < h / 2 then
        cam.y = h / 2
    end

    local mapW = gameMap.width * gameMap.tilewidth

    local mapH = gameMap.height * gameMap.tileheight

    if cam.x > (mapW - w / 2) then
        cam.x = ((mapW - w / 2))
    end

    if cam.y > (mapH - h / 2) then
        cam.y = (mapH - h / 2)
    end
end

function love.draw()
    cam:attach()

    gameMap:drawLayer(gameMap.layers["Ground"])
    gameMap:drawLayer(gameMap.layers["Flora"])
    gameMap:drawLayer(gameMap.layers["Signs"])
    player.state:draw(player.spritesheet, player.x, player.y, nil, 1, nil, 34, 36)

    cam:detach()
end
