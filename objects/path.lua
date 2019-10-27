Object = require "/libs/classic/classic"

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
	self.width = 500
	self.height = 75
	self.top = self.y
	self.right = self.x + self.width
	self.bottom = self.y + self.height
	self.left = self.x
end

function RowCreator:draw()
	love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
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
	self.height = 400
	self.top = self.y
	self.right = self.x + self.width
	self.bottom = self.y + self.height
	self.left = self.x
end

function ColCreator:draw()
	love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
end

function ColCreator:getBounds()
	return {
		top = self.top,
		right = self.right,
		bottom = self.bottom,
		left = self.left
	}
end
