addPills = require "objects.addPills"

local PillCreator = addPills.PillCreator

local function createPills()

    pillRowStart = 13;
    pillRowOffset = 149;
    pillColStart = 15;
    pillColOffset = 128;

    local pillRows = {} -- create the matrix
    for i = 1, 5 do
        pillRows[i] = {} -- create a new row
        for j = 1, 6 do
            pillRows[i][j] = PillCreator(
                                 pillRowStart + (pillRowOffset * (j - 1)),
                                 pillColStart + (pillColOffset * (i - 1)))
        end
    end

    function pillRows.draw()
        for i, v in ipairs(pillRows) do
            for iInner, vInner in ipairs(v) do vInner:draw() end
        end
    end

    return pillRows

end

return createPills
