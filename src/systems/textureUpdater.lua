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

        texture.imageSet:setFacing(facing.facing)
    end

    for _, e in ipairs(self.animating) do
        local texture = e[Components.texture]

        texture.imageSet:progress(dt)
    end
end

return TextureUpdater