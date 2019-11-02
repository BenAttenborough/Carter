path = require "../objects/path"
local RowCreator = path.RowCreator
local ColCreator = path.ColCreator

-- local M = {}

local function createPlayfield()
	rows = {
		RowCreator(0, 0),
		RowCreator(0, 120),
		RowCreator(0, 240),
		RowCreator(0, 360),
		RowCreator(0, 480)
	}
	cols = {
		ColCreator(0, 0),
		ColCreator(120, 0),
		ColCreator(240, 0),
		ColCreator(360, 0),
		ColCreator(480, 0),
		ColCreator(600, 0)
	}
	return rows, cols
end

return createPlayfield

-- return M
