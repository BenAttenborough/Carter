Object = require "libs.classic.classic"

Sprite = Object:extend()

local vertOffset = 15
local hortOffset = 13

function Sprite:new(startingPos, playfield, graphic, iniSpeed)
    self.graphic = love.graphics.newImage(graphic)
    self.x = startingPos.x or 0
    self.y = startingPos.y or 0
    self.speed = iniSpeed or 200
    self.playfield = playfield
    self.playfield.left = self.playfield.left + hortOffset
    self.playfield.top = self.playfield.top + vertOffset
    self.playfield.right = self.playfield.right - hortOffset
    self.playfield.bottom = self.playfield.bottom - vertOffset
    self.width = self.graphic:getWidth()
    self.height = self.graphic:getHeight()
    self.top = self.y
    self.right = startingPos.x + self.width
    self.bottom = self.y + self.height
    self.left = self.x
    self.direction = "DOWN"
end

function Sprite:draw() love.graphics.draw(self.graphic, self.x, self.y) end

return Sprite
