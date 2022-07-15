local prog = arg[1]

function download(url, file)
    local content = http.get(url)
    if not content then
      error("site did fucky")
    end
    f = fs.open(file, "w")
    f.write(content.readAll())
    f.close()
end

if (prog == 'turtle' or prog == 'Turtle') then
    fs.delete('turtleControl')
    download('https://raw.githubusercontent.com/digabro/TurtleBasic/main/PeripheralsCC/Turtle/turtleControlAPCC.lua','turtleControl')
    print('turtleControlAPCC.lua reinstalled')
    fs.delete('quarry')
    download('https://raw.githubusercontent.com/digabro/TurtleBasic/main/PeripheralsCC/Turtle/QuarryAPCC.lua', 'quarry')
    print('quarryAPCC.lua reinstalled')
    fs.delete('summon')
    download('https://raw.githubusercontent.com/digabro/TurtleBasic/main/PeripheralsCC/Turtle/SummonAPCC.lua', 'summon')
    print('summonAPCC.lua reinstalled')
    sleep(5)
    os.reboot()
elseif (prog == 'phone' or prog == 'Phone') then
    fs.delete('phoneControl')
    download('https://raw.githubusercontent.com/digabro/TurtleBasic/main/PeripheralsCC/Phone/phoneControlAPCC.lua','phoneControl')
    print('phoneControlAPCC.lua reinstalled')
    sleep(5)
    os.reboot()
end

