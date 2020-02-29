Object = require "libs.classic.classic"

TombCreator = Object:extend()

function TombCreator:new(x, y, width, height)
	self.x = x
	self.y = y
	self.width = width
	self.height = height
	self.top = self.y
	self.right = self.x + self.width
	self.bottom = self.y + self.height
	self.left = self.x
end

function TombCreator:draw()
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

function TombCreator:getBounds()
	return {
		top = self.top,
		right = self.right,
		bottom = self.bottom,
		left = self.left
	}
end
