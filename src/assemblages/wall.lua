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

local Wall = function(e, position)
    e
    :give("Position", Vector(position and position.x or 0, position and position.y or 0))
    :give("Texture", imageSet)
    :give("Collideable")
end

return Wall