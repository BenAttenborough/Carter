Object = require "/libs/classic/classic"

Player = Object:extend()

function Player:new(x, y, playfield)
	-- self.graphic = love.graphics.newImage("graphics/carter.png")
	self.graphic = love.graphics.newImage("graphics/player.png")
	self.x = x or 0
	self.y = y or 0
	self.speed = 5
	self.playfield = playfield
	self.width = self.graphic:getWidth()
	self.height = self.graphic:getHeight()
	self.top = self.y
	self.right = x + self.width
	self.bottom = self.y + self.height
	self.left = self.x
end

function Player:draw()
	love.graphics.draw(self.graphic, self.x, self.x)
end

function Player:moveRight()
	if (self.x < self.playfield.right - self.width) then
		self.x = self.x + self.speed
		self.right = self.right + self.speed
		self.left = self.left + self.speed
	end
end

function Player:moveLeft()
	if (self.x > self.playfield.left) then
		self.x = self.x - self.speed
		self.left = self.left - self.speed
		self.right = self.right - self.speed
	end
end

function Player:moveUp()
	if (self.y > self.playfield.top) then
		self.y = self.y - self.speed
		self.top = self.top - self.speed
		self.bottom = self.bottom - self.speed
	end
end

function Player:moveDown()
	if (self.y < self.playfield.bottom - self.height) then
		self.y = self.y + self.speed
		self.bottom = self.bottom + self.speed
		self.top = self.top + self.speed
	end
end

function Player:getBounds()
	return {
		top = self.top,
		right = self.right,
		bottom = self.bottom,
		left = self.left
	}
end
