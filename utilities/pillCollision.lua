local utils = require "utilities.collision"
local hasCollided = utils.hasCollided

local function revealTomb(tomb, revealNoise)
    -- print("Reveal Tomb " .. num)
    tomb.open = true
    -- score = score + 50
    revealNoise:stop()
    revealNoise:play()
end

local function checkNeighbouringPills(pills, tombs, score, revealNoise)
    for row = 1, 4 do
        for col = 1, 5 do
            if pills[row][col].hit and pills[row][col + 1].hit and
                pills[row + 1][col].hit and pills[row + 1][col + 1].hit and
                tombs[row][col].open == false then
                revealTomb(tombs[row][col], revealNoise)
                print("Reveal tomb " .. row .. " " .. col)
            end
        end
    end
end

local function detectPillCollision(Carter, pills, tombs, score, revealNoise)
    for i, v in ipairs(pills) do
        for iInner, pill in ipairs(v) do
            if hasCollided(Carter, pill) then
                pill.hit = true
                pill.hitDirection = Carter.direction
                checkNeighbouringPills(pills, tombs, score, revealNoise)
            end
        end
    end
end

return detectPillCollision
