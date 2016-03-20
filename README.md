# lua oop framework.

multi inheritance.

easy to use.

used in productions for a long time.


# usage:

-- the main file:
```
oop = require 'oop.include'
```
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

-- another class 

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

