Object = require "libs.classic.classic"

Sprite = Object:extend()

local vertOffset = 15
local hortOffset = 13

function Sprite:new(config, playfield)
    self.graphicUp = love.graphics.newImage(config.graphic.up)
    self.graphicDown = love.graphics.newImage(config.graphic.down)
    self.graphicLeft = love.graphics.newImage(config.graphic.left)
    self.graphicRight = love.graphics.newImage(config.graphic.right)
    self.graphicCurrent = self.graphicRight
    self.x = config.startingPos.x or 0
    self.y = config.startingPos.y or 0
    self.speed = config.startingSpeed or 200
    self.playfield = playfield
    self.playfield.left = self.playfield.left + hortOffset
    self.playfield.top = self.playfield.top + vertOffset
    self.playfield.right = self.playfield.right - hortOffset
    self.playfield.bottom = self.playfield.bottom - vertOffset
    self.width = self.graphicCurrent:getWidth()
    self.height = self.graphicCurrent:getHeight()
    self.top = self.y
    self.right = config.startingPos.x + self.width
    self.bottom = self.y + self.height
    self.left = self.x
    self.direction = "UP"
end

function Sprite:draw() love.graphics.draw(self.graphicCurrent, self.x, self.y) end

function Sprite:getBounds()
    return {
        top = self.top,
        right = self.right,
        bottom = self.bottom,
        left = self.left
    }
end

return Sprite
