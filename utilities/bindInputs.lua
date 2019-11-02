local Input = require "../libs/boipushy/Input"

local function bindInputs()
	input = Input()
	input:bind("right", "right")
	input:bind("left", "left")
	input:bind("up", "up")
	input:bind("down", "down")
end

return bindInputs
