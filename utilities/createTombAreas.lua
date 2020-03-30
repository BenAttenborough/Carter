local TombCreator = require "objects.tombArea"
local config = require "config"

local M = require("libs/Moses/moses")
local T = {}

treasures = {}
treasures[1] = config.tomb.graphicsTreasure1
treasures[2] = config.tomb.graphicsTreasure1

for i = 1, 10 do treasures[i] = config.tomb.treasures.empty end
for i = 11, 16 do treasures[i] = config.tomb.treasures.jewel end
treasures[#treasures + 1] = config.tomb.treasures.key
treasures[#treasures + 1] = config.tomb.treasures.scroll
treasures[#treasures + 1] = config.tomb.treasures.mummy
treasures[#treasures + 1] = config.tomb.treasures.sarcophagus

treasures = M.shuffle(treasures, os.time())

-- for i = 1, 20 do print(treasures) end

local tombs = {}

for row = 1, 5 do
    tombs[row] = {}
    for col = 1, 4 do
        tombs[row][col] = TombCreator(config.column.offset * (row - 1),
                                      config.row.offset * (col - 1),
                                      M.shift(treasures))
    end
end

function T.drawTombs()
    for row = 1, 5 do for col = 1, 4 do tombs[row][col]:draw() end end
end

function T.checkTombOneCollision(item)
    for row = 1, 5 do
        for col = 1, 4 do tombs[row][col]:hasCollidedWith(item) end
    end
end

return T
