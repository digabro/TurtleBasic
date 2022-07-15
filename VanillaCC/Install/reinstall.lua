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
    download('https://raw.githubusercontent.com/digabro/TurtleBasic/main/VanillaCC/Turtle/turtleControl.lua','turtleControl')
    print('turtleControl.lua reinstalled')
    fs.delete('install.lua')
    download('https://raw.githubusercontent.com/digabro/TurtleBasic/main/VanillaCC/Install/install.lua','install.lua')
    print('install.lua reinstalled')
    fs.delete('quarry')
    download('https://raw.githubusercontent.com/digabro/TurtleBasic/main/VanillaCC/Turtle/Quarry.lua', 'quarry')
    print('quarry.lua reinstalled')
    fs.delete('summon')
    download('https://raw.githubusercontent.com/digabro/TurtleBasic/main/VanillaCC/Turtle/Summon.lua', 'summon')
    print('summon.lua reinstalled')
    sleep(5)
    os.reboot()
elseif (prog == 'phone' or prog == 'Phone') then
    fs.delete('phoneControl')
    download('https://raw.githubusercontent.com/digabro/TurtleBasic/main/VanillaCC/Phone/phoneControl.lua','phoneControl')
    print('phoneControl.lua reinstalled')
    fs.delete('install.lua')
    download('https://raw.githubusercontent.com/digabro/TurtleBasic/main/VanillaCC/Install/install.lua','install.lua')
    print('install.lua reinstalled')
    sleep(5)
    os.reboot()
end

