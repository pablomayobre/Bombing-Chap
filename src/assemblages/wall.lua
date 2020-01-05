local ImageSet = require("src.imageSet")

local imageSet = ImageSet(
    {},
    {
        love.graphics.newImage("assets/Blocks/SolidBlock.png"),
        flip = false,
    },
    {},
    {},
    Vector(32, 32)
)

local Wall = Assemblage(function(e, position)
    e
    :give(Components.position, Vector(position and position.x or 0, position and position.y or 0))
    :give(Components.texture, imageSet)
    :give(Components.collideable)
end)

return Wall