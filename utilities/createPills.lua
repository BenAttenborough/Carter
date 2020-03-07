addPills = require "objects.addPills"

local PillCreator = addPills.PillCreator

local function createPills()
    -- local pill = PillCreator(60,60)
    -- pill.draw()

    pillRowStart = 19;
    pillRowOffset = 149;
    pillColStart = 30;
    pillColOffset = 128;

    -- Need to do this better
    -- As a grid of pills with x and y or row col recorded
    -- local pillRows = {
    --     PillCreator(20, 80), PillCreator(168, 80, "two"),
    --     PillCreator(320, 30, "three"), PillCreator(470, 30, "four"),
    --     PillCreator(615, 30, "five"), PillCreator(760, 30, "six"),
    --     PillCreator(17, 160, "seven"), PillCreator(165, 160, "eight"),
    --     PillCreator(320, 160, "nine"), PillCreator(470, 160, "ten"),
    --     PillCreator(615, 160, "eleven"), PillCreator(760, 160, "twelve")
    -- }

    -- local pillRows = {}

    -- for j = 0, 4 do
    --     for i = 0, 5 do
    --         table.insert(pillRows,
    --                      PillCreator(pillRowStart + (pillRowOffset * i),
    --                                  pillColStart + (pillColOffset * j)))
    --     end
    -- end

    -- function pillRows.draw() for i, v in ipairs(pillRows) do v:draw() end end

    local pillRows = {} -- create the matrix
    for i = 1, 5 do
        pillRows[i] = {} -- create a new row
        for j = 1, 6 do
            pillRows[i][j] = PillCreator(
                                 pillRowStart + (pillRowOffset * (j - 1)),
                                 pillColStart + (pillColOffset * (i - 1)))
        end
    end

    -- for i, v in ipairs(pillRows) do
    --     -- print(i, v)
    --     for iInner, vInner in ipairs(v) do print(vInner.x) end
    -- end

    function pillRows.draw()
        for i, v in ipairs(pillRows) do
            for iInner, vInner in ipairs(v) do vInner:draw() end
        end
    end

    return pillRows

end

return createPills
