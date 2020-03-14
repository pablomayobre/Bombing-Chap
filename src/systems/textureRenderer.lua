local TextureRenderer = System{pool = {"Position", "Texture"}}

local function lerp(a, b, t)
    return a + (b - a) * t
end

function TextureRenderer:draw()
    for _, e in ipairs(self.pool) do
        local position = e.Position
        local texture  = e.Texture
        local facing   = e.Facing
        local moving   = e.Moving

        local progress = moving and moving.progress or 1
        
        local x = lerp(position.oldTilePosition.x, position.tilePosition.x, progress)
        local y = lerp(position.oldTilePosition.y, position.tilePosition.y, progress)
        
        local image, flip, origin = texture.imageSet:getCurrentFrame()

        love.graphics.draw(image, x * 64 - 32, y * 64 - 32, nil, flip and -1 or 1, 1, origin.x, origin.y)
    end
end

return TextureRenderer