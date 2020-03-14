local Mover = System{pool = {"Position", "Moving"}}

function Mover:update(dt)
    for _, e in ipairs(self.pool) do
        local position = e.Position
        local moving   = e.Moving

        if (moving.progress == 0) then
            local newX, newY = position.tilePosition.x + moving.direction.x, position.tilePosition.y + moving.direction.y

            if (not Map.hasComponent(newX, newY, "Collideable")) then
                position.oldTilePosition = Vector(position.tilePosition.x, position.tilePosition.y)
                position.tilePosition = Vector(newX, newY)
            else
                e:remove("Moving")
            end
        end
        
        if (moving.progress < 1) then
            moving.progress = math.min(1, moving.progress + moving.speed * dt)
        else
            moving.distance = moving.distance - 1

            if (moving.distance == 0) then
                e:remove("Moving")
            else
                moving.progress = 0
            end
        end
    end
end

return Mover