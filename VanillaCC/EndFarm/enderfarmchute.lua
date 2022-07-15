local selection = 1
-- start at x101 y49 z0 facing outwards refuel turtle and fill inv with endbrick blocks 
function forward(f)
    for i=1,f do 
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
turtle.select(1)
turtle.turnLeft()
forward(2)
turtle.turnRight()
down(46)
forward(195)
turtle.turnRight()
back(1)
turtle.select(1)
turtle.place()
for i=1,3 do
    turtle.turnRight()
    forward(1)
    turtle.turnLeft()
    turtle.place()
end
turtle.up()
forward(6)
down(1)
loopdaloop()
for i=1,4 do 
    turtle.place()
    turtle.turnRight()
    forward(1)
    turtle.turnLeft()
end
forward(1)
turtle.up()
turtle.turnLeft()
forward(4)
loopdaloop()


for i=1,4 do 
    for i=1,40 do 
        turtle.up()
        turtle.placeDown()
    end
    forward(1)
    down(40)
    selection = selection+1
    turtle.select(selection)
end 
turtle.turnLeft()
forward(1)

for i=1,2 do 
    for i=1,3 do 
        for i=1,40 do 
            turtle.up()
            turtle.placeDown()
        end
        forward(1)
        down(40)
        selection = selection+1
        turtle.select(selection)
    end 
    turtle.turnLeft()
    forward(1)
end 

back(1)
up(1)
turtle.placeDown()
up(1)
turtle.placeDown()

for i=1,15 do 
    forward(2)
    turtle.place()
    back(1)
    turtle.place()
    back(1)
    turtle.place()
    up(1)
    turtle.placeDown()
end 
selection=selection+1
turtle.select(selection)
for i=1,15 do 
    forward(2)
    turtle.place()
    back(1)
    turtle.place()
    back(1)
    turtle.place()
    up(1)
    turtle.placeDown()
end 
selection=selection+1
turtle.select(selection)
for i=1,8 do 
    forward(2)
    turtle.place()
    back(1)
    turtle.place()
    back(1)
    turtle.place()
    up(1)
    turtle.placeDown()
end 
--10 stacks blocks  

forward(2)
turtle.turnRight()