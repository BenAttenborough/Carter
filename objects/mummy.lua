local Sprite = require "objects.Sprite"

local function isOnRow(target, path)
    if target.top >= path.top and target.bottom <= path.bottom then
        return true
    end
    return false
end

local function checkRowPos(rows, target)
    for i, v in ipairs(rows) do if isOnRow(target, v) then return i end end
    return 0
end

local function isOnCol(target, path)
    if target.left >= path.left and target.right <= path.right then
        return true
    end
    return false
end

local function checkColPos(cols, target)
    for i, v in ipairs(cols) do if isOnCol(target, v) then return i end end
    return 0
end

local Mummy = Sprite:extend()

function Mummy:new(config, playfield) Mummy.super.new(self, config, playfield) end

function Mummy:moveUp(dt)
    self.graphicCurrent = self.graphicUp
    self.y = self.y - self.speed * dt
    self.top = self.top - self.speed * dt
    self.bottom = self.bottom - self.speed * dt
end

function Mummy:moveDown(dt)
    self.graphicCurrent = self.graphicDown
    self.y = self.y + self.speed * dt
    self.top = self.top + self.speed * dt
    self.bottom = self.bottom + self.speed * dt
end

function Mummy:move(player, playableArea, dt)
    local rowPos = checkRowPos(playableArea.rows, self)
    -- print("rowPos: " .. rowPos)

    local colPos = checkRowPos(playableArea.rows, self)
    -- print("colPos: " .. colPos)

    -- Calculate distances
    local playerDistanceX = 0
    local playerDistanceY = 0
    local directionX = ""
    local directionY = ""

    if player.y < self.y - 5 then
        playerDistanceY = self.y - player.y
        directionY = "UP"
        -- print("playerDistanceX " .. playerDistanceX)
        -- self:moveUp(dt)
    elseif player.y > self.y + 5 then
        playerDistanceY = player.y - self.y
        directionY = "DOWN"
        -- print("playerDistanceX " .. playerDistanceX)
        -- self:moveDown(dt)
    end

    if player.x < self.x - 5 then
        playerDistanceX = self.x - player.x
        directionX = "LEFT"
        -- print("playerDistanceX " .. playerDistanceX)
        -- self:moveUp(dt)
    elseif player.x > self.x + 5 then
        playerDistanceX = player.x - self.x
        directionX = "RIGHT"
        -- print("playerDistanceX " .. playerDistanceX)
        -- self:moveDown(dt)
    end

    if playerDistanceX > playerDistanceY then
        print("xPlayer is further " .. directionX .. " than " .. directionY)
    else
        print("Player is further " .. directionY .. " than " .. directionX)
        -- up down
        if directionY == "UP" then
            self:moveUp(dt)
        elseif directionY == "DOWN" then
            self:moveDown(dt)
        end

    end

end

return Mummy
