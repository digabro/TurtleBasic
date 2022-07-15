local prog = arg[1]

function download(url, file)
    local content = http.get(url)
    print(content)
    if not content then
      error("Could not connect to website")
    end
    f = fs.open(file, "w")
    f.write(content.readAll())
    f.close()
end

if (prog == 'turtle' or prog == 'Turtle') then
    fs.delete('turtleControl.lua')
    download('https://raw.githubusercontent.com/digabro/TurtleBasic/main/Turtle/turtleControl.lua?token=GHSAT0AAAAAABWTABYZDD4NRMSMHQEDNLYEYWQV45Q','turtleControl')
    print('turtleControl.lua reinstalled')
elseif (prog == 'phone' or prog == 'Phone') then
    fs.delete('phoneControl.lua')
    download('https://raw.githubusercontent.com/digabro/TurtleBasic/main/Pocket/phoneControl.lua?token=GHSAT0AAAAAABWTABYY6OANYTK556OLU4BEYWQV5CA','phoneControl')
    print('phoneControl.lua reinstalled')
end