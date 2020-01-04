local Position = Component(function(c, tilePosition)
    c.tilePosition    = Vector(tilePosition.x or 0, tilePosition.y or 0)
    c.oldTilePosition = Vector(tilePosition.x or 0, tilePosition.y or 0)
    c.progress        = 1
end)

return Position