
-- Love games use three fundamental functions: love.load declares major variables, love.update alters those variables, 
-- love.draw outputs those variables

Main Love functions:

Load Function: 

-- preinitialisation of the game window (bootstrap)
-- this is where you specify the global variables, window size and preliminaries

function love.load()

end

Update Function:

-- the default frame time (dt - delta time) in love is 60 times per second (60fps)
-- calls the function every frame of the game

function love.update(dt)

end

Draw Function:

-- outputs any graphics specified within the function
-- similar to love.update as it is called every frame

function love.draw()

end

Love Graphics Basics:

-- all go inside the draw function
-- all use the fundamental love.graphics.<functionname>(<variables>) structure

-- uses the following code to print variables

    love.graphics.print(<variable>)

-- check wiki for all functions 