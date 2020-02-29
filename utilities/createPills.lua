addPills = require "../objects/addPills"

local PillCreator = addPills.PillCreator


local function createPills()
    -- local pill = PillCreator(60,60)
    -- pill.draw()

    local pillRows = {
        PillCreator(40,40),
        PillCreator(80,40),
        PillCreator(120,40),
        PillCreator(160,40)
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