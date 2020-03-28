local Sprite = require "objects.Sprite"
-- Object = require "libs.classic.classic"

local Mummy = Sprite:extend()

function Mummy:new(startingPos, playfield, graphic, iniSpeed)
    Mummy.super.new(self, startingPos, playfield, graphic, iniSpeed)
end

return Mummy
