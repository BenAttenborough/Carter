local function isOnRow(target, path)
	if target.top >= path.top and target.bottom <= path.bottom then
		return true
	end
	return false
end

local function isOnCol(target, path)
	print("target.left", target.left)
	print("path.left", path.left)
	if target.left >= path.left and target.right <= path.right then
		return true
	end
	return false
end

local function checkRowPos(xrows, target)
	for i, v in ipairs(xrows) do
		if isOnRow(target, v) then
			return true
		end
	end
end

local function checkColPos(xcols, target)
	print("checkColPos")
	for i, v in ipairs(xcols) do
		print("xcols v", v)
		if isOnCol(target, v) then
			return true
		end
	end
end

local function playerMovement(Carter, rows, cols)
	local target = Carter:getBounds()
	local allowedDirections = {h = checkRowPos(rows, target), v = checkColPos(cols, target)}
	locked = false
	if allowedDirections.h then
		if input:down("right", timestep) and not locked then
			locked = true
			target = Carter:getBounds()
			Carter:moveRight()
			allowedDirections.h = checkRowPos(rows, target)
			allowedDirections.v = checkColPos(cols, target)
		end
		if input:down("left", timestep) and not locked then
			locked = true
			target = Carter:getBounds()
			Carter:moveLeft()
			allowedDirections.h = checkRowPos(rows, target)
			allowedDirections.v = checkColPos(cols, target)
		end
	end
	if allowedDirections.v then
		if input:down("up", timestep) and not locked then
			locked = true

			target = Carter:getBounds()
			Carter:moveUp()
			allowedDirections.h = checkRowPos(rows, target)
			allowedDirections.v = checkColPos(cols, target)
		end
		if input:down("down", timestep) and not locked then
			locked = true
			target = Carter:getBounds()
			Carter:moveDown()
			allowedDirections.h = checkRowPos(rows, target)
			allowedDirections.v = checkColPos(cols, target)
		end
	end
end

return playerMovement
