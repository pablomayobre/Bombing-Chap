local ImageSet = {}
ImageSet.__mt = {__index = ImageSet}

function ImageSet.new(up, down, left, right, origin, default, frameTime)
    local imageSet = setmetatable({
        up    = up,
        down  = down,
        left  = left,
        right = right,

        active = nil,
        currentFrameIndex = 1,

        origin = Vector(origin.x, origin.y),

        maxFrameTime     = frameTime or 0.05,
        currentFrameTime = frameTime or 0.05,
    }, ImageSet.__mt)

    imageSet.active = imageSet[default or "down"]

    return imageSet
end

function ImageSet:play(facing)
    self.active = self[facing]

    self.currentFrameIndex = 1
    self.currentFrameTime  = self.maxFrameTime
end

function ImageSet:stop()
    self.currentFrameIndex = 1
    self.currentFrameTime  = self.maxFrameTime
end

function ImageSet:setFacing(facing)
    self.active = self[facing]
end

function ImageSet:progress(dt)
    self.currentFrameTime = self.currentFrameTime - dt
    
    if (self.currentFrameTime <= 0) then
        self.currentFrameTime  = self.maxFrameTime

        self.currentFrameIndex = self.currentFrameIndex + 1
   
        if (self.currentFrameIndex > #self.active) then
            self.currentFrameIndex = 1
        end
    end
end

function ImageSet:getCurrentFrame()
    return self.active[self.currentFrameIndex], self.active.flip, self.origin
end

return setmetatable(ImageSet, {
    __call = function(_, ...) return ImageSet.new(...) end,
})