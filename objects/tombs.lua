Object = require "libs.classic.classic"

local M = {}

M.TombCreator = Object:extend()

function M.TombCreator:new(x, y, width, height)
	self.x = x
	self.y = y
	self.width = width
	self.height = height
	self.top = self.y
	self.right = self.x + self.width
	self.bottom = self.y + self.height
	self.left = self.x
end

function M.TombCreator:draw()
	r, g, b, a = love.graphics.getColor()
	love.graphics.setColor(rgba(240, 0, 0))
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
	love.graphics.setColor(r, g, b, a)
end

function M.TombCreator:getBounds()
	return {
		top = self.top,
		right = self.right,
		bottom = self.bottom,
		left = self.left
	}
end

return M
