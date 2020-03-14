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

local Bomb = function(e, position)
    e
    :give("Position", Vector(position and position.x or 0, position and position.y or 0))
    :give("Texture", imageSet)
    :give("Animating")
    :give("Explodeable", 1, Assemblages.cartesianExplosion)
    :give("Pushable")
end

return Bomb