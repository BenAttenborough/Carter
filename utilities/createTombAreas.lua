local TombCreator = require "objects.tombArea"
local config = require "config"

-- Start off by creating single tomb
tombOne = TombCreator(0, 0)
tombTwo = TombCreator(150, 0)

local M = {}

function M.drawTombs()
    tombOne:draw()
    tombTwo:draw()
end

function M.checkTombOneCollision(item)
    tombOne:hasCollidedWith(item)
    tombTwo:hasCollidedWith(item)
end

return M
