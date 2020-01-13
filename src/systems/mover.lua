local Mover = System({Components.position, Components.moving})

function Mover:update(dt)
    for _, e in ipairs(self.pool) do
        local position = e[Components.position]
        local moving   = e[Components.moving]

        if (moving.progress == 0) then
            local newX, newY = position.tilePosition.x + moving.direction.x, position.tilePosition.y + moving.direction.y

            if (not Map.hasComponent(newX, newY, Components.collideable)) then
                position.oldTilePosition = Vector(position.tilePosition.x, position.tilePosition.y)
                position.tilePosition = Vector(newX, newY)
            else
                e:remove(Components.moving)
            end
        end
        
        if (moving.progress < 1) then
            moving.progress = math.min(1, moving.progress + moving.speed * dt)
        else
            moving.distance = moving.distance - 1

            if (moving.distance == 0) then
                e:remove(Components.moving)
            else
                moving.progress = 0
            end
        end
    end
end

return Mover