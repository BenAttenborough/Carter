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

-- TODO: Return number, 0 for not on row
local function checkRowPos(rows, target)
	for i, v in ipairs(rows) do
		if isOnRow(target, v) then
			return i
		end
	end
	return 0
end

local function checkColPos(cols, target)
	for i, v in ipairs(cols) do
		if isOnCol(target, v) then
			return i
		end
	end
	return 0
end

local function convertNumToBool(num)
	if num > 0 then
		return true
	else
		return false
	end
end

local function playerMovement(Carter, playableArea)
	local target = Carter:getBounds()
	local playableAreaPosition = {
		h = checkRowPos(playableArea.rows, target),
		v = checkColPos(playableArea.cols, target)
	}
	locked = false
	if playableAreaPosition.h > 0 then
		local testVert = playableArea.rows[playableAreaPosition.h].top
		-- print("testVert", testVert)
		if input:down("right", timestep) and not locked then
			locked = true
			target = Carter:getBounds()
			Carter:moveRight(testVert)
		end
		if input:down("left", timestep) and not locked then
			locked = true
			target = Carter:getBounds()
			Carter:moveLeft(testVert)
		end
	end
	if playableAreaPosition.v > 0 then
		local testHort = playableArea.cols[playableAreaPosition.v].left
		if input:down("up", timestep) and not locked then
			locked = true
			target = Carter:getBounds()
			Carter:moveUp(testHort)
		end
		if input:down("down", timestep) and not locked then
			locked = true
			target = Carter:getBounds()
			Carter:moveDown(testHort)
		end
	end
end

return playerMovement
