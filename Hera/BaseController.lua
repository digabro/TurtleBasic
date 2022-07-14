rednet.open("back")

local VARIFIED_DEVICES = {2, 8}
local DEVICE_POS = 1
local DEVICE_LEN = table.getn(VARIFIED_DEVICES)
local DOOR_INTERFACE = "right"

local TURTLE_DOCK = {
    {id = 19, coords = {1579, 111, 419}},
    {id = 10, coords = {1577, 111, 419}},
    {id = nil, coords = {1581, 111, 419}},
    {id = nil, coords = {1583, 111, 419}}
}

function dockTurtle(id)
    for index, value in ipairs(TURTLE_DOCK) do
        if value.id == id then
            rednet.send(id, value.coords, "undock")
            print(tostring(id), "Undocking")
            value.id = nil
            return true
        elseif value.id == nil then
            rednet.send(id, value.coords, "dock")
            print(tostring(id), "Docking")
            value.id = id
            return true
        end
    end
end

function verifyUser(user)
    for index, value in ipairs(VARIFIED_DEVICES) do
        if value == user then
            return true
        end
    end
    return false
end

function openDoor(user)
    if verifyUser(user) then
        redstone.setOutput(DOOR_INTERFACE, true)
        sleep(1)
        redstone.setOutput(DOOR_INTERFACE, false)
        return true
    end
    return false
end

while true do
    local sender, message, protocol = rednet.receive()

    if message == "open" then
        if openDoor(sender) then
            print("Door Successfully Opened")
        else 
            print("Verificaiton Failed")
        end
    elseif protocol == "dock" then
        dockTurtle(message)
    end
end