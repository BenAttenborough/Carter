Input = require "/libs/boipushy/Input"
Object = require "/libs/classic/classic"
player = require "/objects/player"
playfield = require "/objects/playfield"

function bindInputs()
	input = Input()
	input:bind("d", "right")
	input:bind("a", "left")
	input:bind("w", "up")
	input:bind("s", "down")
end

function love.load()
	bindInputs()
	Game_Playfield = Playfield(0, 800, 600, 0)
	Carter = Player(10, 10, Game_Playfield)
end

function love.update(dt)
	Carter:listenForInput()
end

function love.draw()
	love.graphics.setBackgroundColor(0.8, 0.8, 0.8, 1)
	-- love.graphics.draw(mummy, mummyX, mummyY)
	love.graphics.draw(Carter.graphic, Carter.x, Carter.y)
	love.graphics.line(
		Game_Playfield.top,
		Game_Playfield.left,
		Game_Playfield.right,
		Game_Playfield.top,
		Game_Playfield.right,
		Game_Playfield.bottom,
		Game_Playfield.left,
		Game_Playfield.bottom,
		Game_Playfield.top,
		Game_Playfield.left
	)
end
