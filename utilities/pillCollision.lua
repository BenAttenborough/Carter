local utils = require "utilities.collision"
local hasCollided = utils.hasCollided

local function detectPillCollision(Carter, pills)
    -- playerInfo = "Player X: " .. Carter.x .. " Y: " .. Carter.y
    -- print(playerInfo)
    -- print(pills[1].x)
    for i, pill in ipairs(pills) do
        -- print(pill.x)
        if hasCollided(Carter, pill) then
            print("Contact with pill")
            print(pill.name)
        end
    end
end

return detectPillCollision