Input = require "/libs/boipushy/Input"
Object = require "/libs/classic/classic"
player = require "/objects/player"
playfield = require "/objects/playfield"
tombCreator = require "/objects/tombs"
collision = require "/utilities/collision"
require "/objects/path"

function bindInputs()
	input = Input()
	input:bind("right", "right")
	input:bind("left", "left")
	input:bind("up", "up")
	input:bind("down", "down")
end

function isOnRow(target, path)
	if target.top >= path.top and target.bottom <= path.bottom then
		return true
	end
	return false
end

function isOnCol(target, path)
	if target.left >= path.left and target.right <= path.right then
		return true
	end
	return false
end

function createPlayfield()
	rows = {
		RowCreator(0, 0),
		RowCreator(0, 120),
		RowCreator(0, 240),
		RowCreator(0, 360),
		RowCreator(0, 480)
	}
	cols = {
		ColCreator(0, 0),
		ColCreator(120, 0),
		ColCreator(240, 0),
		ColCreator(360, 0),
		ColCreator(480, 0),
		ColCreator(600, 0)
	}
	return rows, cols
end

function love.load()
	-- timestep = 0.1
	locked = false
	bindInputs()
	Game_Playfield = Playfield(0, 800, 600, 0)
	Carter = Player(10, 100, Game_Playfield)
	-- Tomb = TombCreator(100, 200, 50, 100)
	-- Tomb2 = TombCreator(300, 200, 50, 100)
	-- obstacles = {
	-- 	Tomb,
	-- 	Tomb2
	-- }
	rows, cols = createPlayfield()
	allowHorz = true
	allowVert = true
end

function checkRowPos(xrows, target)
	for i, v in ipairs(xrows) do
		if isOnRow(target, v) then
			-- print("Row" .. i .. "clear")
			return true
		end
	end
end

function checkColPos(xcols, target)
	for i, v in ipairs(xcols) do
		if isOnCol(target, v) then
			-- print("Row" .. i .. "clear")
			return true
		end
	end
end

function love.update(dt)
	locked = false
	if allowHorz then
		if input:down("right", timestep) and not locked then
			locked = true
			target = Carter:getBounds()
			-- obstacle = Tomb:getBounds()
			-- if collision.isDirectionClear("RIGHT", target, obstacles) then
			-- 	Carter:moveRight()
			-- end
			Carter:moveRight()
			allowHorz = checkRowPos(rows, target)
			allowVert = checkColPos(cols, target)
		end
		if input:down("left", timestep) and not locked then
			locked = true

			target = Carter:getBounds()
			-- obstacle = Tomb:getBounds()
			-- if collision.isDirectionClear("LEFT", target, obstacles) then
			-- 	Carter:moveLeft()
			-- end
			Carter:moveLeft()
			allowHorz = checkRowPos(rows, target)
			allowVert = checkColPos(cols, target)
		end
	end
	if allowVert then
		if input:down("up", timestep) and not locked then
			locked = true

			target = Carter:getBounds()
			-- obstacle = Tomb:getBounds()
			-- if collision.isDirectionClear("UP", target, obstacles) then
			-- 	Carter:moveUp()
			-- end
			Carter:moveUp()
			allowHorz = checkRowPos(rows, target)
			allowVert = checkColPos(cols, target)
		end
		if input:down("down", timestep) and not locked then
			locked = true

			target = Carter:getBounds()
			-- obstacle = Tomb:getBounds()
			-- if collision.isDirectionClear("DOWN", target, obstacles) then
			-- 	Carter:moveDown()
			-- end
			Carter:moveDown()
			allowHorz = checkRowPos(rows, target)
			allowVert = checkColPos(cols, target)
		end
	end
end

function love.draw()
	love.graphics.setBackgroundColor(0.8, 0.8, 0.8, 1)
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
	-- Tomb:draw()
	-- Tomb2:draw()
	-- row1:draw()
	-- row2:draw()
	-- row3:draw()
	-- print("rows", rows)
	for i, v in ipairs(rows) do
		v:draw()
	end
	for i, v in ipairs(cols) do
		v:draw()
	end
	love.graphics.draw(Carter.graphic, Carter.x, Carter.y)

	playerInfo = "Player X: " .. Carter.x .. " Y: " .. Carter.y
	-- obstacleInfo = "Obstacle X: " .. Tomb.x .. " Y: " .. Tomb.y
	playerDimensions = "Player width: " .. Carter.width .. " height: " .. Carter.height

	love.graphics.print(playerInfo, 10, 10)
	-- love.graphics.print(obstacleInfo, 10, 25)
	horzMes = ""
	if allowHorz then
		horzMes = "True"
	else
		horzMes = "False"
	end
	love.graphics.print("Allow Horz?:" .. horzMes, 10, 40)
end
