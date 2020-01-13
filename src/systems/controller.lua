local Controller = System({Components.position, Components.controllable})
Controller.moveSpeed = 4

function Controller:update(dt)
    for _, e in ipairs(self.pool) do
        local position     = e[Components.position]
        local controllable = e[Components.controllable]
        local facing       = e[Components.facing]

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
            if (not e[Components.moving]) then
        
                local newX, newY = position.tilePosition.x + x, position.tilePosition.y + y

                local pushables = Map.getComponents(newX, newY, Components.pushable)

                if (#pushables > 0) then
                    for _, o in ipairs(pushables) do
                        o:give(Components.moving, Vector(x, y), 5)
                    end
                else
                    if (not Map.hasComponent(newX, newY, Components.collideable)) then
                        e:give(Components.moving, Vector(x, y), 1)
                    end
                end
            end

            if (facing) then
                facing.facing = Vector(x, y)
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