addPills = require "objects.addPills"

local PillCreator = addPills.PillCreator


local function createPills()
    -- local pill = PillCreator(60,60)
    -- pill.draw()

    pillRowsStart = 20;
    pillRowsOffset = 20;

    -- Need to do this better
    -- As a grid of pills with x and y or row col recorded
    local pillRows = {
        PillCreator(17,30,"one"),
        PillCreator(165,30,"two"),
        PillCreator(320,30,"three"),
        PillCreator(470,30,"four"),
        PillCreator(615,30,"five"),
        PillCreator(760,30,"six"),
        PillCreator(17,160,"seven"),
        PillCreator(165,160,"eight"),
        PillCreator(320,160,"nine"),
        PillCreator(470,160,"ten"),
        PillCreator(615,160,"eleven"),
        PillCreator(760,160,"twelve"),
    }

    -- for i, v in ipairs(rows) do
    --     v:draw()
    -- end

	function pillRows.draw()
		for i, v in ipairs(pillRows) do
			v:draw()
		end
    end
    
    -- function pillRows.collide(collidee)
    -- end

	return pillRows


end

return createPills