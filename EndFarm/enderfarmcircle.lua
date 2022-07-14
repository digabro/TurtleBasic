local wingLen = {7, 13, 17, 20, 23, 25, 27, 29, 31, 33, 34, 36, 37, 38, 40, 41, 42, 43, 44, 45, 46, 47, 48, 48, 49, 50 , 51, 51, 52, 53, 53, 54, 54, 55, 55, 56, 56, 57, 57, 58, 58, 58, 59, 59, 59, 60, 60, 60, 60, 61, 61, 61, 61, 61, 61, 62, 62, 62, 62, 62}
local wingPos = 1
local selection = 6
--start mid top of chute on one side refuel turtle fill turtle with endbrick halfslabs 
--follow turtle to fill up slabs as itll run out eventually 
--when it stops after each fourth youve got 20 seconds to refuel (will repeat 4 times for a total of 80 second wait and refill turtle)
function forward(x)
    for i=1,x do 
        turtle.forward()
    end
end 

function down(d)
    for i=1,d do 
        turtle.down()
    end
end 

function back(b)
    for i=1,b do 
        turtle.back()
    end
end 

function loopdaloop()
    turtle.turnLeft()
    turtle.turnLeft()
end

function up(b)
    for i=1,b do 
        turtle.up()
    end
end 

function downplacerep(x)
    for i=1,x do 
        forward(1)
        turtle.placeDown()
    end
    back(x)
    turtle.turnRight()
    forward(1)
    turtle.turnLeft()
end


for i=1,4 do 
    wingPos = 1
    selection = 6
    loopdaloop()
    turtle.select(1)
    for i=1,60 do 
        back(1)
        turtle.placeDown()
    end
    turtle.turnLeft()
    turtle.select(2)
    for i=1, 4 do 
        downplacerep(wingLen[wingPos])
        wingPos = wingPos+1
    end 
    turtle.select(3)
    for i=1, 2 do 
        downplacerep(wingLen[wingPos])
        wingPos = wingPos+1
    end 
    turtle.select(4)
    for i=1, 2 do 
        downplacerep(wingLen[wingPos])
        wingPos = wingPos+1
    end 
    turtle.select(5)
    for i=1, 2 do 
        downplacerep(wingLen[wingPos])
        wingPos = wingPos+1
    end 
    turtle.select(6)
    for i=1, 50 do 
        downplacerep(wingLen[wingPos])
        wingPos = wingPos+1
        selection = selection + 1
        if selection == 17 then 
            selection = 1 
            sleep(30)
        end
        turtle.select(selection)
    end 
    forward(2)
    downplacerep(60)
    downplacerep(60)
    sleep(20)
    for i=1,3 do
        turtle.refuel()
        sleep(20)
    end
    sleep(20)
end

