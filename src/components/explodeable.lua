local Explodeable = Component("Explodeable", function(c, delay, assemblage)
    c.delay      = delay
    c.timeLeft   = delay
    c.assemblage = assemblage
end)