require "libs.Colorized-for-Love.colorize"

local config = {}

config.graphicsDir = "graphics/"

config.playfield = {top = 0, right = 800, bottom = 600, left = 0}

-- config.playerStartingPos = {x = 15, y = 15}

config.column = {height = 600, width = 55, offset = 150}
config.row = {width = 800, height = 80, offset = 130}

config.tomb = {
    height = config.row.offset - config.row.height,
    width = config.column.offset - config.column.width,
    graphicsClosed = config.graphicsDir .. "tomb_closed.png",
    graphicsEmpty = config.graphicsDir .. "tomb_empty.png",
    graphicsTreasure1 = config.graphicsDir .. "treasure_1.png",
    graphicsKey = config.graphicsDir .. "key.png",
    graphicsScroll = config.graphicsDir .. "scroll.png",
    graphicsMummy = config.graphicsDir .. "tomb_empty.png",
    graphicsSarcophagus = config.graphicsDir .. "sarcophagus.png"
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
config.pillRowOffset = 50;
config.pillColStart = 15;
config.pillColOffset = 65;

-- Player
config.player = {
    startingPos = {x = 15, y = 15},
    startingSpeed = 350,
    graphic = {
        up = config.graphicsDir .. "carter_up.png",
        down = config.graphicsDir .. "carter_down.png",
        left = config.graphicsDir .. "carter_left.png",
        right = config.graphicsDir .. "carter_right.png"
    }
}

-- Mummy
config.mummy = {
    startingPos = {
        x = config.playfield.right - 10 - 30,
        y = config.playfield.bottom - 15 - 50
    },
    startingSpeed = 200,
    graphic = {
        up = config.graphicsDir .. "MummySprite_up.png",
        down = config.graphicsDir .. "MummySprite_down.png",
        left = config.graphicsDir .. "MummySprite_left.png",
        right = config.graphicsDir .. "MummySprite_right.png"
    }
}

return config
