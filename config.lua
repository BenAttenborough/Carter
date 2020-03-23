require "libs.Colorized-for-Love.colorize"

local config = {}

config.playfield = {top = 0, right = 800, bottom = 600, left = 0}

config.playerStartingPos = {x = 15, y = 15}

config.column = {height = 600, width = 55, offset = 150}
config.row = {width = 800, height = 80, offset = 130}

config.tomb = {
    height = config.row.offset - config.row.height,
    width = config.column.offset - config.column.width
}
config.tombArea = {
    height = config.tomb.height + (config.row.height * 2),
    width = config.tomb.width + (config.column.width * 2)
}

config.backgroundColour = hex("#AAA")

config.playerWidth = 30
config.playerHeight = 50

config.pillRowStart = 13;
-- config.pillRowStart = (config.column.width / 2) - (config.playerWidth / 2);
config.pillRowOffset = 75;
config.pillColStart = 15;
config.pillColOffset = 65;

return config
