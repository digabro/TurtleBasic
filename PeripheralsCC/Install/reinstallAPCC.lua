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
    fs.delete('turtleControlAPCC')
    download('https://raw.githubusercontent.com/digabro/TurtleBasic/main/PeripheralsCC/Turtle/turtleControlAPCC.lua','turtleControlAPCC')
    print('turtleControlAPCC.lua reinstalled')
    fs.delete('quarry')
    download('https://raw.githubusercontent.com/digabro/TurtleBasic/main/PeripheralsCC/Turtle/Quarry.lua', 'quarry')
    print('quarry.lua reinstalled')
    fs.delete('summonAPCC')
    download('https://raw.githubusercontent.com/digabro/TurtleBasic/main/PeripheralsCC/Turtle/SummonAPCC.lua', 'summonAPCC')
    print('summonAPCC.lua reinstalled')
    sleep(5)
    os.reboot()
elseif (prog == 'phone' or prog == 'Phone') then
    fs.delete('phoneControlAPCC')
    download('https://raw.githubusercontent.com/digabro/TurtleBasic/main/PeripheralsCC/Phone/phoneControlAPCC.lua','phoneControlAPCC')
    print('phoneControlAPCC.lua reinstalled')
    sleep(5)
    os.reboot()
end

