addTomb = require "objects.tombs"
local config = require "config"
local tombXOffset = config.column.width
local tombXDistance = 150
local tombYOffset = config.row.height
local tombYDistance = 130

local TombCreator = addTomb.TombCreator

local function createTombs()
    print("Creating tomb")

    -- local tombs = {}

    -- for i = 0, 3 do
    --     for j = 0, 4 do
    --         table.insert(tombs, TombCreator(tombXOffset + (tombXDistance * j),
    --                                         tombYOffset + (tombYDistance * i),
    --                                         95, 50))
    --     end
    -- end

    local tombs = {} -- create the matrix
    for i = 1, 5 do
        tombs[i] = {} -- create a new row
        for j = 1, 6 do
            tombs[i][j] = TombCreator(tombXOffset + (tombXDistance * (j - 1)),
                                      tombYOffset + (tombYDistance * (i - 1)),
                                      95, 50)
        end
    end

    function tombs.draw()
        for i, v in ipairs(tombs) do
            -- v:draw() 
            for innerI, innerV in ipairs(v) do innerV:draw() end
        end
    end

    return tombs

end

return createTombs
