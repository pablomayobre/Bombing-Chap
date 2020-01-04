local Concord = require("lib.concord")

Concord.loadComponents ("src/components")
Concord.loadSystems    ("src/systems")
Concord.loadWorlds     ("src/worlds")
Concord.loadAssemblages("src/assemblages")

function love.update(dt)
    Concord.worlds.game:emit("update", dt)
end

function love.draw()
    Concord.worlds.game:emit("draw")
end