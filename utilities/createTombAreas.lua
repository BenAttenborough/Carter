local TombCreator = require "objects.tombArea"
local config = require "config"

local M = {}

local tombs = {}

for row = 1, 5 do
    tombs[row] = {}
    for col = 1, 4 do
        tombs[row][col] = TombCreator(config.column.offset * (row - 1),
                                      config.row.offset * (col - 1))
    end
end

function M.drawTombs()
    for row = 1, 5 do for col = 1, 4 do tombs[row][col]:draw() end end
end

function M.checkTombOneCollision(item)
    for row = 1, 5 do
        for col = 1, 4 do tombs[row][col]:hasCollidedWith(item) end
    end
end

return M
