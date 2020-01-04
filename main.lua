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


local ImageSet = require("src.imageSet")

Entity(Worlds.game)
:give(Components.position, Vector(100, 100))
:give(Components.controllable, true)
:give(Components.facing, "down")
:give(Components.texture, ImageSet(
    {
        love.graphics.newImage("assets/Bomberman/Back/Bman_B_f00.png"),
        love.graphics.newImage("assets/Bomberman/Back/Bman_B_f01.png"),
        love.graphics.newImage("assets/Bomberman/Back/Bman_B_f02.png"),
        love.graphics.newImage("assets/Bomberman/Back/Bman_B_f03.png"),
        love.graphics.newImage("assets/Bomberman/Back/Bman_B_f04.png"),
        love.graphics.newImage("assets/Bomberman/Back/Bman_B_f05.png"),
        love.graphics.newImage("assets/Bomberman/Back/Bman_B_f06.png"),
        love.graphics.newImage("assets/Bomberman/Back/Bman_B_f07.png"),
        flip = false,
    },
    {
        love.graphics.newImage("assets/Bomberman/Front/Bman_F_f00.png"),
        love.graphics.newImage("assets/Bomberman/Front/Bman_F_f01.png"),
        love.graphics.newImage("assets/Bomberman/Front/Bman_F_f02.png"),
        love.graphics.newImage("assets/Bomberman/Front/Bman_F_f03.png"),
        love.graphics.newImage("assets/Bomberman/Front/Bman_F_f04.png"),
        love.graphics.newImage("assets/Bomberman/Front/Bman_F_f05.png"),
        love.graphics.newImage("assets/Bomberman/Front/Bman_F_f06.png"),
        love.graphics.newImage("assets/Bomberman/Front/Bman_F_f07.png"),
        flip = false,
    },
    {
        love.graphics.newImage("assets/Bomberman/Side/Bman_F_f00.png"),
        love.graphics.newImage("assets/Bomberman/Side/Bman_F_f01.png"),
        love.graphics.newImage("assets/Bomberman/Side/Bman_F_f02.png"),
        love.graphics.newImage("assets/Bomberman/Side/Bman_F_f03.png"),
        love.graphics.newImage("assets/Bomberman/Side/Bman_F_f04.png"),
        love.graphics.newImage("assets/Bomberman/Side/Bman_F_f05.png"),
        love.graphics.newImage("assets/Bomberman/Side/Bman_F_f06.png"),
        love.graphics.newImage("assets/Bomberman/Side/Bman_F_f07.png"),
        flip = true,
    },
    {
        love.graphics.newImage("assets/Bomberman/Side/Bman_F_f00.png"),
        love.graphics.newImage("assets/Bomberman/Side/Bman_F_f01.png"),
        love.graphics.newImage("assets/Bomberman/Side/Bman_F_f02.png"),
        love.graphics.newImage("assets/Bomberman/Side/Bman_F_f03.png"),
        love.graphics.newImage("assets/Bomberman/Side/Bman_F_f04.png"),
        love.graphics.newImage("assets/Bomberman/Side/Bman_F_f05.png"),
        love.graphics.newImage("assets/Bomberman/Side/Bman_F_f06.png"),
        love.graphics.newImage("assets/Bomberman/Side/Bman_F_f07.png"),
        flip = false,
    },
    Vector(32, 128)
))


function love.update(dt)
    Worlds.game:emit("update", dt)
end

function love.draw()
    Worlds.game:emit("draw")
end