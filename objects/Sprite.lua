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
    self.width = self.graphicUp:getWidth()
    self.height = self.graphicUp:getHeight()
    self.top = self.y
    self.right = config.startingPos.x + self.width
    self.bottom = self.y + self.height
    self.left = self.x
    self.direction = "UP"
end

function Sprite:draw() love.graphics.draw(self.graphicCurrent, self.x, self.y) end

function Sprite:moveRight(vert, dt)
    self.graphicCurrent = self.graphicRight

    if (self.x < self.playfield.right - self.width) then
        self.x = self.x + self.speed * dt
        self.right = self.right + self.speed * dt
        self.left = self.left + self.speed * dt
        self.y = vert + vertOffset
        self.top = vert + vertOffset
        self.bottom = vert + vertOffset + self.height
        self.direction = "RIGHT"
    end
end

function Sprite:moveLeft(vert, dt)
    self.graphicCurrent = self.graphicLeft

    if (self.x > self.playfield.left) then
        self.x = self.x - (self.speed * dt)
        self.left = self.left - (self.speed * dt)
        self.right = self.right - (self.speed * dt)
        self.y = vert + vertOffset
        self.top = vert + vertOffset
        self.bottom = vert + vertOffset + self.height
        self.direction = "LEFT"
    end
end

function Sprite:moveUp(hort, dt)
    self.graphicCurrent = self.graphicUp

    if (self.y > self.playfield.top) then
        self.y = self.y - self.speed * dt
        self.top = self.top - self.speed * dt
        self.bottom = self.bottom - self.speed * dt
        self.x = hort + hortOffset
        self.left = hort + hortOffset
        self.right = hort + hortOffset + self.width
        self.direction = "UP"
    end
end

function Sprite:moveDown(hort, dt)
    self.graphicCurrent = self.graphicDown

    if (self.y < self.playfield.bottom - self.height) then
        self.y = self.y + self.speed * dt
        self.bottom = self.bottom + self.speed * dt
        self.top = self.top + self.speed * dt
        self.x = hort + hortOffset
        self.left = hort + hortOffset
        self.right = hort + hortOffset + self.width
        self.direction = "DOWN"
    end
end

function Sprite:getBounds()
    return {
        top = self.top,
        right = self.right,
        bottom = self.bottom,
        left = self.left
    }
end

return Sprite
