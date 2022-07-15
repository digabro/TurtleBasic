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
    download('https://raw.githubusercontent.com/digabro/TurtleBasic/main/VanillaCC/Pocket/phoneControl.lua','phoneControl')
    print('phoneControl.lua installed')
    download('https://raw.githubusercontent.com/digabro/TurtleBasic/main/VanillaCC/Install/reinstall.lua','reinstall')
    print('reinstaller installed')
elseif (prog == 'turtle' or prog == 'Turtle') then
    download('https://github.com/digabro/TurtleBasic/blob/main/VanillaCC/Turtle/turtleControl.lua')
    print('turtleControl installed')
    download('https://raw.githubusercontent.com/digabro/TurtleBasic/main/VanillaCC/Install/reinstall.lua','reinstall')
    print('reinstaller installed')
    download('https://github.com/digabro/TurtleBasic/blob/main/VanillaCC/Turtle/Quarry.lua', 'quarry')
    print('quarry installed')
    download('https://github.com/digabro/TurtleBasic/blob/main/VanillaCC/Turtle/Summon.lua', 'summon')
    print('summon installed')
end
