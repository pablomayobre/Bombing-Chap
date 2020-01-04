local Controllable = Component(function(c, assemblage, animateOnStep)
    c.assemblage    = assemblage
    c.animateOnStep = animateOnStep
end)

return Controllable