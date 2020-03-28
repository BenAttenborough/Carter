local Sprite = require "objects.Sprite"

local Mummy = Sprite:extend()

function Mummy:new(config, playfield) Mummy.super.new(self, config, playfield) end

function Mummy:move(player, playableArea, dt)
    print("Player y " .. player.y)
    print("Mummy y " .. self.y)
    -- if player.y < self.y then self:moveUp() end

    -- local target = self:getBounds()
    -- local playableAreaPosition = {
    --     h = checkRowPos(playableArea.rows, target),
    --     v = checkColPos(playableArea.cols, target)
    -- }
    -- locked = false
    -- if playableAreaPosition.h > 0 then
    --     local currentRowTop = playableArea.rows[playableAreaPosition.h].top
    --     -- print("currentRowTop", currentRowTop)
    --     if input:down("right", timestep) and not locked then
    --         locked = true
    --         target = self:getBounds()
    --         self:moveRight(currentRowTop, dt)
    --     end
    --     if input:down("left", timestep) and not locked then
    --         locked = true
    --         target = self:getBounds()
    --         self:moveLeft(currentRowTop, dt)
    --     end
    -- end
    -- if playableAreaPosition.v > 0 then
    --     local currentColumnLeft = playableArea.cols[playableAreaPosition.v].left
    --     if input:down("up", timestep) and not locked then
    --         locked = true
    --         target = self:getBounds()
    --         self:moveUp(currentColumnLeft, dt)
    --     end
    --     if input:down("down", timestep) and not locked then
    --         locked = true
    --         target = self:getBounds()
    --         self:moveDown(currentColumnLeft, dt)
    --     end
    -- end
end

return Mummy
