local ImageSet = require("src.imageSet")

local imageSet = ImageSet(
    {},
    {
        love.graphics.newImage("assets/Bomb/Bomb_f01.png"),
        love.graphics.newImage("assets/Bomb/Bomb_f02.png"),
        love.graphics.newImage("assets/Bomb/Bomb_f03.png"),
        flip = false,
    },
    {},
    {},
    Vector(24, 24)
)

local Bomb = Assemblage(function(e, position)
    e
    :give(Components.position, Vector(position and position.x or 0, position and position.y or 0))
    :give(Components.texture, imageSet)
    :give(Components.animating)
    :give(Components.explodeable, 1, Assemblages.cartesianExplosion)
    :give(Components.pushable)
end)

return Bomb