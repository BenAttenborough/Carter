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

    -- local columnOffet = 2
    -- local width = 30
    -- local testRow = {}
    -- for x = 1, width do
    --     if x % columnOffet == 0 or x == 1 then
    --         local adjTombs = {}

    --         local firstTomb = math.floor(x / columnOffet)
    --         local secondTomb = firstTomb + 1
    --         if firstTomb > 0 then table.insert(adjTombs, firstTomb) end
    --         if secondTomb < math.floor(width / columnOffet) then
    --             table.insert(adjTombs, secondTomb)
    --         end
    --         -- print("adjTombs")
    --         -- printTable(adjTombs)
    --         testRow[x] = M.testCreator(x, 1, "item X" .. x, adjTombs)
    --     else
    --         local adjTombs = {}
    --         table.insert(adjTombs, math.floor(x / columnOffet) + 1)
    --         testRow[x] = M.testCreator(x, 1, "item " .. x, adjTombs)
    --     end
    -- end
    -- for i = 1, 20 do
    --     print(testRow[i].name)
    --     output = " Adjacent cells: "
    --     local adjTombs = testRow[i].adjTombs
    --     -- print(#adjTombs)
    --     for j = 1, #adjTombs do output = output .. adjTombs[j] end
    --     print(output)
    -- end

    local width = 15
    local offset = 3
    local row = {}

    for x = 0, width do

        local item = ""
        local tombNumber = math.floor(x / offset) + 1

        if x % offset == 0 and x > 0 then
            if x < width then
                -- item = "(" .. tombNumber - 1 .. "," .. tombNumber .. ")"
                item = {tombNumber - 1, tombNumber}
            else
                item = {tombNumber - 1}
            end
        else
            -- print(x % offset .. " " .. tombNumber)
            item = {tombNumber}
        end
        table.insert(row, item)
    end

    local output = ""

    for i = 1, #row do
        for j = 1, #row[i] do output = output .. row[i][j] end
        output = output .. "|"
    end

    print(output)
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
