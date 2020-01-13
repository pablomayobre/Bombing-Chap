local Explode = System({Components.position, Components.explodeable})

function Explode:update(dt)
    for _, e in ipairs(self.pool) do
        local position    = e[Components.position]
        local explodeable = e[Components.explodeable]

        explodeable.timeLeft = explodeable.timeLeft - dt
        if (explodeable.timeLeft <= 0) then
            e:destroy()
        
            local newEntity = Entity(self:getWorld())
            :assemble(explodeable.assemblage, position.tilePosition, nil, nil, nil, explodeable.assemblage)
        end
    end
end

return Explode