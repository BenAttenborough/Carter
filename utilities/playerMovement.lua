local function isOnRow(target, path)
	if target.top >= path.top and target.bottom <= path.bottom then
		return true
	end
	return false
end

local function isOnCol(target, path)
	if target.left >= path.left and target.right <= path.right then
		return true
	end
	return false
end

local function checkRowPos(rows, target)
	for i, v in ipairs(rows) do
		if isOnRow(target, v) then
			return true
		end
	end
end

local function checkColPos(cols, target)
	for i, v in ipairs(cols) do
		if isOnCol(target, v) then
			return true
		end
	end
end

local function playerMovement(Carter, playableArea)
	local target = Carter:getBounds()
	local AllowedDirections = {h = checkRowPos(playableArea.rows, target), v = checkColPos(playableArea.cols, target)}
	locked = false
	if AllowedDirections.h then
		if input:down("right", timestep) and not locked then
			locked = true
			target = Carter:getBounds()
			Carter:moveRight()
		end
		if input:down("left", timestep) and not locked then
			locked = true
			target = Carter:getBounds()
			Carter:moveLeft()
		end
	end
	if AllowedDirections.v then
		if input:down("up", timestep) and not locked then
			locked = true
			target = Carter:getBounds()
			Carter:moveUp()
		end
		if input:down("down", timestep) and not locked then
			locked = true
			target = Carter:getBounds()
			Carter:moveDown()
		end
	end
end

return playerMovement
