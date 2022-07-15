local location = {}

if (#arg == 3) then
    location[1] = arg[1]
    location[2] = arg[2]
    location[3] = arg[3]
end

function getOrientation()
    loc1 = vector.new(gps.locate(2, false))
    if not turtle.forward() then
        for j=1 ,6 do
            if not turtle.forward() then
            turtle.dig()
            else break end
        end
    end
    loc2 = vector.new(gps.locate())
    heading = loc2 - loc1
    return ((heading.x + math.abs(heading.x) * 2) + (heading.z + math.abs(heading.z) * 3))
end -- -x =1 -z = 2 +x = 3 +z = 4

function turnSouth()
    local heading
    while heading ~= 4 do
        heading = getOrientation()
        if heading == 1 then
            turtle.turnRight()
        end
        if heading == 2 then
            turtle.turnRight()
            turtle.turnRight()
        end
        if heading == 3 then
            turtle.turnLeft()
        end
    end
end

function toPointPrecise(x, y, z)
    local errX
    local errY
    local errZ
    local resetFlag = false

    local posX, posY, posZ = gps.locate()

    errX = posX - x
    errY = posY - y
    errZ = posZ - z

    turnSouth()

    if errX == 0 then
        resetFlag = true
    end

    while errY ~= 0 or errX ~= 0 or errZ ~= 0 do
        posX, posY, posZ = gps.locate()
        errY = posY - y
        if errY > 0 then
            turtle.down()
        end
        if errY < 0 then
            turtle.up()
        end
        while errZ ~= 0 do
            posX, posY, posZ = gps.locate()
            errZ = posZ - z
            if errZ > 0 then
                turtle.back()
            end
            if errZ < 0 then
                turtle.forward()
            end
        end
        if errX ~= 0 then
            turtle.turnLeft()
        end
        while errX ~= 0 do
            posX, posY, posZ = gps.locate()
            errX = posX - x
            if errX > 0 then
                turtle.back()
            end
            if errX < 0 then
                turtle.forward()
            end
        end
    end

    if resetFlag then
        turtle.turnLeft()
    end
end

toPointPrecise(location[1], location[2], location[3])