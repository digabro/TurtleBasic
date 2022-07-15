local prog = arg[1]

function download(url, file)
    local content = http.get(url).readAll()
    print(content)
    if not content then
      error("Could not connect to website")
    end
    f = fs.open(file, "w")
    f.write(content)
    f.close()
end

if (prog == 'turtle' or prog == 'Turtle') then
    fs.delete('turtleControl.lua')
    download('https://github.com/digabro/TurtleBasic/blob/main/Turtle/turtleControl.lua','turtleControl')
    print('turtleControl.lua reinstalled')
elseif (prog == 'phone' or prog == 'Phone') then
    fs.delete('phoneControl.lua')
    download('https://github.com/digabro/TurtleBasic/blob/main/Pocket/phoneControl.lua','phoneControl')
    print('phoneControl.lua reinstalled')
end