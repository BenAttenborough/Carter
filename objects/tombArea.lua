Object = require "libs.classic.classic"
require "libs.Colorized-for-Love.colorize"
local config = require "config"

Tomb = Object:extend()

function Tomb:new(x, y, width, height, treasure)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.graphicClose = love.graphics.newImage(config.tomb.graphicsClosed)
    self.graphicOpen = love.graphics.newImage(treasure)
end

function Tomb:draw(graphic)
    -- r, g, b, a = love.graphics.getColor()
    -- love.graphics.setColor(rgba(255, 0, 0))
    -- love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
    -- love.graphics.setColor(r, g, b, a)
    love.graphics.draw(graphic, self.x, self.y)
end

Pill = Object:extend()

function Pill:new(x, y, width, height)
    self.x = x
    self.y = y
    self.graphic = love.graphics.newImage("graphics/steps_right.png")
    self.graphicUp = love.graphics.newImage("graphics/steps_up.png")
    self.graphicDown = love.graphics.newImage("graphics/steps_down.png")
    self.graphicLeft = love.graphics.newImage("graphics/steps_left.png")
    self.graphicRight = love.graphics.newImage("graphics/steps_right.png")
    self.width = self.graphic:getWidth()
    self.height = self.graphic:getHeight()
    self.hit = false
    self.hitDirection = "DOWN"
end

function Pill:draw()
    if self.hit then
        if self.hitDirection == "UP" then
            love.graphics.draw(self.graphicUp, self.x, self.y)
        elseif self.hitDirection == "DOWN" then
            love.graphics.draw(self.graphicDown, self.x, self.y)
        elseif self.hitDirection == "LEFT" then
            love.graphics.draw(self.graphicLeft, self.x, self.y)
        elseif self.hitDirection == "RIGHT" then
            love.graphics.draw(self.graphicRight, self.x, self.y)
        end
    end
end

function createPills(x, y)
    local pills = {}

    for row = 1, 3 do
        pills[row] = {} -- create a new row
        for col = 1, 4 do
            if row ~= 2 then
                -- pills[row][col] = Pill(row * 10, col * 10)
                pills[row][col] = Pill(x + config.pillRowStart +
                                           (config.pillRowOffset * (col - 1)),
                                       y + config.pillColStart +
                                           (config.pillColOffset * (row - 1)))
            else
                if col ~= 2 and col ~= 3 then
                    pills[row][col] = Pill(
                                          x + config.pillRowStart +
                                              (config.pillRowOffset * (col - 1)),
                                          y + config.pillColStart +
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
    self.count = 10
    self.revealNoise = love.audio.newSource("/libs/reveal.mp3", "stream")
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

function Pills:hasCollidedWith(player)
    for row = 1, 3 do
        for col = 1, 4 do
            if self.pillsWrapper[row][col] then
                if checkCollision(player, self.pillsWrapper[row][col]) then
                    if self.pillsWrapper[row][col].hit == false then
                        self.pillsWrapper[row][col].hit = true
                        self.count = self.count - 1
                        if (self.count == 0) then
                            self.revealNoise:play()
                            player.score = player.score + 50
                        end
                    end
                    self.pillsWrapper[row][col].hitDirection = player.direction
                end
            end
        end
    end
end

TombArea = Object:extend()

function TombArea:new(x, y, graphic)
    self.x = x
    self.y = y
    self.width = config.tombArea.width
    self.height = config.tombArea.height
    self.top = self.y
    self.right = self.x + self.width
    self.bottom = self.y + self.height
    self.left = self.x
    self.penetrated = false
    self.tomb = Tomb(x + config.column.width, y + config.row.height,
                     config.tomb.width, config.tomb.height, graphic)

    self.pills = Pills(x, y)
end

function TombArea:draw()
    r, g, b, a = love.graphics.getColor()
    if self.pills.count == 0 then
        self.tomb:draw(self.tomb.graphicOpen)
    else
        self.tomb:draw(self.tomb.graphicClose)
    end
    self.pills:draw()
end

function checkCollision(item1, item2)
    return
        item1.x < item2.x + item2.width and item2.x < item1.x + item1.width and
            item1.y < item2.y + item2.height and item2.y < item1.y +
            item1.height
end

function TombArea:hasCollidedWith(item)
    if checkCollision(item, self) then
        -- print("You've collided with tomb 1s area")
        -- print(self.pills)
        self.pills:hasCollidedWith(item, self)
    end
end

return TombArea
