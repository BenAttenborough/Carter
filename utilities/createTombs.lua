addTomb = require "objects.tombs"
local config = require "config"
local tombXOffset = config.column.width
local tombXDistance = 150
local tombYOffset = config.row.height
local tombYDistance = 130

local TombCreator = addTomb.TombCreator

local function createTombs()
    print("Creating tomb")

    local tombs = {}

    for i = 0, 3 do
        for j = 0, 4 do
            table.insert(tombs, TombCreator(tombXOffset + (tombXDistance * j),
                                            tombYOffset + (tombYDistance * i),
                                            95, 50))
        end
    end

    function tombs.draw() for i, v in ipairs(tombs) do v:draw() end end

    return tombs

end

return createTombs
