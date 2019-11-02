local bindInputs = require "/utilities/bindInputs"
local player = require "/objects/player"
local CreatePlayableArea = require "/utilities/CreatePlayableArea"
local playerMovement = require "/utilities/playerMovement"
local Game_Playfield = require "/objects/playfield"
local Carter = Player(10, 100, Game_Playfield)
local playableArea = CreatePlayableArea()

function love.load()
	bindInputs()
end

function love.update(dt)
	playerMovement(Carter, playableArea)
end

function love.draw()
	love.graphics.setBackgroundColor(0.8, 0.8, 0.8, 1)
	Game_Playfield.draw()
	playableArea.draw()
	love.graphics.draw(Carter.graphic, Carter.x, Carter.y)

	playerInfo = "Player X: " .. Carter.x .. " Y: " .. Carter.y
	playerDimensions = "Player width: " .. Carter.width .. " height: " .. Carter.height

	love.graphics.print(playerInfo, 10, 10)
end
