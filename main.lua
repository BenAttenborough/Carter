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
local drawTombs = require "utilities.createTombAreas"
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
    -- tombOne:draw()
    drawTombs()
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
