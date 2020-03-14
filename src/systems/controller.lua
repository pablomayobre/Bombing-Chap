local Controller = System{pool = {"Position", "Controllable"}}
Controller.moveSpeed = 4

function Controller:update(dt)
    for _, e in ipairs(self.pool) do
        local position     = e.Position
        local controllable = e.Controllable
        local facing       = e.Facing

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
            if (not e.Moving) then
        
                local newX, newY = position.tilePosition.x + x, position.tilePosition.y + y

                local pushables = Map.getComponents(newX, newY, "Pushable")

                if (#pushables > 0) then
                    for _, o in ipairs(pushables) do
                        o:give("Moving", Vector(x, y), 5)
                    end
                else
                    if (not Map.hasComponent(newX, newY, "Collideable")) then
                        e:give("Moving", Vector(x, y), 1)
                    end
                end
            end

            if (e.Facing) then
                e.Facing.facing = Vector(x, y)
            end
        end  
    end
end

function Controller:keypressed(key)
    if (key == "space") then
        for _, e in ipairs(self.pool) do
            local position = e.Position
            local controllable = e.Controllable
            local facing = e.Facing

            local x, y = position.tilePosition.x, position.tilePosition.y

            if (facing) then
                x = x + facing.facing.x
                y = y + facing.facing.y
            end

            Entity(self:getWorld())
            :assemble(controllable.assemblage, Vector(x, y))
        end
    end
end

return Controller