local utils = {}

function isRightClear(target, obstacle)
    if target.right <= obstacle.right then
        if target.right >= obstacle.left and target.top < obstacle.bottom and
            target.bottom > obstacle.top then return false end
    end
    return true
end

function isLeftClear(target, obstacle)
    if target.left >= obstacle.left then
        if target.left <= obstacle.right and target.top < obstacle.bottom and
            target.bottom > obstacle.top then return false end
    end
end

function isTopClear(target, obstacle)
    if target.top >= obstacle.bottom then
        if target.top <= obstacle.bottom and target.right > obstacle.left and
            target.left < obstacle.right then return false end
    end
end

function isBottomClear(target, obstacle)
    if target.bottom <= obstacle.top then
        if target.bottom >= obstacle.top and target.right > obstacle.left and
            target.left < obstacle.right then return false end
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

function hasCollided(target, obstacle)
    -- print("target.right")
    -- print(target.right)
    -- print("obstacle.left")
    -- print(obstacle.left)
    -- if target.right > obstacle.left and target.left < obstacle.right - (target.width + 10) and target.top < obstacle.bottom and target.bottom < obstacle.top - (target.height + 10) then
    -- 	return true
    -- end
    -- return false

    return target.left < obstacle.left + obstacle.width and obstacle.left <
               target.left + target.width and target.top < obstacle.top +
               obstacle.height and obstacle.top < target.top + target.height

end

-- Collision detection function;
-- Returns true if two boxes overlap, false if they don't;
-- x1,y1 are the top-left coords of the first box, while w1,h1 are its width and height;
-- x2,y2,w2 & h2 are the same, but for the second box.
function CheckCollision(x1, y1, w1, h1, x2, y2, w2, h2)
    return x1 < x2 + w2 and x2 < x1 + w1 and y1 < y2 + h2 and y2 < y1 + h1
end

utils.isDirectionClear = isDirectionClear
utils.hasCollided = hasCollided

return utils
