local Concord = require("lib.concord")

local World = Concord.world()
:addSystems(
    Concord.systems.controller,
    Concord.systems.textureRenderer
)

return World