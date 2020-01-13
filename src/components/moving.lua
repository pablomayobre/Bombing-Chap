local Moving = Component(function(c, direction, distance)
    c.direction = direction
    c.distance  = distance
    c.progress  = 0
    c.speed     = 7
end)

return Moving