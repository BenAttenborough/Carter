Object = require "/libs/classic/classic"

Player = Object:extend()

function Player:new(x, y, playfield)
	self.graphic = love.graphics.newImage("graphics/carter.png")
	self.x = x or 0
	self.y = y or 0
	self.speed = 5
	self.playfield = playfield
	self.width = self.graphic:getWidth()
	self.height = self.graphic:getHeight()
end

function Player:draw()
	love.graphics.draw(self.graphic, self.x, self.x)
end

function Player:moveRight()
	if (self.x < self.playfield.right - self.width) then
		self.x = self.x + self.speed
	end
end

function Player:moveLeft()
	if (self.x > self.playfield.left) then
		self.x = self.x - self.speed
	end
end

function Player:moveUp()
	if (self.y > self.playfield.top) then
		self.y = self.y - self.speed
	end
end

function Player:moveDown()
	if (self.y < self.playfield.bottom - self.height) then
		self.y = self.y + self.speed
	end
end

function Player:listenForInput()
	if input:down("right", timestep) then
		Carter:moveRight()
	end
	if input:down("left", timestep) then
		Carter:moveLeft()
	end
	if input:down("up", timestep) then
		Carter:moveUp()
	end
	if input:down("down", timestep) then
		Carter:moveDown()
	end
end
