local Explodeable = Component(function(c, delay, assemblage)
    c.delay      = delay
    c.timeLeft   = delay
    c.assemblage = assemblage
end)

return Explodeable