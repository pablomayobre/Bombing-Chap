local Controller = System({Components.position, Components.controllable})
Controller.moveSpeed = 4

function Controller:update(dt)
    for _, e in ipairs(self.pool) do
        local position     = e[Components.position]
        local controllable = e[Components.controllable]

        if (position.progress ~= 1) then
            position.progress = position.progress + self.moveSpeed * dt

            if (position.progress >= 1) then
                position.progress = 1

                if (controllable.animateOnStep) then
                    e:remove(Components.animating)
                end
            end
        end

        if (position.progress == 1) then
            local x, y = 0, 0

            if (love.keyboard.isDown("w")) then
                y = -1
            elseif (love.keyboard.isDown("a")) then
                x = -1
            elseif (love.keyboard.isDown("s")) then
                y = 1
            elseif (love.keyboard.isDown("d")) then
                x = 1
            end

            if (x ~= 0 or y ~= 0) then
                position.oldTilePosition.x = position.tilePosition.x
                position.oldTilePosition.y = position.tilePosition.y

                position.tilePosition.x = position.tilePosition.x + (x * 64)
                position.tilePosition.y = position.tilePosition.y + (y * 64)

                position.progress = 0

                if (controllable.animateOnStep) then
                    e:give(Components.animating)
                end

                local facing = e[Components.facing]
                if (facing) then
                    facing.facing = y == -1 and "up"    or
                                    y ==  1 and "down"  or
                                    x == -1 and "left"  or
                                    x ==  1 and "right" or "down"
                end
            end
        end
    end
end

function Controller:keypressed(key)
    if (key == "space") then
        for _, e in ipairs(self.pool) do
            local position = e[Components.position]
            local controllable = e[Components.controllable]
            local facing = e[Components.facing]

            if (facing) then
                local x = facing.facing == "left" and -1 or facing.facing == "right" and 1 or 0
                local y = facing.facing == "up" and -1 or facing.facing == "down" and 1 or 0

                Entity(self:getWorld())
                :assemble(controllable.assemblage, Vector(position.tilePosition.x + x * 64, position.tilePosition.y + y * 64))
            end
        end
    end
end

return Controller