Object = require "/libs/classic/classic"

Player = Object:extend()

function Player:new(x, y)
	self.graphic = love.graphics.newImage("games/carter/graphics/carter.png")
	self.x = x or 0
	self.y = y or 0
	self.speed = 5
end

function Player:draw()
	love.graphics.draw(self.graphic, self.x, self.x)
end

function Player:moveRight()
	self.x = self.x + self.speed
end

function Player:moveLeft()
	self.x = self.x - self.speed
end

function Player:moveUp()
	self.y = self.y - self.speed
end

function Player:moveDown()
	self.y = self.y + self.speed
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
