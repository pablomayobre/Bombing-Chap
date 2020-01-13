local Spreadable = Component(function(c, delay, directions, depth, assemblage, visited)
    c.delay      = delay
    c.timeLeft   = delay
    c.directions = directions
    c.depth      = depth
    c.assemblage = assemblage
    c.visited    = visited or {}
end)

return Spreadable