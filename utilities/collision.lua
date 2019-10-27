local utils = {}

function isRightClear(target, obstacle)
	if target.right <= obstacle.right then
		if target.right >= obstacle.left and target.top < obstacle.bottom and target.bottom > obstacle.top then
			return false
		end
	end
	return true
end

function isLeftClear(target, obstacle)
	if target.left >= obstacle.left then
		if target.left <= obstacle.right and target.top < obstacle.bottom and target.bottom > obstacle.top then
			return false
		end
	end
end

function isTopClear(target, obstacle)
	if target.top >= obstacle.bottom then
		if target.top <= obstacle.bottom and target.right > obstacle.left and target.left < obstacle.right then
			return false
		end
	end
end

function isBottomClear(target, obstacle)
	if target.bottom <= obstacle.top then
		if target.bottom >= obstacle.top and target.right > obstacle.left and target.left < obstacle.right then
			return false
		end
	end
end

function isDirectionClear(direction, target, obstacles)
	offset = 1
	if direction == "RIGHT" then
		for i, obstacle in ipairs(obstacles) do
			if isRightClear(target, obstacle) == false then
				return false
			end
		end
	end
	if direction == "LEFT" then
		for i, obstacle in ipairs(obstacles) do
			if isLeftClear(target, obstacle) == false then
				return false
			end
		end
	end
	if direction == "UP" then
		for i, obstacle in ipairs(obstacles) do
			if isTopClear(target, obstacle) == false then
				return false
			end
		end
	end
	if direction == "DOWN" then
		for i, obstacle in ipairs(obstacles) do
			if isBottomClear(target, obstacle) == false then
				return false
			end
		end
	end
	return true
end

-- Path
-- function isOnPath(x)
-- end

utils.isDirectionClear = isDirectionClear

return utils
