local MapManager = System({Components.position})

function MapManager:init()
    self.pool.onEntityAdded = function(_, e)
        local position = e[Components.position]

        Map.addToTile(position.tilePosition.x, position.tilePosition.y, e)
    end

    self.pool.onEntityRemoved = function(_, e)
        local position = e[Components.position]

        Map.removeFromTile(position.tilePosition.x, position.tilePosition.y, e)
    end
end

function MapManager:update(dt)
    for _, e in ipairs(self.pool) do
        local position = e[Components.position]

        if (position.tilePosition.x ~= position.oldTilePosition.x or position.tilePosition.y ~= position.oldTilePosition.y) then
            Map.removeFromTile(position.oldTilePosition.x, position.oldTilePosition.y, e)
            Map.addToTile(position.tilePosition.x, position.tilePosition.y, e)
        end
    end
end

return MapManager
