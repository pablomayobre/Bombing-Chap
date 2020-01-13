local Facing = Component(function(c, facing)
    c.facing = facing or Vector(0, 1)
end)

return Facing