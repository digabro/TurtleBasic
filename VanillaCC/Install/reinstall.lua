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
    fs.delete('turtleControl.lua')
    download('https://raw.githubusercontent.com/digabro/TurtleBasic/main/VanillaCC/Turtle/turtleControl.lua','turtleControl')
    print('turtleControl.lua reinstalled')
elseif (prog == 'phone' or prog == 'Phone') then
    fs.delete('phoneControl.lua')
    download('https://raw.githubusercontent.com/digabro/TurtleBasic/main/VanillaCC/Phone/phoneControl.lua','phoneControl')
    print('phoneControl.lua reinstalled')
end

