# Carter - A game by Ben Attenborough

## Compilation

The following packages are requried:

- boipushy
- classic

Tech notes

To run a method on a object use <object>:<method> not <object>.<method>

## OOP:

### Creating a new class

```lua
Point = Object:extend()

-- Constructor
function Point:new(x, y)
  self.x = x or 0
  self.y = y or 0
end

-- Adding a method
function Point:sayCoords()
    print("X: " .. self.x .. " Y: " .. self.y)
end

return Point
```

### Exporting and importing a class

### Creating a new object

```lua
local Point = require "objectDir.Point"

local p = Point(10, 20)
```

### Calling a method on an object

```lua
-- Notice : instead of .
p:sayCoords()
```
