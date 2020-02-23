Object = require "/libs/classic/classic"

Player = Object:extend()

function Player:new(playerStartingPos, playfield)
	-- self.graphic = love.graphics.newImage("graphics/carter.png")
	self.graphic = love.graphics.newImage("graphics/carter2.png")
	self.x = playerStartingPos.x or 0
	self.y = playerStartingPos.y or 0
	self.speed = 5
	self.playfield = playfield
	self.width = self.graphic:getWidth()
	self.height = self.graphic:getHeight()
	self.top = self.y
	self.right = playerStartingPos.x + self.width
	self.bottom = self.y + self.height
	self.left = self.x
end

function Player:draw()
	love.graphics.draw(self.graphic, self.x, self.y)
end

local vertOffset = 15
local hortOffset = 13

function Player:moveRight(vert)
	if (self.x < self.playfield.right - self.width) then
		self.x = self.x + self.speed
		self.right = self.right + self.speed
		self.left = self.left + self.speed

		self.y = vert + vertOffset
		self.top = vert + vertOffset
		self.bottom = vert + vertOffset + self.height
	end
end

function Player:moveLeft(vert)
	if (self.x > self.playfield.left) then
		self.x = self.x - self.speed
		self.left = self.left - self.speed
		self.right = self.right - self.speed

		self.y = vert + vertOffset
		self.top = vert + vertOffset
		self.bottom = vert + vertOffset + self.height
	end
end

function Player:moveUp(hort)
	if (self.y > self.playfield.top) then
		self.y = self.y - self.speed
		self.top = self.top - self.speed
		self.bottom = self.bottom - self.speed

		self.x = hort + hortOffset
		self.left = hort + hortOffset
		self.right = hort + hortOffset + self.width
	end
end

function Player:moveDown(hort)
	if (self.y < self.playfield.bottom - self.height) then
		self.y = self.y + self.speed
		self.bottom = self.bottom + self.speed
		self.top = self.top + self.speed

		self.x = hort + hortOffset
		self.left = hort + hortOffset
		self.right = hort + hortOffset + self.width
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
