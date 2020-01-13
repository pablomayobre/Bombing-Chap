local TextureUpdater = System({Components.texture, Components.animating, "animating"}, {Components.texture, Components.facing, "facing"})

function TextureUpdater:init()
    self.animating.onEntityRemoved = function(_, e)
        local texture = e[Components.texture]

        texture.imageSet:stop()
    end
end

function TextureUpdater:update(dt)
    for _, e in ipairs(self.facing) do
        local texture = e[Components.texture]
        local facing  = e[Components.facing]

        local facingName
        if (facing.facing.x == 0 and facing.facing.y == -1) then
            facingName = "up"
        elseif (facing.facing.x == 0 and facing.facing.y == 1) then
            facingName = "down"
        elseif (facing.facing.x == -1 and facing.facing.y == 0) then
            facingName = "left"
        elseif (facing.facing.x == 1 and facing.facing.y == 0) then
            facingName = "right"
        end

        texture.imageSet:setFacing(facingName or "down")
    end

    for _, e in ipairs(self.animating) do
        local texture = e[Components.texture]

        texture.imageSet:progress(dt)
    end
end

return TextureUpdater