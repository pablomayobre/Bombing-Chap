local Spread = System{pool = {"Position", "Spreadable"}}

function Spread:init()
    self.test = true
end

function Spread:update(dt)
    for _, e in ipairs(self.pool) do
        local position   = e.Position
        local spreadable = e.Spreadable

        local totalS = love.timer.getTime()

        spreadable.timeLeft = spreadable.timeLeft - dt
        if (spreadable.timeLeft <= 0) then
            
            for _, direction in ipairs(spreadable.directions) do
                local newX = position.tilePosition.x + direction.x
                local newY = position.tilePosition.y + direction.y

                if (not Map.isTileSolid(newX, newY) and not spreadable.visited[newY * 17 + newX]) then
                    local newEntity = Entity(self:getWorld())
                    newEntity:assemble(spreadable.assemblage, Vector(newX, newY), spreadable.delay, cartesianDirections, spreadable.depth - 1, spreadable.assemblage, spreadable.visited)
                end
            end
            
            e
            :remove("Spreadable")
        end
    end
end

return Spread