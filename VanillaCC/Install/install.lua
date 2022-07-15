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
    download('https://raw.githubusercontent.com/digabro/TurtleBasic/main/Pocket/phoneControl.lua','phoneControl')
    print('phoneControl.lua installed')
    download('https://raw.githubusercontent.com/digabro/TurtleBasic/main/Install/reinstall.lua','reinstall')
    print('reinstaller installed')
elseif (prog == 'turtle' or prog == 'Turtle') then
    download('https://github.com/digabro/TurtleBasic/blob/main/Turtle/turtleControl.lua')
    print('turtleControl installed')
    download('https://raw.githubusercontent.com/digabro/TurtleBasic/main/Install/reinstall.lua','reinstall')
    print('reinstaller installed')
    download('https://github.com/digabro/TurtleBasic/blob/main/Turtle/Quarry.lua', 'quarry')
    print('quarry installed')
    download('https://github.com/digabro/TurtleBasic/blob/main/Turtle/Summon.lua', 'summon')
    print('summon installed')

