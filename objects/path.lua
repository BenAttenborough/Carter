Object = require "libs.classic.classic"
require "libs.Colorized-for-Love.colorize"

local M = {}

local PathCreator = Object:extend()
M.RowCreator = Object:extend()
M.ColCreator = Object:extend()

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

function M.RowCreator:new(x, y)
	self.x = x
	self.y = y
	self.width = 800
	self.height = 80
	self.top = self.y
	self.right = self.x + self.width
	self.bottom = self.y + self.height
	self.left = self.x
end

function M.RowCreator:draw()
	r, g, b, a = love.graphics.getColor()
	love.graphics.setColor(rgba(77, 58, 6))
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
	love.graphics.setColor(r, g, b, a)
end

function M.RowCreator:getBounds()
	return {
		top = self.top,
		right = self.right,
		bottom = self.bottom,
		left = self.left
	}
end

function M.ColCreator:new(x, y)
	self.x = x
	self.y = y
	self.width = 55
	self.height = 600
	self.top = self.y
	self.right = self.x + self.width
	self.bottom = self.y + self.height
	self.left = self.x
end

function M.ColCreator:draw()
	r, g, b, a = love.graphics.getColor()
	love.graphics.setColor(rgba(77, 58, 6))
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
	love.graphics.setColor(r, g, b, a)
end

function M.ColCreator:getBounds()
	return {
		top = self.top,
		right = self.right,
		bottom = self.bottom,
		left = self.left
	}
end

return M
