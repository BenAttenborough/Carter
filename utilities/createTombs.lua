addTomb = require "objects.tombs"

local TombCreator = addTomb.TombCreator

local function createTombs()
    print("Creating tomb")
    local tombs = {
        	-- love.graphics.rectangle("fill", 55, 80, 95, 50)

        TombCreator(55,80,95,50)
    }


    function tombs.draw()
		for i, v in ipairs(tombs) do
			v:draw()
        end
    end
    
    -- function pillRows.collide(collidee)
    -- end

	return tombs

end

return createTombs