local Facing = Component(function(c, facing)
    c.facing = facing or "down"
end)

return Facing