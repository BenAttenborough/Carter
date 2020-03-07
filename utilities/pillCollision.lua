local utils = require "utilities.collision"
local hasCollided = utils.hasCollided

local function revealTomb(tomb, revealNoise)
    -- print("Reveal Tomb " .. num)
    tomb.open = true
    -- score = score + 50
    -- revealNoise:stop()
    revealNoise:play()
end

local function checkNeighbouringPills(pills, tombs, score, revealNoise)

    -- for rowIndex, pills in ipairs(rows) do
    -- for pillIndex, pill in ipairs(rowValue) do
    --     print("pillx: " .. pill.x)
    -- end
    for row = 1, 4 do
        for col = 1, 4 do
            -- print("rowValue" .. rowValue[i].hit)
            if pills[row][col].hit and pills[row][col + 1].hit and
                pills[row + 1][col].hit and pills[row + 1][col + 1].hit and
                tombs[row][col].open then
                revealTomb(tombs[row][col], revealNoise)
                print("Reveal tomb " .. row .. " " .. col)
            end
        end
    end

    -- Need to check all four grids around pill
    -- first check which grids exist
    -- if pills[1].hit and pills[2].hit and pills[7].hit and pills[8].hit and
    --     tombs[1].open == false then revealTomb(tombs[1], revealNoise) end
    -- if pills[2].hit and pills[3].hit and pills[8].hit and pills[9].hit and
    --     tombs[2].open == false then revealTomb(tombs[2], revealNoise) end

    -- function checkRow(rowPillStart)
    --     local rowLength = 4

    -- for i = rowPillStart, rowPillStart + rowLength do
    --     local x = i
    --     if rowPillStart >= 7 then x = x - 1 end
    --     if pills[i].hit and pills[i + 1].hit and pills[i + 6].hit and
    --         pills[i + 7].hit and tombs[x].open == false then
    --         revealTomb(tombs[x], revealNoise, x)
    --     end
    -- end

    -- print("Start")
    -- for j = 1, 24, 6 do
    --     for i = j, j + 4 do
    --         print("j: " .. j .. " i: " .. i)
    --         -- local x = i
    --         -- if rowPillStart >= 7 then x = x - 1 end
    --         -- if pills[i].hit and pills[i + 1].hit and pills[i + 6].hit and
    --         --     pills[i + 7].hit and tombs[x].open == false then
    --         --     revealTomb(tombs[x], revealNoise, x)
    --         -- end
    --     end
    -- end
    -- print("End")

    -- for row = 1, 24, 6 do
    --     for col = 1, 4 do
    --         -- print("j: " .. j .. " i: " .. i)
    --         -- local x = i
    --         -- if rowPillStart >= 7 then x = x - 1 end
    --         if pills[col].hit and pills[col + 1].hit and pills[col + 6].hit and
    --             pills[col + 7].hit and tombs[col].open == false then
    --             revealTomb(tombs[x], revealNoise, x)
    --         end
    --     end
    -- end

    -- end

    -- local rowLength = 6
    -- checkRow(1)
    -- checkRow(7)
    -- checkRow(13)
    -- checkRow(19)

    -- for i = 1, rowLength - 1 do
    --     if pills[i].hit and pills[i + 1].hit and pills[i + 6].hit and
    --         pills[i + 7].hit and tombs[i].open == false then
    --         revealTomb(tombs[i], revealNoise)
    --     end
    -- end

    -- for i = 1, 12 do
    --     if pills[i].hit and pills[i + 1].hit and pills[i + 6].hit and
    --         pills[i + 7].hit and tombs[i].open == false then
    --         revealTomb(tombs[i], revealNoise)
    --     end
    -- end
end

local function detectPillCollision(Carter, pills, tombs, score, revealNoise)
    for i, v in ipairs(pills) do
        for iInner, pill in ipairs(v) do
            if hasCollided(Carter, pill) then
                pill.hit = true
                checkNeighbouringPills(pills, tombs, score, revealNoise)
            end
        end
    end
end

return detectPillCollision
