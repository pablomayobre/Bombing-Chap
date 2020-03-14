local List = require("lib.concord.list")

local Map = {
    width  = 17,
    height = 13,

    tileSize = 64,

    tiles = {},
}

for x = 1, Map.width do
    Map.tiles[x] = {}
    for y = 1, Map.height do
        Map.tiles[x][y] = List()
    end
end

for x = 1, Map.width do
    for y = 1, Map.height do
        Entity(Game):assemble(Assemblages.floor, Vector(x, y))
    end
end

for x = 1,  Map.width do
    for y = 1, Map.height do
        if (x == 1 or x == Map.width or y == 1 or y == Map.height or (x % 2 == 1 and y % 2 == 1)) then
            Entity(Game):assemble(Assemblages.wall, Vector(x, y))
        end
    end
end

function Map.addToTile(x, y, entity)
    Map.tiles[x][y]:add(entity)
end

function Map.removeFromTile(x, y, entity)
    Map.tiles[x][y]:remove(entity)
end

function Map.getTile(x, y)
    return Map.tiles[x][y]
end

function Map.hasComponent(x, y, baseComponent)
    local tile = Map.tiles[x][y]

    for i = 1, tile.size do
        local entity = tile[i]

        if entity:has(baseComponent) then
            return true
        end
    end

    return false
end

function Map.getComponents(x, y, baseComponent)
    local entities = {}

    local tile = Map.tiles[x][y]

    for i = 1, tile.size do
        local entity = tile[i]

        if entity:has(baseComponent) then
            entities[#entities + 1] = entity
        end
    end

    return entities
end

function Map.isTileSolid(x, y)
    local tile = Map.tiles[x][y]

    for i = 1, tile.size do
        local entity = tile[i]

        if entity:has("Collideable") then
            return true
        end
    end

    return false
end

return Map

