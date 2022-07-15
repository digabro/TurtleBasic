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

if (prog == 'phone' or prog == 'Phone') then
    f = fs.open("startup", "w")
    f.write('shell.run("phoneControlAPCC")')
    f.close()
    print('startup installed')
    download('https://raw.githubusercontent.com/digabro/TurtleBasic/main/PeripheralsCC/Phone/phoneControlAPCC.lua','phoneControl')
    print('phoneControlAPCC.lua installed')
    download('https://raw.githubusercontent.com/digabro/TurtleBasic/main/PeripheralsCC/Install/reinstallAPCC.lua','reinstall')
    print('reinstallAPCC.lua installed')
    sleep(5)
    fs.delete('install.lua')
    os.reboot()
elseif(prog == 'turtle' or prog == 'Turtle') then
    f = fs.open("startup", "w")
    f.write('shell.run("turtleControlAPCC")')
    f.close()
    print('startup installed')
    download('https://raw.githubusercontent.com/digabro/TurtleBasic/main/PeripheralsCC/Turtle/turtleControlAPCC.lua', 'turtleControl')
    print('turtleControlAPCC.lua installed')
    download('https://raw.githubusercontent.com/digabro/TurtleBasic/main/PeripheralsCC/Install/reinstallAPCC.lua','reinstall')
    print('reinstallAPCC.lua installed')
    download('https://raw.githubusercontent.com/digabro/TurtleBasic/main/PeripheralsCC/Turtle/QuarryAPCC.lua', 'quarry')
    print('quarryAPCC.lua installed')
    download('https://raw.githubusercontent.com/digabro/TurtleBasic/main/PeripheralsCC/Turtle/SummonAPCC.lua', 'summon')
    print('summonAPCC.lua installed')
    sleep(5)
    fs.delete('install.lua')
    os.reboot()
end
