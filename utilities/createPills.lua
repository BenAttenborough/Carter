addPills = require "objects.addPills"

local PillCreator = addPills.PillCreator


local function createPills()
    -- local pill = PillCreator(60,60)
    -- pill.draw()

    pillRowsStart = 20;
    pillRowsOffset = 20;

    local pillRows = {
        PillCreator(17,30),
        PillCreator(165,30),
        PillCreator(320,30),
        PillCreator(470,30),
        PillCreator(615,30),
        PillCreator(760,30),
        PillCreator(17,160),
        PillCreator(165,160),
        PillCreator(320,160),
        PillCreator(470,160),
        PillCreator(615,160),
        PillCreator(760,160),
    }

    -- for i, v in ipairs(rows) do
    --     v:draw()
    -- end

	function pillRows.draw()
		for i, v in ipairs(pillRows) do
			v:draw()
		end
		for i, v in ipairs(pillRows) do
			v:draw()
		end
	end
	return pillRows


end

return createPills