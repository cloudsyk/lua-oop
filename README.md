# lua oop framework.

1. multi inheritance.
2. easy to use.
3. used in productions for a long time.

# usage:

## common

-- the main file:
```
oop = require 'oop.include'
```

## a class

-- a class file  Play.lua:

```
local Play = oop.class()

function Play:init()
end

function Play:func()
end

return Play
```

-- another file using class Play:

```
local play = Play:new() -- no need to require Play.lua
```

## oop.pacakge usage

-- directory can be used as package.
-- the main file:
```
oop.package('logic')
```

-- a file under dir logic, logic/Energy.lua:
```
local Energy = oop.class()
return Energy
```

-- another file using Energy
```
local energy = logic.Energy:new()
```

# examples


test examples in command line
```
cd examples && lua main.lua
```
