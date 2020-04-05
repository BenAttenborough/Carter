local config = require "config"
local bounds = config.playfield

local Playfield = {
    top = bounds.top,
    right = bounds.right,
    bottom = bounds.bottom,
    left = bounds.left
}

function Playfield.draw()
    -- love.graphics.line(Playfield.top, Playfield.left, Playfield.right,
    --                    Playfield.top, Playfield.right, Playfield.bottom,
    --                    Playfield.left, Playfield.bottom, Playfield.top,
    --                    Playfield.left)
    love.graphics.setColor(0, 0, 0)

    love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(),
                            love.graphics.getHeight())
    love.graphics.setColor(255, 255, 255)
end

return Playfield
