Object = require "/libs/classic/classic"

Playfield = Object:extend()

function Playfield:new(top, right, bottom, left)
	self.top = top
	self.right = right
	self.bottom = bottom
	self.left = left
end
