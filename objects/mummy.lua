local Sprite = require "objects.Sprite"
-- Object = require "libs.classic.classic"

local Mummy = Sprite:extend()

function Mummy:new(config, playfield) Mummy.super.new(self, config, playfield) end

-- function Mummy:move

return Mummy
