Object = require "libs.classic.classic"
require "libs.Colorized-for-Love.colorize"

local M = {}

M.PillCreator = Object:extend()

function M.PillCreator:new(x, y, name)
	self.x = x
	self.y = y
	self.width = 20
	self.height = 20
	self.top = self.y
	self.right = self.x + self.width
	self.bottom = self.y + self.height
	self.left = self.x
	self.name = name
	self.hit = false
end

function M.PillCreator:draw()
	r, g, b, a = love.graphics.getColor()
	if self.hit then 
		love.graphics.setColor(rgba(255, 255, 255))
	else
		love.graphics.setColor(rgba(77, 58, 6))
	end
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
	love.graphics.setColor(r, g, b, a)
end

return M;