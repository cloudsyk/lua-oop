package.path = string.format("%s;%s", package.path, "../?.lua")
oop = require('oop.include')
oop.package('logic')
oop.package('logic.rank')
oop.package('logic.shop')
oop.package('logic.entity')
oop.package('logic.component')
oop.package('logic.system')
local ientity = logic.entity.ientity
local hp = logic.component.hp
local atk = logic.component.atk
local cost = logic.component.cost
local spell = logic.component.spell
local avatar = logic.component.avatar
local hero = logic.component.hero
local armor = logic.component.armor
local camp = logic.component.camp
local card = logic.component.card

local monster = logic.component.monster
local normalAtkSytstem = logic.system.normalAtkSytstem
local useCardSystem = logic.system.useCardSystem

local log_sp = function()
	print("=========================================================")
end
log_sp()
GlobalConfig:initInstance()
GlobalConfig:test()
log_sp()

local __index = 0
local entities = {}
function entities.new()
    __index = __index + 1
    return ientity:new(__index)
    -- body
end

local t1 = entities.new()
t1:add(monster:new(2, 1))
     :add(cost:new(1))
     :add(atk:new(2))
     :add(hp:new(1))
     :add(card:new("basic 2 1"))
t1:printDesc()

local t11 = entities.new()
t11:add(monster:new(1, 2))
     :add(cost:new(1))
     :add(atk:new(1))
     :add(hp:new(2))
     :add(card:new("basic 2 1"))
t11:printDesc()

local t2 = entities.new()
t2:add(spell:new(2, 3))
    :add(cost:new(2))
    :add(card:new("spell: cost 2 damage 3"))
t2:printDesc()

local myhero = entities.new()
myhero:add(hp:new(30))
    :add(avatar:new("You "))
    :add(hero:new(0))
    :add(atk:new(0))
    :add(armor:new(0))
    :add(camp:new("red"))
    --英雄技能如何描述

local hishero = entities.new()
hishero:add(hp:new(30))
    :add(avatar:new("Worthy Opponent "))
    :add(hero:new(0))
    :add(atk:new(0))
    :add(armor:new(0))
    :add(camp:new("blue"))
    --英雄技能如何描述

local ucs = useCardSystem:new()
--发牌
---round 1
ucs:calc(myhero, t1, nil, entities)

---round 2

local ds = normalAtkSytstem:new()
ds:calc(t1,t11)

log_sp()
--shop:dispatchEvent("shopEvent")

--print(shop:isDestroyed())
--shop:onDestroy()
collectgarbage("count")
--shop:dispatchEvent("shopEvent")
--print(shop:isDestroyed())

--Q6，粒度问题，有一个使用卡牌的system，是把使用法术/武器/怪物卡分开，还是实现一个统一的system。
--还有使用怪物普攻
