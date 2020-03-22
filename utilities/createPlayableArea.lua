path = require "objects.path"
local config = require "config"

local RowCreator = path.RowCreator
local ColCreator = path.ColCreator

-- local M = {}

local function createPlayfield()
    rows = {
        RowCreator(0, 0), RowCreator(0, config.row.offset),
        RowCreator(0, config.row.offset * 2),
        RowCreator(0, config.row.offset * 3),
        RowCreator(0, config.row.offset * 4)
    }
    cols = {
        ColCreator(0, 0), ColCreator(config.column.offset, 0),
        ColCreator(config.column.offset * 2, 0),
        ColCreator(config.column.offset * 3, 0),
        ColCreator(config.column.offset * 4, 0),
        ColCreator(config.column.offset * 5, 0)
    }
    local playableArea = {rows = rows, cols = cols}
    function playableArea.draw()
        for i, v in ipairs(rows) do v:draw() end
        for i, v in ipairs(cols) do v:draw() end
    end
    return playableArea
end

return createPlayfield

-- return M
