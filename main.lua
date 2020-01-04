local Concord = require("lib.concord")
local Vector  = require("lib.vector")

Concord.loadComponents ("src/components")
Concord.loadSystems    ("src/systems")
Concord.loadWorlds     ("src/worlds")
Concord.loadAssemblages("src/assemblages")

Concord.entity(Concord.worlds.game)
:give(Concord.components.position, Vector(100, 100))
:give(Concord.components.controllable)
:give(Concord.components.texture, love.graphics.newImage("assets/Bomberman/Front/Bman_F_f00.png"))


function love.update(dt)
    Concord.worlds.game:emit("update", dt)
end

function love.draw()
    Concord.worlds.game:emit("draw")
end