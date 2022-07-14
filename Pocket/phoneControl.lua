rednet.open("back")

local COMPS = {1}
local COMP_POS = 1
local COMP_NUM = COMPS[COMP_POS]
local COMP_LEN = table.getn(COMPS)

local COMMAND = nil
local ran = false
local bounds
local invStatus = 'inv'
local isAtPos = false
local isDocked = false

function infoGetInv()
    term.clear()
    term.setCursorPos(1, 1)
    rednet.send(COMP_NUM, "info")
    local sender, message, protocol = rednet.receive()
    local name = message[1]
    local location = message[2]
    local invArray = message[3]
    local invArrayAmmt = message[4]
    local invSlot = message[5]
    local fuelLevel = message[6]

    print(name)
    term.setCursorPos(15,1)
    print('Fuel:',fuelLevel)
    print('GPS:', location.x..',', location.y..',', location.z)
    print('--------------------------')

    for i = 1,16 do
        if i == invSlot then 
            print('>', '['.. invArrayAmmt[i]..']', invArray[i])
        elseif i ~= invSlot then 
            print('-', '['.. invArrayAmmt[i]..']', invArray[i])
        end
    end
    term.setCursorPos(24,19)
    print('[o]')
end

function infoGetCom1()
    term.clear()
    term.setCursorPos(1, 1)
    rednet.send(COMP_NUM, "info")
    local sender, message, protocol = rednet.receive()
    local name = message[1]
    local location = message[2]
    local invArray = message[3]
    local invArrayAmmt = message[4]
    local invSlot = message[5]
    local fuelLevel = message[6]

    print(name)
    term.setCursorPos(15,1)
    print('Fuel:',fuelLevel)
    print('GPS:', location.x..',', location.y..',', location.z)
    print('--------------------------')
    print('Move forward   [w]\nTurn left      [a]\nMove backward  [s]\nTurn right     [d]\nMove up        [space]\nMove down      [leftShift]')
    print('Mine forward   [numPad 4]\nMine up        [numPad 7]\nMine down      [numPad 1]\nPlace forward  [numPad 5]\nPlace up       [numPad 8]\nPlace down     [numPad 2]')
    term.setCursorPos(18,19)
    print('[i][p][t]')
end

function infoGetCom2()
    term.clear()
    term.setCursorPos(1, 1)
    rednet.send(COMP_NUM, "info")
    local sender, message, protocol = rednet.receive()
    local name = message[1]
    local location = message[2]
    local invArray = message[3]
    local invArrayAmmt = message[4]
    local invSlot = message[5]
    local fuelLevel = message[6]

    print(name)
    term.setCursorPos(15,1)
    print('Fuel:',fuelLevel)
    print('GPS:', location.x..',', location.y..',', location.z)
    print('--------------------------')
    print('Attack         [e]\nSwap Tools     [f]\nInv slot up    [<]\nInv slot down  [>]\nRefuel         [r]\nSummon turtle  [c]\nSwap Turtles   [\\]')
    term.setCursorPos(18,19)
    print('[i][o][t]')

end

function infoTerminal()
    term.clear()
    term.setCursorPos(1, 1)
    rednet.send(COMP_NUM, "info")
    local sender, message, protocol = rednet.receive()
    local name = message[1]
    local location = message[2]
    local invArray = message[3]
    local invArrayAmmt = message[4]
    local invSlot = message[5]
    local fuelLevel = message[6]
    local termCom
    print(name)
    term.setCursorPos(15,1)
    print('Fuel:',fuelLevel)
    print('GPS:', location.x..',', location.y..',', location.z)
    print('--------------------------')
    print('>')
    term.setCursorPos(21,19)
    print('[Exit]')
    term.setCursorPos(3,4)
    termCom = read()
    if (termCom == 'exit' or termCom == 'Exit') then 
        invStatus = 'inv'
        infoGetInv()
    elseif(termCom ~= 'exit' or termCom ~= 'Exit') then 
        rednet.send(COMP_NUM,'terminal')
        sleep(.1)
        rednet.send(COMP_NUM, termCom)
        local sender, message, protocol = rednet.receive()
        if (message == 'IDE') then 
            print('Running:',termCom)
        elseif (message == 'DNE') then
            print('Program',termCom,'does not exist')
        end
    end
end 

if (#arg == 1) then COMP_NUM = tonumber(arg[1])
elseif (#arg == 2) then 
    COMP_NUM = tonumber(arg[1])
    COMMAND = tostring(arg[2])
elseif (#arg == 5) then
    COMP_NUM = tonumber(arg[1])
    bounds = {arg[3], arg[4], arg[5]}
    if (tostring(arg[2]) == "quarry") then
        rednet.send(COMP_NUM, bounds, "quarry")
    elseif (tostring(arg[2]) == "go") then
        rednet.send(COMP_NUM, bounds, "come")
    end
end

infoGetInv()
while true do
    local event, key = os.pullEvent("key")
    local x, y, z
    local pos

    if (ran == false and COMMAND ~= nil) then
        rednet.send(COMP_NUM, COMMAND)
        ran = true
    end

    if key == keys.c then
        x, y, z = gps.locate()
        pos = {math.floor(x), math.floor(y), math.floor(z)}
        isAtPos = false

        rednet.send(COMP_NUM, pos, "come")
        while isAtPos == false do
            sleep(1)
            local sender, message, protocol = rednet.receive()
            if message == "arrived" then
                isAtPos = true
            end
        end
    elseif key == keys.w then
        rednet.send(COMP_NUM, "forward")
    elseif key == keys.s then
        rednet.send(COMP_NUM, "back")
    elseif key == keys.a then
        rednet.send(COMP_NUM, "turnLeft")
    elseif key == keys.d then
        rednet.send(COMP_NUM, "turnRight")
    elseif key == keys.space then
        rednet.send(COMP_NUM, "up")
    elseif key == keys.leftShift then
        rednet.send(COMP_NUM, "down")
    elseif key == keys.numPad4 then
        rednet.send(COMP_NUM, "mine")
    elseif key == keys.numPad7 then
        rednet.send(COMP_NUM, "mineUp")
    elseif key == keys.numPad1 then 
        rednet.send(COMP_NUM, "mineDown")
    elseif key == keys.numPad5  then
        rednet.send(COMP_NUM, "place")
    elseif key == keys.numPad8 then
        rednet.send(COMP_NUM, "placeUp")
    elseif key == keys.numPad2 then 
        rednet.send(COMP_NUM, "placeDown")
    elseif key == keys.f then
        rednet.send(COMP_NUM, "switch")
    elseif key == keys.e then
        rednet.send(COMP_NUM, "attack")
    elseif key == keys.comma then 
        rednet.send(COMP_NUM, "invLeft")
    elseif key == keys.period then 
        rednet.send(COMP_NUM, "invRight")
    elseif key == keys.r then
        rednet.send(COMP_NUM, "refuel")
    elseif key == keys.t then 
        invStatus = 'term'
    elseif key == keys.i then 
        invStatus = 'inv'
    elseif key == keys.o then 
        invStatus = 'com1'
    elseif key == keys.p then 
        invStatus = 'com2'
    end
    sleep(0.4)
    if (invStatus == 'inv') then 
        infoGetInv()
    elseif (invStatus == 'com1') then 
        infoGetCom1()
    elseif (invStatus == 'com2') then 
        infoGetCom2()
    elseif (invStatus == 'term') then 
       infoTerminal()
    end
end
