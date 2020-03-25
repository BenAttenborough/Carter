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

Pill = Object:extend()

function Pill:new(x, y)
    self.x = x
    self.y = y
    self.graphic = love.graphics.newImage("graphics/steps_right.png")
end

function Pill:draw() love.graphics.draw(self.graphic, self.x, self.y) end

function createPills(x, y)
    local pills = {}

    for row = 1, 3 do
        pills[row] = {} -- create a new row
        for col = 1, 4 do
            if row ~= 2 then
                -- pills[row][col] = Pill(row * 10, col * 10)
                pills[row][col] = Pill(config.pillRowStart +
                                           (config.pillRowOffset * (col - 1)),
                                       config.pillColStart +
                                           (config.pillColOffset * (row - 1)))
            else
                if col ~= 2 and col ~= 3 then
                    pills[row][col] = Pill(
                                          config.pillRowStart +
                                              (config.pillRowOffset * (col - 1)),
                                          config.pillColStart +
                                              (config.pillColOffset * (row - 1)))
                else
                    pills[row][col] = false
                end
            end
        end
    end

    return pills
end

Pills = Object:extend()

function Pills:new(x, y)
    self.x = x
    self.y = y
    self.pillsWrapper = createPills(x, y)
end

function Pills:draw()
    for row = 1, 3 do
        for col = 1, 4 do
            if self.pillsWrapper[row][col] then
                self.pillsWrapper[row][col]:draw()
            end
        end
    end
end

TombArea = Object:extend()

function TombArea:new(x, y)
    self.x = x
    self.y = y
    self.width = config.tombArea.width
    self.height = config.tombArea.height
    self.top = self.y
    self.right = self.x + self.width
    self.bottom = self.y + self.height
    self.left = self.x
    self.penetrated = false
    self.tomb = Tomb(config.column.width, config.row.height, config.tomb.width,
                     config.tomb.height)
    -- self.name = name
    -- self.hit = false
    -- self.hitDirection = "DOWN"
    self.pills = Pills(x, y)
end

function TombArea:draw()
    r, g, b, a = love.graphics.getColor()
    if self.penetrated then
        love.graphics.setColor(rgba(255, 0, 0))
        love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
        love.graphics.setColor(r, g, b, a)
    end
    self.tomb:draw()
    self.pills:draw()
end

function CheckCollision(x1, y1, w1, h1, x2, y2, w2, h2)
    return x1 < x2 + w2 and x2 < x1 + w1 and y1 < y2 + h2 and y2 < y1 + h1
end

function TombArea:hasCollidedWith(item)
    -- print("item.x" .. item.x)
    -- print("item.y" .. item.y)
    -- print("item.width" .. item.width)
    -- print("item.height" .. item.height)

    -- print("self.x" .. self.x)
    -- print("self.y" .. self.y)
    -- print("self.width" .. self.width)
    -- print("self.height" .. self.height)

    if CheckCollision(item.x, item.y, item.width, item.height, self.x, self.x,
                      self.width, self.height) then
        print("You've collided with tomb 1s area")
    else
        print("You've haven't collided with tomb 1s area")
    end
end

return TombArea
