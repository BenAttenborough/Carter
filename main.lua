Input = require "/libs/boipushy/Input"
Object = require "/libs/classic/classic"
player = require "/objects/player"
playfield = require "/objects/playfield"
tombCreator = require "/objects/tombs"

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
end

function isDirectionClear(direction, top, right, bottom, left)
	-- print(Tomb.x)

	-- x axis = 10 to 70
	-- y axis = 10 to 180
	-- if x >= Tomb.left and x <= Tomb.right then
	-- 	if y >= Tomb.top and y <= Tom.bottom then
	-- 		return false
	-- 	end
	-- end

	-- playerRight = "Right: " .. right

	-- print(playerRight)

	if direction == "RIGHT" then
		if right <= Tomb.right then
			if right >= Tomb.left and top <= Tomb.bottom and bottom >= Tomb.top then
				return false
			end
		end
	end
	if direction == "LEFT" then
		if left >= Tomb.left then
			if left <= Tomb.right and top <= Tomb.bottom and bottom >= Tomb.top then
				return false
			end
		end
	end
	if direction == "UP" then
		if top >= Tomb.top then
			if top <= Tomb.bottom + 5 and right >= Tomb.left and left <= Tomb.right then
				return false
			end
		end
	end
	if direction == "DOWN" then
		-- if top >= Tomb.top then
		if bottom <= Tomb.top then
			if bottom >= Tomb.top - 5 and right >= Tomb.left and left <= Tomb.right then
				return false
			end
		end
	end
	return true
end

function love.update(dt)
	-- Carter:listenForInput()
	if input:down("right", timestep) then
		-- print("Carter.right", Carter.right)
		-- print("Carter.x", Carter.x)
		if isDirectionClear("RIGHT", Carter.top, Carter.right, Carter.bottom, Carter.left) then
			Carter:moveRight()
		end
	-- Carter:moveRight()
	end
	if input:down("left", timestep) then
		if isDirectionClear("LEFT", Carter.top, Carter.right, Carter.bottom, Carter.left) then
			Carter:moveLeft()
		end
	end
	if input:down("up", timestep) then
		if isDirectionClear("UP", Carter.top, Carter.right, Carter.bottom, Carter.left) then
			Carter:moveUp()
		end
	end
	if input:down("down", timestep) then
		if isDirectionClear("DOWN", Carter.top, Carter.right, Carter.bottom, Carter.left) then
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
	playerInfo = "Player X: " .. Carter.x .. " Y: " .. Carter.y
	obstacleInfo = "Obstacle X: " .. Tomb.x .. " Y: " .. Tomb.y

	love.graphics.print(playerInfo, 10, 10)
	love.graphics.print(obstacleInfo, 10, 25)

	love.graphics.rectangle("line", Carter.x, Carter.y, Carter.width, Carter.height)
end
