local bindInputs = require "utilities.bindInputs"
local player = require "objects.player"
local CreatePlayableArea = require "utilities.CreatePlayableArea"
local CreatePills = require "utilities.createPills"
local CreateTombs = require "utilities.createTombs"
local playerMovement = require "utilities.playerMovement"
local Game_Playfield = require "objects.playfield"
local pillCollision = require "utilities.pillCollision"
local config = require "config"

local playerStartingPos = config.playerStartingPos
local backgroundColour = config.backgroundColour

local Carter = Player(playerStartingPos, Game_Playfield)
local playableArea = CreatePlayableArea()
local pills = CreatePills()
local tombs = CreateTombs()

-- test
Object = require "libs.classic.classic"

score = 0
revealNoise = love.audio.newSource("/libs/reveal.mp3", "stream")

-- lurker = require "lurker"

local function drawGame()
    Game_Playfield.draw()
    playableArea.draw()
    pills.draw()
    tombs.draw()
    Carter:draw()
end

local function drawScore()
    local scoreText = "Score: " .. score
    love.graphics.print(scoreText, 340, 560)
end

local function drawDebug()
    playerInfo = "Player X: " .. Carter.x .. " Y: " .. Carter.y
    playerDimensions = "Player width: " .. Carter.width .. " height: " ..
                           Carter.height
    -- love.graphics.print(playerInfo, 10, 10)
    love.graphics.print(love.timer.getFPS(), 10, 10)
end

-- Test
local M = {}
M.testCreator = Object:extend()

function M.testCreator:new(x, y, name, adjTombs)
    self.x = x
    self.y = y
    self.name = name
    self.adjTombs = adjTombs
end

function printTable(tab) for i = 1, #tab do print(tab[i]) end end

function love.load()
    bindInputs()
    love.graphics.setBackgroundColor(backgroundColour)
    love.window.setTitle("Carter")
    print("Carter started")
    -- music = love.audio.newSource( '/libs/Indi.mp3', 'stream' )
    -- music:setLooping( true ) --so it doesnt stop
    -- music:play()

    local iniWidth = 15
    local height = 15
    local offset = 3
    local grid = {}

    for y = 0, height do
        local startingNumber = (math.floor(y / offset) + 1) * offset
        -- print("startingNumber " .. startingNumber)
        local row = {}
        -- x = 16
        local yFactor = (math.floor(y / offset))
        print("yFactor " .. yFactor)
        local xCount = (yFactor * iniWidth) + 1
        print("xCount " .. xCount)
        local width = iniWidth * (yFactor + 1)
        print("width " .. width)

        for x = xCount, width do
            local item = ""
            -- local factor = (x + 1) * startingNumber
            local tombNumber = (math.floor(x / offset) + 1)
            if x % offset == 0 and x > 0 then
                if x < width then
                    item = {tombNumber - 1, tombNumber}
                else
                    item = {tombNumber - 1}
                end
            else
                item = {tombNumber}
            end
            table.insert(row, item)
        end
        table.insert(grid, row)

        if y % offset == 0 then print(">>>> " .. y) end
    end

    -- local output = ""

    for gridIdx = 1, #grid do
        local output = ""
        for rowIdx = 1, #grid[gridIdx] do
            for i = 1, #grid[gridIdx][rowIdx] do
                output = output .. grid[gridIdx][rowIdx][i] .. ","
            end
            output = output .. "|"
        end
        print(output)
    end

    -- for i = 1, #row do
    --     for j = 1, #row[i] do output = output .. row[i][j] end
    --     output = output .. "|"
    -- end

    -- for y

    -- for i = 1, #row do
    --     for j = 1, #row[i] do output = output .. row[i][j] end
    --     output = output .. "|"
    -- end

    -- print(output)
end

function love.update(dt)
    playerMovement(Carter, playableArea, dt)
    -- pillCollision(Carter, pills, tombs, score, revealNoise)
    -- lurker.update()
end

function love.draw()
    drawGame()
    drawDebug()
    drawScore()
    -- r, g, b, a = love.graphics.getColor()
    -- love.graphics.setColor(rgba(240, 0, 0))
    -- love.graphics.rectangle("fill", 55, 80, 95, 50)
    -- love.graphics.setColor(r, g, b, a)
end
