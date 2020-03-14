local DelayedDestroy = System{pool = {"DelayedDestroy"}}

function DelayedDestroy:update(dt)
    for _, e in ipairs(self.pool) do
        local delayedDestroy = e.DelayedDestroy

        delayedDestroy.timeLeft = delayedDestroy.timeLeft - dt
        if (delayedDestroy.timeLeft <= 0) then
            e:destroy()
        end
    end
end

return DelayedDestroy