Object = require "libs.classic.classic"
require "libs.Colorized-for-Love.colorize"

local M = {}

M.PillCreator = Object:extend()

function M.PillCreator:new(x, y, name)
    self.x = x
    self.y = y
    self.width = 20
    self.height = 20
    self.top = self.y
    self.right = self.x + self.width
    self.bottom = self.y + self.height
    self.left = self.x
    self.name = name
    self.hit = false
    self.hitDirection = "DOWN"
end

function M.PillCreator:draw()
    if self.hit then
        if self.hitDirection == "UP" then
            love.graphics.draw(love.graphics.newImage("graphics/steps_up.png"),
                               self.x, self.y)
        end
        if self.hitDirection == "RIGHT" then
            love.graphics.draw(love.graphics
                                   .newImage("graphics/steps_right.png"),
                               self.x, self.y)
        end
        if self.hitDirection == "DOWN" then
            love.graphics.draw(
                love.graphics.newImage("graphics/steps_down.png"), self.x,
                self.y)
        end
        if self.hitDirection == "LEFT" then
            love.graphics.draw(
                love.graphics.newImage("graphics/steps_left.png"), self.x,
                self.y)
        end

    end
end

return M;
