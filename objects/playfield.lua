local config = require "config"
local bounds = config.playfield

local Playfield = {
	top = bounds.top,
	right = bounds.right,
	bottom = bounds.bottom,
	left = bounds.left
}

function Playfield.draw()
	love.graphics.line(
		Playfield.top,
		Playfield.left,
		Playfield.right,
		Playfield.top,
		Playfield.right,
		Playfield.bottom,
		Playfield.left,
		Playfield.bottom,
		Playfield.top,
		Playfield.left
	)
end

return Playfield
