local bindInputs = require "utilities.bindInputs"
local Player = require "objects.Player"
local Mummy = require "objects.Mummy"

local CreatePlayableArea = require "utilities.CreatePlayableArea"
local playerMovement = require "utilities.playerMovement"
local Game_Playfield = require "objects.playfield"
local config = require "config"

-- local Carter = Player(playerStartingPos, Game_Playfield)
local Carter = Player(config.player, Game_Playfield)
local mummy = Mummy(config.mummy, Game_Playfield)
local playableArea = CreatePlayableArea()
local tombUtils = require "utilities.createTombAreas"
local drawTombs = tombUtils.drawTombs
local checkTombOneCollision = tombUtils.checkTombOneCollision
score = 0
revealNoise = love.audio.newSource("/libs/reveal.mp3", "stream")

local function drawGame()
    Game_Playfield.draw()
    playableArea.draw()
    drawTombs()
    Carter:draw()
    mummy:draw()
end

local function drawScore()
    local scoreText = "Score: " .. score
    love.graphics.print(scoreText, 340, 560)
end

local function drawDebug()
    playerInfo = "Player X: " .. Carter.x .. " Y: " .. Carter.y
    playerDimensions = "Player width: " .. Carter.width .. " height: " ..
                           Carter.height
    love.graphics.print(love.timer.getFPS(), 10, 10)
end

function love.load()
    bindInputs()
    love.graphics.setBackgroundColor(config.backgroundColour)
    love.window.setTitle("Carter")
    print("Carter started")
end

function love.update(dt)
    playerMovement(Carter, playableArea, dt)
    checkTombOneCollision(Carter)
end

function love.draw()
    drawGame()
    drawDebug()
    drawScore()
end
