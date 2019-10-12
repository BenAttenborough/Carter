Input = require "/libs/boipushy/Input"
Object = require "/libs/classic/classic"
player = require "/objects/player"
-- Carter = Player(10, 10)

function bindInputs()
	input = Input()
	input:bind("d", "right")
	input:bind("a", "left")
	input:bind("w", "up")
	input:bind("s", "down")
end

function love.load()
	bindInputs()
	Carter = Player(10, 10)
end

function love.update(dt)
	Carter:listenForInput()
end

function love.draw()
	love.graphics.setBackgroundColor(0.8, 0.8, 0.8, 1)
	-- love.graphics.draw(mummy, mummyX, mummyY)
	love.graphics.draw(Carter.graphic, Carter.x, Carter.y)
	love.graphics.line(0, 0, 800, 0, 800, 600, 0, 600, 0, 0)
end
