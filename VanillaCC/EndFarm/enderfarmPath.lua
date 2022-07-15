local x=4

turtle.forward()
turtle.forward()
turtle.turnLeft()
turtle.turnLeft()
turtle.down()
turtle.place()
turtle.down()
turtle.forward()
turtle.turnLeft()
turtle.turnLeft()
for i=1,45 do 
    turtle.down()
    turtle.placeUp()
end
turtle.forward()
turtle.up()
turtle.turnLeft()
turtle.forward()
turtle.forward()
turtle.turnLeft()
turtle.forward()
turtle.turnLeft()
turtle.place()
turtle.turnLeft()
turtle.forward()
turtle.turnRight()
for i=1,4 do
    turtle.forward()
end
turtle.turnRight()
turtle.forward()
turtle.turnRight()
turtle.place()
turtle.turnRight()
turtle.forward()
turtle.turnLeft()
turtle.forward()
turtle.forward()
turtle.turnLeft()


for i=1,3 do 
    turtle.select(x)
    for i=1,64 do
        turtle.back()
        turtle.place()
    end
    x=x+1
end
turtle.select(1)
for i=1,4 do 
    turtle.back()
    turtle.place()
end
turtle.turnLeft()
turtle.forward()
turtle.turnRight()
for i=1,196 do
    turtle.forward()
end 

for i=1,3 do 
    turtle.select(x)
    for i=1,64 do
        turtle.back()
        turtle.place()
    end
    x=x+1
end
turtle.select(1)
for i=1,4 do 
    turtle.back()
    turtle.place()
end
turtle.turnRight()
turtle.forward()
turtle.forward()
turtle.turnLeft()
for i=1,196 do
    turtle.forward()
end 

for i=1,3 do 
    turtle.select(x)
    for i=1,64 do
        turtle.back()
        turtle.place()
    end
    x=x+1
end
turtle.select(1)
for i=1,4 do 
    turtle.back()
    turtle.place()
end
--59 blocks 9 stacks slabs

turtle.up()
for i=1,196 do
    turtle.forward()
end 
turtle.forward()
turtle.select(2)
for i=1, 45 do 
    turtle.up()
    turtle.placeDown()
end

turtle.turnLeft()
turtle.forward()
turtle.forward()
turtle.turnRight()

for i=1,45 do
    turtle.down()
end
turtle.select(3)
for i=1, 45 do 
    turtle.up()
    turtle.placeDown()
end

--2 stacks 15 blocks 
-- 9 stacks slabs

turtle.turnRight()
turtle.forward()
turtle.turnRight()
turtle.back()

---should return to the og position x101 z0 y49
