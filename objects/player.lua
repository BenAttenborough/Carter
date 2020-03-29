local Sprite = require "objects.Sprite"

local Player = Sprite:extend()

local vertOffset = 15
local hortOffset = 13

function Player:new(config, playfield)
    Player.super.new(self, config, playfield)
    self.score = 0
end

function Player:moveRight(vert, dt)
    self.graphicCurrent = self.graphicRight
    if (self.right < self.playfield.right + 10) then
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
    self.graphicCurrent = self.graphicLeft

    if (self.left > self.playfield.left - 10) then
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

function Player:moveDown(hort, dt)
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

return Player
