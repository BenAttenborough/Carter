local TombCreator = require "objects.tombArea"
local config = require "config"

local M = {}

local tombs = {}
for i = 0, 4 do table.insert(tombs, TombCreator(config.column.offset * i, 0)) end

function M.drawTombs()
    for index, value in ipairs(tombs) do tombs[index]:draw() end
end

function M.checkTombOneCollision(item)
    for index, value in ipairs(tombs) do tombs[index]:hasCollidedWith(item) end
end

return M
