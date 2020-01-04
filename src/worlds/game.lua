local Game = World()
:addSystems(
    Systems.controller,
    Systems.textureUpdater,
    Systems.textureRenderer
)

return Game