local comp = require("component")
local event = require("event")
local rad = "os_entdetector"
local os = require("os") 
local os = require("os")
local doska = require("serialization")
local term = require("term")
local g = comp.glasses

print("Введи корды терминала очков")
xpos = tonumber(io.read())
ypos = tonumber(io.read())
zpos = tonumber(io.read())
drawSquare = true

while true do
os.sleep(1)
  local radars = {}
  for addr, _ in pairs(comp.list(rad)) do
      table.insert(radars, comp.proxy(addr))
  end
 
local wl = {"yarik141"}
local res = {}
  
  for key, radar in ipairs(radars) do
  result = radar.scanPlayers(1000000)
  term.clear
    for id, data in ipairs(result) do
    res[data.name] = {x=data.x, y=data.y, z=data.z}
    os.sleep(0.05)
    if drawSquare then
        sq = g.addRect()
        sq.setColor(1, 0, 0)
        sq.setAlpha(0.4)
        sq.setPosition(20, 20)
        sq.setSize(20, 20)
    end
    drawSquare = not drawSquare
    local radars = {}
    for addr, _ in pairs(comp.list(rad)) do
        table.insert(radars, comp.proxy(addr))
    end
  end
  for nick, cords in pairs(res) do
local tf = false
  for n, namewl in ipairs(wl) do
      if nick == namewl then do 
          tf = true
      end
  end
if not tf then 
        print(nick, cords.x, cords.y, cords.z)
  end
    comp.redstone.setOutput(1, 0)
    g.removeAll()
    local wl = {"yarik141"}
    local res = {}

    for key, radar in ipairs(radars) do
        result = radar.scanPlayers(1000000)
        term.clear()
        for id, data in ipairs(result) do
            res[data.name] = {x = data.x, y = data.y, z = data.z}
        end
    end
    for nick, cords in pairs(res) do
        local tf = false
        for n, namewl in ipairs(wl) do
            if nick == namewl then
                do
                    tf = true
                end
            end
            if not tf then
                comp.redstone.setOutput(1, 1)
                c = g.addCube3D()
                c.set3DPos(cords.x - xpos, cords.y - ypos + 1, cords.z - zpos)
                c.setScale(1)
                c.setAlpha(0.4)

                t = g.addFloatingText()
                t.set3DPos(cords.x - xpos, cords.y - ypos + 1, cords.z - zpos)
                t.setColor(0, 1, 0)
                t.setText(nick)
            end
        end
    end
end
