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

lurker = require "lurker"

local function drawGame()
	Game_Playfield.draw()
	playableArea.draw()
	pills.draw()
	tombs.draw()
	Carter:draw()
end

local function drawDebug()
	playerInfo = "Player X: " .. Carter.x .. " Y: " .. Carter.y
	playerDimensions = "Player width: " .. Carter.width .. " height: " .. Carter.height
	love.graphics.print(playerInfo, 10, 10)
end

function love.load()
	bindInputs()
	love.graphics.setBackgroundColor(backgroundColour)
	love.window.setTitle( "Carter" )
	print("Carter started")
	-- music = love.audio.newSource( '/libs/Indi.mp3', 'stream' )
	-- music:setLooping( true ) --so it doesnt stop
	-- music:play()
end

function love.update(dt)
	playerMovement(Carter, playableArea, dt)
	pillCollision(Carter, pills)
	-- lurker.update()
end

function love.draw()
	drawGame()
	drawDebug()
	-- r, g, b, a = love.graphics.getColor()
	-- love.graphics.setColor(rgba(240, 0, 0))
	-- love.graphics.rectangle("fill", 55, 80, 95, 50)
	-- love.graphics.setColor(r, g, b, a)
end
