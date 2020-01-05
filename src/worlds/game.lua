local Game = World()
:addSystems(
    Systems.controller,
    Systems.mapManager,
    Systems.delayedDestroy,
    Systems.explode,
    Systems.spread,
    Systems.textureUpdater,
    Systems.textureRenderer
)

return Game