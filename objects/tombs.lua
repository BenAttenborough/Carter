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
	self.open = false
end

function M.TombCreator:draw()
	r, g, b, a = love.graphics.getColor()
	if self.open then
		love.graphics.setColor(rgba(240, 0, 0))
	else
		love.graphics.setColor(rgba(0, 0, 0))
	end
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
