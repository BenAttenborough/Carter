local bindInputs = require "utilities.bindInputs"
local Player = require "objects.Player"
local Mummy = require "objects.Mummy"

local CreatePlayableArea = require "utilities.CreatePlayableArea"
local playerMovement = require "utilities.playerMovement"
local Game_Playfield = require "objects.playfield"
local config = require "config"

local player = Player(config.player, Game_Playfield)
local mummy = Mummy(config.mummy, Game_Playfield)
local playableArea = CreatePlayableArea()
local tombUtils = require "utilities.createTombAreas"
local drawTombs = tombUtils.drawTombs
local checkTombOneCollision = tombUtils.checkTombOneCollision
score = 0

local function drawGame()
    Game_Playfield.draw()
    playableArea.draw()
    drawTombs()
    player:draw()
    mummy:draw()
end

local function drawScore()
    local scoreText = "Score: " .. player.score
    love.graphics.print(scoreText, 340, 560)
end

local function drawDebug()
    playerInfo = "Player X: " .. player.x .. " Y: " .. player.y
    playerDimensions = "Player width: " .. player.width .. " height: " ..
                           player.height
    love.graphics.print(love.timer.getFPS(), 10, 10)
end

function love.load()
    bindInputs()
    love.graphics.setBackgroundColor(config.backgroundColour)
    love.window.setTitle("Carter")
    print("Carter started")
end

function love.update(dt)
    playerMovement(player, playableArea, dt)
    checkTombOneCollision(player)
    mummy:move(player, playableArea, dt)
end

function love.draw()
    drawGame()
    drawDebug()
    drawScore()
end
