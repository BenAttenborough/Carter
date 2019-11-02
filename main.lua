local bindInputs = require "/utilities/bindInputs"
local playfield = require "/objects/playfield"
local player = require "/objects/player"
local CreatePlayableArea = require "/utilities/CreatePlayableArea"
local playerMovement = require "/utilities/playerMovement"

-- function isOnRow(target, path)
-- 	if target.top >= path.top and target.bottom <= path.bottom then
-- 		return true
-- 	end
-- 	return false
-- end

-- function isOnCol(target, path)
-- 	if target.left >= path.left and target.right <= path.right then
-- 		return true
-- 	end
-- 	return false
-- end

local Game_Playfield = Playfield(0, 800, 600, 0)
local Carter = Player(10, 100, Game_Playfield)
local rows, cols = CreatePlayableArea()

function love.load()
	bindInputs()
end

-- function checkRowPos(xrows, target)
-- 	for i, v in ipairs(xrows) do
-- 		if isOnRow(target, v) then
-- 			return true
-- 		end
-- 	end
-- end

-- function checkColPos(xcols, target)
-- 	for i, v in ipairs(xcols) do
-- 		if isOnCol(target, v) then
-- 			return true
-- 		end
-- 	end
-- end

function love.update(dt)
	-- playerMovement(allowedDirections, Carter, rows, cols)
	playerMovement(Carter, rows, cols)
	-- locked = false
	-- if allowHorz then
	-- 	if input:down("right", timestep) and not locked then
	-- 		locked = true
	-- 		target = Carter:getBounds()
	-- 		Carter:moveRight()
	-- 		allowHorz = checkRowPos(rows, target)
	-- 		allowVert = checkColPos(cols, target)
	-- 	end
	-- 	if input:down("left", timestep) and not locked then
	-- 		locked = true
	-- 		target = Carter:getBounds()
	-- 		Carter:moveLeft()
	-- 		allowHorz = checkRowPos(rows, target)
	-- 		allowVert = checkColPos(cols, target)
	-- 	end
	-- end
	-- if allowVert then
	-- 	if input:down("up", timestep) and not locked then
	-- 		locked = true

	-- 		target = Carter:getBounds()
	-- 		Carter:moveUp()
	-- 		allowHorz = checkRowPos(rows, target)
	-- 		allowVert = checkColPos(cols, target)
	-- 	end
	-- 	if input:down("down", timestep) and not locked then
	-- 		locked = true
	-- 		target = Carter:getBounds()
	-- 		Carter:moveDown()
	-- 		allowHorz = checkRowPos(rows, target)
	-- 		allowVert = checkColPos(cols, target)
	-- 	end
	-- end
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
	for i, v in ipairs(rows) do
		v:draw()
	end
	for i, v in ipairs(cols) do
		v:draw()
	end
	love.graphics.draw(Carter.graphic, Carter.x, Carter.y)

	playerInfo = "Player X: " .. Carter.x .. " Y: " .. Carter.y
	playerDimensions = "Player width: " .. Carter.width .. " height: " .. Carter.height

	love.graphics.print(playerInfo, 10, 10)
	-- horzMes = ""
	-- if allowHorz then
	-- 	horzMes = "True"
	-- else
	-- 	horzMes = "False"
	-- end
	-- love.graphics.print("Allow Horz?:" .. horzMes, 10, 40)
end
