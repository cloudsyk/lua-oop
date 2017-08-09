local damageSystem = oop.class()

function damageSystem:init()
	print('damageSystem:init')
end

function damageSystem:update()
	print('damageSystem:update')
end

--q5伤害不只是怪物之间产生，那么涉及到英雄的问题，等等，还有护甲
--关心hp，atk ，armor(todo)
function damageSystem:calc(l, r)
	local mon1 = l.componentDict
	local mon2 = r.componentDict
	if mon1["hp"] == nil or mon2["hp"] == nil  then
		return 
	end
	print('damageSystem:calc before lhs hp = '..mon1["hp"].val.." rhs hp = "..mon2["hp"].val)
	mon2["hp"].val = mon2["hp"].val - mon1["atk"].val
	mon1["hp"].val = mon1["hp"].val - mon2["atk"].val
	print('damageSystem:calc ret lhs hp = '..mon1["hp"].val.." rhs hp = "..mon2["hp"].val)
end

return damageSystem

