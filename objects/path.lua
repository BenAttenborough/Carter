Object = require "/libs/classic/classic"
require "/libs/Colorized-for-Love/colorize"

PathCreator = Object:extend()
RowCreator = Object:extend()
ColCreator = Object:extend()

function PathCreator:new(x, y, width, height)
	self.x = x
	self.y = y
	self.width = width
	self.height = height
	self.top = self.y
	self.right = self.x + self.width
	self.bottom = self.y + self.height
	self.left = self.x
end

function PathCreator:draw()
	love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
end

function PathCreator:getBounds()
	return {
		top = self.top,
		right = self.right,
		bottom = self.bottom,
		left = self.left
	}
end

function RowCreator:new(x, y)
	self.x = x
	self.y = y
	self.width = 655
	self.height = 60
	self.top = self.y
	self.right = self.x + self.width
	self.bottom = self.y + self.height
	self.left = self.x
end

function RowCreator:draw()
	-- print("color", love.graphics.getColor())
	r, g, b, a = love.graphics.getColor()
	love.graphics.setColor(rgba(77, 58, 6))
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
	love.graphics.setColor(r, g, b, a)
end

function RowCreator:getBounds()
	return {
		top = self.top,
		right = self.right,
		bottom = self.bottom,
		left = self.left
	}
end

function ColCreator:new(x, y)
	self.x = x
	self.y = y
	self.width = 55
	self.height = 540
	self.top = self.y
	self.right = self.x + self.width
	self.bottom = self.y + self.height
	self.left = self.x
end

function ColCreator:draw()
	r, g, b, a = love.graphics.getColor()
	love.graphics.setColor(rgba(77, 58, 6))
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
	love.graphics.setColor(r, g, b, a)
end

function ColCreator:getBounds()
	return {
		top = self.top,
		right = self.right,
		bottom = self.bottom,
		left = self.left
	}
end
