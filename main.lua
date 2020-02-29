local bindInputs = require "/utilities/bindInputs"
local player = require "/objects/player"
local CreatePlayableArea = require "/utilities/CreatePlayableArea"
local playerMovement = require "/utilities/playerMovement"
local Game_Playfield = require "/objects/playfield"
local config = require "/config"

local playerStartingPos = config.playerStartingPos
local backgroundColour = config.backgroundColour

local Carter = Player(playerStartingPos, Game_Playfield)
local playableArea = CreatePlayableArea()



local function drawGame()
	Game_Playfield.draw()
	playableArea.draw()
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
	-- music = love.audio.newSource( '/libs/Indi.mp3', 'stream' )
	-- music:setLooping( true ) --so it doesnt stop
	-- music:play()
end

function love.update(dt)
	playerMovement(Carter, playableArea)
end

function love.draw()
	drawGame()
	drawDebug()
end
