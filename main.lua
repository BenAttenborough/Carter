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

function M.testCreator:new(x, y, name)
    self.x = x
    self.y = y
    self.name = name
end

function love.load()
    bindInputs()
    love.graphics.setBackgroundColor(backgroundColour)
    love.window.setTitle("Carter")
    print("Carter started")
    -- music = love.audio.newSource( '/libs/Indi.mp3', 'stream' )
    -- music:setLooping( true ) --so it doesnt stop
    -- music:play()

    local testRow = {}
    for i = 1, 50 do
        if i % 5 == 0 then
            testRow[i] = M.testCreator(i, 1, "item X" .. i)
        else
            testRow[i] = M.testCreator(i, 1, "item " .. i)
        end
    end
    for i = 1, 20 do print(testRow[i].name) end

    print("")
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
