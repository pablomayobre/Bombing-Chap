local ImageSet = require("src.imageSet")

local imageSet = ImageSet(
    {},
    {
        love.graphics.newImage("assets/Flame/Flame_f00.png"),
        love.graphics.newImage("assets/Flame/Flame_f00.png"),
        love.graphics.newImage("assets/Flame/Flame_f00.png"),
        flip = false,
    },
    {},
    {},
    Vector(32, 32)
)

local CartesianExplosion = Assemblage(function(e, position, delay, directions, assemblage, visited)
    visited = visited or {}
    visited[position.y * 17 + position.x] = true

    e
    :give(Components.position, Vector(position.x, position.y))
    :give(Components.texture, imageSet)
    :give(Components.animating)
    :give(Components.spreadable, delay or 0.02, directions or cartesianDirections, assemblage, visited)
end)

return CartesianExplosion