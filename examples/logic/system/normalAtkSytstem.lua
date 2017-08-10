--change,重命名，改为普攻系统
local normalAtkSytstem = oop.class()

function normalAtkSytstem:init()
	print('normalAtkSytstem:init')
end

function normalAtkSytstem:update()
	print('normalAtkSytstem:update')
end

--q5伤害不只是怪物之间产生，那么涉及到英雄的问题，等等，还有护甲
--关心hp，atk ，armor(todo)
function normalAtkSytstem:calc(l, r)
	local mon1 = l.componentDict
	local mon2 = r.componentDict
	if mon1["hp"] == nil or mon2["hp"] == nil  then
		return 
	end
	print('normalAtkSytstem:calc before lhs hp = '..mon1["hp"].val.." rhs hp = "..mon2["hp"].val)
	mon2["hp"].val = mon2["hp"].val - mon1["atk"].val
	mon1["hp"].val = mon1["hp"].val - mon2["atk"].val
	print('normalAtkSytstem:calc ret lhs hp = '..mon1["hp"].val.." rhs hp = "..mon2["hp"].val)
end

return normalAtkSytstem

