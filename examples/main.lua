package.path = string.format("%s;%s", package.path, "../?.lua")
oop = require('oop.include')
oop.package('logic')
oop.package('logic.rank')
oop.package('logic.shop')
oop.package('logic.entity')
oop.package('logic.component')
oop.package('logic.system')
local card = logic.entity.card
local hp = logic.component.hp
local atk = logic.component.atk
local cost = logic.component.cost
local spell = logic.component.spell

local monster = logic.component.monster
local damageSystem = logic.system.damageSystem
local log_sp = function()
	print("=========================================================")
end
log_sp()
GlobalConfig:initInstance()
GlobalConfig:test()
log_sp()

local entities = {}
function entities.new()
    return card:new()
    -- body
end

local t1 = entities.new()
t1:add(monster:new(2, 1))
     :add(cost:new(1))
     :add(atk:new(2))
     :add(hp:new(1))
t1:printDesc()

local t11 = entities.new()
t11:add(monster:new(1, 2))
     :add(cost:new(1))
     :add(atk:new(1))
     :add(hp:new(2))
t11:printDesc()

local t2 = entities.new()
t2:add(spell:new(2, 3))
    :add(cost:new(2))
t2:printDesc()

local ds = damageSystem:new()
ds:calc(t1,t11)

log_sp()
--shop:dispatchEvent("shopEvent")

--print(shop:isDestroyed())
--shop:onDestroy()
collectgarbage("count")
--shop:dispatchEvent("shopEvent")
--print(shop:isDestroyed())

