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
    download('https://raw.githubusercontent.com/digabro/TurtleBasic/main/Turtle/turtleControl.lua?token=GHSAT0AAAAAABWTABYYO3RKGBXSABWO5IP2YWQZDRQ','turtleControl')
    print('turtleControl.lua reinstalled')
elseif (prog == 'phone' or prog == 'Phone') then
    fs.delete('phoneControl.lua')
    download('https://raw.githubusercontent.com/digabro/TurtleBasic/main/Pocket/phoneControl.lua?token=GHSAT0AAAAAABWTABYZSCLCJ3XB44QWMJOCYWQZD3Q','phoneControl')
    print('phoneControl.lua reinstalled')
end

