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
    download('https://raw.githubusercontent.com/digabro/TurtleBasic/main/VanillaCC/Phone/phoneControl.lua','phoneControl')
    print('phoneControl.lua installed')
    download('https://raw.githubusercontent.com/digabro/TurtleBasic/main/VanillaCC/Install/reinstall.lua','reinstall')
    print('reinstall.lua installed')
elseif (prog == 'turtle' or prog == 'Turtle') then
    download('https://raw.githubusercontent.com/digabro/TurtleBasic/main/VanillaCC/Turtle/turtleControl.lua', 'turtleControl')
    print('turtleControl.lua installed')
    download('https://raw.githubusercontent.com/digabro/TurtleBasic/main/VanillaCC/Install/reinstall.lua','reinstall')
    print('reinstall.lua installed')
    download('https://raw.githubusercontent.com/digabro/TurtleBasic/main/VanillaCC/Turtle/Quarry.lua', 'quarry')
    print('quarry.lua installed')
    download('https://raw.githubusercontent.com/digabro/TurtleBasic/main/VanillaCC/Turtle/Summon.lua', 'summon')
    print('summon.lua installed')
end
