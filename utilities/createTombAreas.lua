local TombCreator = require "objects.tombArea"
local config = require "config"

-- Start off by creating single tomb
tombOne = TombCreator(0, 0)

function drawTombs() tombOne:draw() end

return drawTombs
