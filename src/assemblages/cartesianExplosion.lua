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

local CartesianExplosion = Assemblage(function(e, position, delay, directions, depth, assemblage, visited)
    visited = visited or {}
    visited[position.y * 17 + position.x] = true

    delay = delay or 0.02
    depth = depth or 5

    e
    :give(Components.position, Vector(position.x, position.y))
    :give(Components.texture, imageSet)
    :give(Components.animating)
    :give(Components.delayedDestroy, delay * 10)

    if (depth > 0) then
        e:give(Components.spreadable, delay, directions or cartesianDirections, depth, assemblage, visited)
    end
end)

return CartesianExplosion