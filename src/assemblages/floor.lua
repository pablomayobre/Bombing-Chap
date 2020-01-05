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

local Floor = Assemblage(function(e, position)
    e
    :give(Components.position, Vector(position and position.x or 0, position and position.y or 0))
    :give(Components.texture, imageSet)
end)

return Floor