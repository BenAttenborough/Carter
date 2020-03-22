local bindInputs = require "utilities.bindInputs"
local player = require "objects.player"
local CreatePlayableArea = require "utilities.CreatePlayableArea"
-- local CreatTombAreas = require "utilities.createTombAreas"
-- local CreatePills = require "utilities.createPills"
-- local CreateTombs = require "utilities.createTombs"
local playerMovement = require "utilities.playerMovement"
local Game_Playfield = require "objects.playfield"
-- local pillCollision = require "utilities.pillCollision"
local config = require "config"
-- print("config.tombArea.height", config.tombArea.height)

local playerStartingPos = config.playerStartingPos
local backgroundColour = config.backgroundColour

local Carter = Player(playerStartingPos, Game_Playfield)
local playableArea = CreatePlayableArea()
local tombOne = require "utilities.createTombAreas"
-- local pills = CreatePills()
-- local tombs = CreateTombs()

-- addPills = require "objects.addPills"

-- local PillCreator = addPills.PillCreator

-- local TombCreator = addTomb.TombArea

-- createTombAreas = require 
-- local TombAreaCreator = addTomb.TombArea

score = 0
revealNoise = love.audio.newSource("/libs/reveal.mp3", "stream")

-- lurker = require "lurker"

local function drawGame()
    Game_Playfield.draw()
    playableArea.draw()
    -- pills.draw()
    -- tombs.draw()
    tombOne:draw()
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

-- function printTable(tab) for i = 1, #tab do print(tab[i]) end end

function love.load()
    bindInputs()
    love.graphics.setBackgroundColor(backgroundColour)
    love.window.setTitle("Carter")
    print("Carter started")

    -- prototype "tomb"
    local tomb = {}
    for row = 1, 3 do
        tomb[row] = {} -- create a new row
        for col = 1, 4 do
            if row ~= 2 then
                tomb[row][col] = "r" .. row .. "c" .. col .. "|"
            else
                if col ~= 2 and col ~= 3 then
                    tomb[row][col] = "r" .. row .. "c" .. col .. "|"
                else
                    tomb[row][col] = "xxxx|"
                end
            end
        end
    end

    for row = 1, 3 do
        line = ""
        for col = 1, 4 do line = line .. tomb[row][col] end
        print("Row " .. row .. ": " .. line)
    end

end

function love.update(dt)
    playerMovement(Carter, playableArea, dt)
    -- pillCollision(Carter, pills, tombs, score, revealNoise)
end

function love.draw()
    drawGame()
    drawDebug()
    drawScore()
end
