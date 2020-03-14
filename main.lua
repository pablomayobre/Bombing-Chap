Vector  = require("lib.vector")
Concord = require("lib.concord")

Component  = Concord.component
Entity     = Concord.entity
System     = Concord.system
World      = Concord.world

Concord.utils.loadNamespace("src/components")
Assemblages = Concord.utils.loadNamespace("src/assemblages", {})
Systems     = Concord.utils.loadNamespace("src/systems",     {})

Game = World()
:addSystems(
    Systems.controller,
    Systems.mover,
    Systems.mapManager,
    Systems.delayedDestroy,
    Systems.explode,
    Systems.spread,
    Systems.textureUpdater,
    Systems.textureRenderer
)

Map = require("src.map")

cartesianDirections = {
    Vector( 0, -1),
    Vector( 0,  1),
    Vector(-1,  0),
    Vector( 1,  0),
}


Entity(Game):assemble(Assemblages.player, Vector(2, 2))
Entity(Game):assemble(Assemblages.bomb, Vector(4, 4))

function love.update(dt)
    Game:emit("update", dt)
end

function love.draw()
    Game:emit("draw")

    love.window.setTitle(love.timer.getFPS().. " : " ..#Game:getEntities())
end

function love.keypressed(key)
    Game:emit("keypressed", key)
end