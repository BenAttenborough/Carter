Input = require "/libs/boipushy/Input"
Object = require "/libs/classic/classic"
player = require "/objects/player"
playfield = require "/objects/playfield"
tombCreator = require "/objects/tombs"
collision = require "/utilities/collision"
-- print("tombCreator", tombCreator)
-- print("isDirectionClear", isDirectionClear)

function bindInputs()
	input = Input()
	input:bind("right", "right")
	input:bind("left", "left")
	input:bind("up", "up")
	input:bind("down", "down")
end

function love.load()
	bindInputs()
	Game_Playfield = Playfield(0, 800, 600, 0)
	Carter = Player(10, 10, Game_Playfield)
	Tomb = TombCreator(100, 200, 50, 100)
	Tomb2 = TombCreator(300, 200, 50, 100)
	obstacles = {
		Tomb,
		Tomb2
	}
end

-- function isRightClear(target, obstacle)
-- 	if target.right <= obstacle.right then
-- 		if target.right >= obstacle.left and target.top < obstacle.bottom and target.bottom > obstacle.top then
-- 			return false
-- 		end
-- 	end
-- 	return true
-- end

-- function isLeftClear(target, obstacle)
-- 	if target.left >= obstacle.left then
-- 		if target.left <= obstacle.right and target.top < obstacle.bottom and target.bottom > obstacle.top then
-- 			return false
-- 		end
-- 	end
-- end

-- function isTopClear(target, obstacle)
-- 	if target.top >= obstacle.bottom then
-- 		if target.top <= obstacle.bottom and target.right > obstacle.left and target.left < obstacle.right then
-- 			return false
-- 		end
-- 	end
-- end

-- function isBottomClear(target, obstacle)
-- 	if target.bottom <= obstacle.top then
-- 		if target.bottom >= obstacle.top and target.right > obstacle.left and target.left < obstacle.right then
-- 			return false
-- 		end
-- 	end
-- end

-- function isDirectionClear(direction, target, obstacles)
-- 	offset = 1
-- 	if direction == "RIGHT" then
-- 		for i, obstacle in ipairs(obstacles) do
-- 			if isRightClear(target, obstacle) == false then
-- 				return false
-- 			end
-- 		end
-- 	end
-- 	if direction == "LEFT" then
-- 		for i, obstacle in ipairs(obstacles) do
-- 			if isLeftClear(target, obstacle) == false then
-- 				return false
-- 			end
-- 		end
-- 	end
-- 	if direction == "UP" then
-- 		for i, obstacle in ipairs(obstacles) do
-- 			if isTopClear(target, obstacle) == false then
-- 				return false
-- 			end
-- 		end
-- 	end
-- 	if direction == "DOWN" then
-- 		for i, obstacle in ipairs(obstacles) do
-- 			if isBottomClear(target, obstacle) == false then
-- 				return false
-- 			end
-- 		end
-- 	end
-- 	return true
-- end

function love.update(dt)
	if input:down("right", timestep) then
		target = Carter:getBounds()
		obstacle = Tomb:getBounds()
		if collision.isDirectionClear("RIGHT", target, obstacles) then
			Carter:moveRight()
		end
	end
	if input:down("left", timestep) then
		target = Carter:getBounds()
		obstacle = Tomb:getBounds()
		if collision.isDirectionClear("LEFT", target, obstacles) then
			Carter:moveLeft()
		end
	end
	if input:down("up", timestep) then
		target = Carter:getBounds()
		obstacle = Tomb:getBounds()
		if collision.isDirectionClear("UP", target, obstacles) then
			Carter:moveUp()
		end
	end
	if input:down("down", timestep) then
		target = Carter:getBounds()
		obstacle = Tomb:getBounds()
		if collision.isDirectionClear("DOWN", target, obstacles) then
			Carter:moveDown()
		end
	end
end

function love.draw()
	love.graphics.setBackgroundColor(0.8, 0.8, 0.8, 1)
	-- love.graphics.draw(mummy, mummyX, mummyY)
	love.graphics.draw(Carter.graphic, Carter.x, Carter.y)
	love.graphics.line(
		Game_Playfield.top,
		Game_Playfield.left,
		Game_Playfield.right,
		Game_Playfield.top,
		Game_Playfield.right,
		Game_Playfield.bottom,
		Game_Playfield.left,
		Game_Playfield.bottom,
		Game_Playfield.top,
		Game_Playfield.left
	)
	Tomb:draw()
	Tomb2:draw()
	playerInfo = "Player X: " .. Carter.x .. " Y: " .. Carter.y
	obstacleInfo = "Obstacle X: " .. Tomb.x .. " Y: " .. Tomb.y
	playerDimensions = "Player width: " .. Carter.width .. " height: " .. Carter.height

	love.graphics.print(playerInfo, 10, 10)
	love.graphics.print(obstacleInfo, 10, 25)
	love.graphics.print(playerDimensions, 10, 40)

	-- love.graphics.rectangle("line", Carter.x, Carter.y, Carter.width, Carter.height)
end
