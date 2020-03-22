Object = require "libs.classic.classic"
require "libs.Colorized-for-Love.colorize"
local config = require "config"

Tomb = Object:extend()

function Tomb:new(x, y, width, height)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
end

function Tomb:draw()
    r, g, b, a = love.graphics.getColor()
    love.graphics.setColor(rgba(255, 0, 0))
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
    love.graphics.setColor(r, g, b, a)
end

TombArea = Object:extend()

-- function Point:new(x, y)
--     self.x = x or 0
--     self.y = y or 0
--   end

function TombArea:new(x, y)
    self.x = x
    self.y = y
    self.width = config.tombArea.width
    self.height = config.tombArea.height
    self.top = self.y
    self.right = self.x + self.width
    self.bottom = self.y + self.height
    self.left = self.x
    self.tomb = Tomb(config.column.width, config.row.height, config.tomb.width,
                     config.tomb.height)
    -- self.name = name
    -- self.hit = false
    -- self.hitDirection = "DOWN"
end

function TombArea:draw()
    -- love.graphics.draw(love.graphics.newImage("graphics/steps_up.png"), self.x,
    --                    self.y)
    r, g, b, a = love.graphics.getColor()
    love.graphics.setColor(rgba(255, 0, 0))
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
    love.graphics.setColor(r, g, b, a)

    self.tomb:draw()
end

return TombArea
