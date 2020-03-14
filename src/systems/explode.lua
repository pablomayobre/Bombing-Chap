local Explode = System{pool = {"Position", "Explodeable"}}

function Explode:update(dt)
    for _, e in ipairs(self.pool) do
        local position    = e.Position
        local explodeable = e.Explodeable

        explodeable.timeLeft = explodeable.timeLeft - dt
        if (explodeable.timeLeft <= 0) then
            e:destroy()
        
            local newEntity = Entity(self:getWorld())
            :assemble(explodeable.assemblage, position.tilePosition, nil, nil, nil, explodeable.assemblage)
        end
    end
end

return Explode