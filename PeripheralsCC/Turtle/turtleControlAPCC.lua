rednet.open("left")

local SLOT_COUNT = 16
local PHONE_NUM = 20
local info = {}


if (#arg == 1) then PHONE_NUM = tonumber(arg[1]) end

function refuel()
    if(turtle.getFuelLevel() < 50) then
        print("Attempting Refuel...")
        for slot = 1, SLOT_COUNT, 1 do
            turtle.select(slot)
            if(turtle.getItemDetail(slot)["name"] ~= "minecraft:chest") then
                if(turtle.refuel(1)) then
                    return true
                end
            end
        end
    end
end

function commandSimplify(complex)
    local simple = string.gmatch(complex,'%s')
    print(simple)
end

local invPos = turtle.getSelectedSlot()
term.clear()

info[1] = os.getComputerLabel()

while true do
    local sender, message, protocol = rednet.receive()

    info[2] = vector.new(gps.locate())

    if protocol == "come" then
        refuel()
        shell.run("SummonAPCC", message[1], message[2], message[3])
        rednet.send(PHONE_NUM, "arrived")
    elseif message == "forward" then
        refuel()
        turtle.forward()
    elseif message == "back" then
        refuel()
        turtle.back()
    elseif message == "turnLeft" then
        refuel()
        turtle.turnLeft()
    elseif message == "turnRight" then
        refuel()
        turtle.turnRight()
    elseif message == "up" then
        refuel()
        turtle.up()
    elseif message == "down" then 
        refuel()
        turtle.down()
    elseif message == "mine" then
        refuel()
        turtle.dig()
    elseif message == "mineUp" then
        refuel()
        turtle.digUp()
    elseif message == "mineDown" then
        refuel()
        turtle.digDown()
    elseif message == "place" then
        refuel()
        turtle.place()
    elseif message == "placeUp" then
        refuel()
        turtle.placeUp()
    elseif message == "placeDown" then
        refuel()
        turtle.placeDown()
    elseif message == "attack" then
        turtle.attack()
    elseif message == "switch" then
        turtle.equipRight()
    elseif message == 'refuel' then
        turtle.refuel()
    elseif message == 'terminal' then 
        local senderId, message, protocol = rednet.receive()
        local progStatus = false
        if (fs.exists(message) == true or fs.exists(message..'.lua') == true) then 
            rednet.send(PHONE_NUM, 'IDE')
            shell.run(message)
        elseif (fs.exists(message) ~= true or fs.exists(message..'.lua') ~= true) then
            if (fs.exists(commandSimplify(message)) == true or fs.exists(commandSimplify(message)..'.lua') == true) then
                rednet.send(PHONE_NUM, 'IDE')
                shell.run(message)
            elseif (fs.exists(commandSimplify(message)) ~= true or fs.exists(commandSimplify(message)..'.lua') ~= true) then
                rednet.send(PHONE_NUM, 'DNE')
            end
        end 
    elseif message == "invLeft" then 
        if invPos ~= 1 then
            invPos = invPos -1 
            turtle.select(invPos)
        elseif invPos == 1 then
            invPos = 16 
            turtle.select(invPos)
        end
    elseif message == "invRight" then 
        invPos = invPos + 1
        if (invPos > 16) then 
            invPos = 1
        end
        turtle.select(invPos)
    elseif message == "info" then
        invArray = {}
        for i= 1, 16 do 
            local data = turtle.getItemDetail(i)
            if (data == nil) then 
                invArray[i] = (' ')
            elseif (data ~= nil) then 
                invArray[i] = (string.gsub(string.reverse(string.sub(string.reverse(data.name), 1, string.find(string.reverse(data.name),":")-1)),"_"," ")) --name here 
            end
        end 
        info[3] = invArray
        invArrayAmmt = {}
        for i= 1, 16 do 
            local data = turtle.getItemDetail(i)
            if (data == nil) then 
                invArrayAmmt[i] = (' ')
            elseif (data ~= nil) then 
                invArrayAmmt[i] = (data.count)
            end
        end 
        info[4] = invArrayAmmt
        info[5] = turtle.getSelectedSlot()
        info[6] = turtle.getFuelLevel()
        rednet.send(PHONE_NUM, info, "info")
    end
end
