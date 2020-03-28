local Sprite = require "objects.Sprite"

local Player = Sprite:extend()

function Player:new(config, playfield) Player.super.new(self, config, playfield) end

return Player
