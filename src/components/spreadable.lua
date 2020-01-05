local Spreadable = Component(function(c, delay, directions, assemblage, visited)
    c.delay      = delay
    c.timeLeft   = delay
    c.directions = directions
    c.assemblage = assemblage

    c.visited = visited or {}
end)

return Spreadable