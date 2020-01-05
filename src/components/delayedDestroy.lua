local DelayedDestroy = Component(function(c, delay)
    c.delay    = delay
    c.timeLeft = delay
end)

return DelayedDestroy