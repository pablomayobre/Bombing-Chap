local ImageSet = require("src.imageSet")

local imageSet = ImageSet(
    {},
    {
        love.graphics.newImage("assets/Blocks/BackgroundTile.png"),
        flip = false,
    },
    {},
    {},
    Vector(32, 32)
)

local Floor =function(e, position)
    e
    :give("Position", Vector(position and position.x or 0, position and position.y or 0))
    :give("Texture", imageSet)
end

return Floor