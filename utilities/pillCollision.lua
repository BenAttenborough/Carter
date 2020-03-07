local utils = require "utilities.collision"
local hasCollided = utils.hasCollided

local function checkNeighbouringPills(pills)
    -- Need to check all four grids around pill
    -- first check which grids exist
    if pills[1].hit and
        pills[2].hit and
        pills[7].hit and
        pills[8].hit then
            print("Reveal tomb 1")
    end
end

local function detectPillCollision(Carter, pills)
    for i, pill in ipairs(pills) do
        if hasCollided(Carter, pill) then
            pill.hit = true
            checkNeighbouringPills(pills)
        end
    end
end

return detectPillCollision