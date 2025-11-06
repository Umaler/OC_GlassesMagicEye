local comp = require("component")
local event = require("event")
local rad = "os_entdetector"
local os = require("os") 
local doska = require("serialization")
 
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
    for id, data in ipairs(result) do
    res[data.name] = {x=data.x, y=data.y, z=data.z}
        
    end
    print(doska.serialize(res))
  end
end
