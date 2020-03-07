local utils = require "utilities.collision"
local hasCollided = utils.hasCollided

local function checkNeighbouringPills(pills, tombs)
    -- Need to check all four grids around pill
    -- first check which grids exist
    if pills[1].hit and pills[2].hit and pills[7].hit and pills[8].hit and
        tombs[1].open == false then
        print("Reveal tomb 1")
        print(tombs[1])
        tombs[1].open = true
    end
end

local function detectPillCollision(Carter, pills, tombs)
    for i, pill in ipairs(pills) do
        if hasCollided(Carter, pill) then
            pill.hit = true
            checkNeighbouringPills(pills, tombs)
        end
    end
end

return detectPillCollision
