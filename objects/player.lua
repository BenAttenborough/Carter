Object = require "libs.classic.classic"

Player = Object:extend()

local vertOffset = 15
local hortOffset = 13

function Player:new(playerStartingPos, playfield)
    self.graphic = love.graphics.newImage("graphics/carter_down.png")
    self.x = playerStartingPos.x or 0
    self.y = playerStartingPos.y or 0
    self.speed = 200
    self.playfield = playfield
    self.playfield.left = self.playfield.left + hortOffset
    self.playfield.top = self.playfield.top + vertOffset
    self.playfield.right = self.playfield.right - hortOffset
    self.playfield.bottom = self.playfield.bottom - vertOffset
    self.width = self.graphic:getWidth()
    self.height = self.graphic:getHeight()
    self.top = self.y
    self.right = playerStartingPos.x + self.width
    self.bottom = self.y + self.height
    self.left = self.x
    self.direction = "DOWN"
end

function Player:draw() love.graphics.draw(self.graphic, self.x, self.y) end

function Player:moveRight(vert, dt)
    self.graphic = love.graphics.newImage("graphics/carter_right.png")

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

function Player:moveLeft(vert, dt)
    self.graphic = love.graphics.newImage("graphics/carter_left.png")

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

function Player:moveUp(hort, dt)
    self.graphic = love.graphics.newImage("graphics/carter_up.png")

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

function Player:moveDown(hort, dt)
    self.graphic = love.graphics.newImage("graphics/carter_down.png")

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

function Player:getBounds()
    return {
        top = self.top,
        right = self.right,
        bottom = self.bottom,
        left = self.left
    }
end
