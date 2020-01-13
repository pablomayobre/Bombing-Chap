Vector  = require("lib.vector")
Concord = require("lib.concord")

Component  = Concord.component
Entity     = Concord.entity
System     = Concord.system
World      = Concord.world
Assemblage = Concord.assemblage

Components  = Concord.components
Systems     = Concord.systems
Worlds      = Concord.worlds
Assemblages = Concord.assemblages

Concord.loadComponents ("src/components")
Concord.loadSystems    ("src/systems")
Concord.loadWorlds     ("src/worlds")
Concord.loadAssemblages("src/assemblages")

Map = require("src.map")

cartesianDirections = {
    Vector( 0, -1),
    Vector( 0,  1),
    Vector(-1,  0),
    Vector( 1,  0),
}


Entity(Worlds.game):assemble(Assemblages.player, Vector(2, 2))
Entity(Worlds.game):assemble(Assemblages.bomb, Vector(4, 4))

function love.update(dt)
    Worlds.game:emit("update", dt)
end

function love.draw()
    Worlds.game:emit("draw")

    love.window.setTitle(love.timer.getFPS().. " : " ..#Worlds.game:getEntities())
end

function love.keypressed(key)
    Worlds.game:emit("keypressed", key)
end