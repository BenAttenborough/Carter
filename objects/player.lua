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

function isDirectionClear(x, y)
	-- print(Tomb.x)

	-- x axis = 10 to 70
	-- y axis = 10 to 180
	if x >= 50 and x <= 120 then
		if y >= 50 and y <= 180 then
			return false
		end
	end
	return true
end

-- function Player:listenForInput()
-- 	if input:down("right", timestep) then
-- 		if isDirectionClear(self.x + self.width, self.y + self.height) then
-- 			Carter:moveRight()
-- 		end
-- 	end
-- 	if input:down("left", timestep) then
-- 		Carter:moveLeft()
-- 	end
-- 	if input:down("up", timestep) then
-- 		Carter:moveUp()
-- 	end
-- 	if input:down("down", timestep) then
-- 		Carter:moveDown()
-- 	end
-- end
