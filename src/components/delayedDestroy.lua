local DelayedDestroy = Component("DelayedDestroy", function(c, delay)
    c.delay    = delay
    c.timeLeft = delay
end)

return DelayedDestroy