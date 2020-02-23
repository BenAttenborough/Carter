path = require "../objects/path"
local RowCreator = path.RowCreator
local ColCreator = path.ColCreator

-- local M = {}

local function createPlayfield()
	rows = {
		RowCreator(0, 0),
		RowCreator(0, 130),
		RowCreator(0, 260),
		RowCreator(0, 390),
		RowCreator(0, 520)
	}
	cols = {
		ColCreator(0, 0),
		ColCreator(150, 0),
		ColCreator(300, 0),
		ColCreator(450, 0),
		ColCreator(600, 0),
		ColCreator(750, 0) -- 700
	}
	local playableArea = {rows = rows, cols = cols}
	function playableArea.draw()
		for i, v in ipairs(rows) do
			v:draw()
		end
		for i, v in ipairs(cols) do
			v:draw()
		end
	end
	return playableArea
end

return createPlayfield

-- return M
