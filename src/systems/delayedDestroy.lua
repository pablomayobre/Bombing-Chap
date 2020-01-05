local DelayedDestroy = System({Components.delayedDestroy})

function DelayedDestroy:update(dt)
    for _, e in ipairs(self.pool) do
        local delayedDestroy = e[Components.delayedDestroy]

        delayedDestroy.timeLeft = delayedDestroy.timeLeft - dt
        if (delayedDestroy.timeLeft <= 0) then
            e:destroy()
        end
    end
end

return DelayedDestroy