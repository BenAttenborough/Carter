Object = require "libs.classic.classic"
require "libs.Colorized-for-Love.colorize"

local M = {}

TombArea = Object:extend()

function TombArea:new(x, y, name)
    self.x = x
    self.y = y
    -- self.width = 20
    -- self.height = 20
    -- self.top = self.y
    -- self.right = self.x + self.width
    -- self.bottom = self.y + self.height
    -- self.left = self.x
    -- self.name = name
    -- self.hit = false
    -- self.hitDirection = "DOWN"
end

function TombArea:draw()
    print("tomb area fired xx")
    love.graphics.draw(love.graphics.newImage("graphics/steps_up.png"), self.x,
                       self.y)
end

return TombArea
