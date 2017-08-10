package.path = string.format("%s;%s", package.path, "../?.lua")
oop = require('oop.include')
oop.package('logic')
oop.package('logic.component')
local hp = logic.component.hp
local atk = logic.component.atk
local camp = logic.component.camp

local useCardSystem = oop.class()

function useCardSystem:init()
	print('useCardSystem:init')
end

function useCardSystem:update()
	print('useCardSystem:update')
end


function useCardSystem:calc(avatar, l, r, entities)
	local mon1 = l.componentDict
	local mon2 = r
	if r ~= nil then
		mon2 = r.componentDict
	end
	
	if mon1["cost"] == nil then
		return 
	end
	--检测cost
	if mon1["spell"] ~= nil then
		--使用法术
		--if 单体法术 
		--弹出选择目标
		--释放 or 取消
		--else 全体法术
		--检测是否符合操作
		--释放 or 取消
	elseif mon1["monster"] ~= nil then
		local a = avatar.componentDict["avatar"]
		print(a.desc.."summon monster "..mon1["card"].desc)
		table.remove(a.cardArray, 1)
		local sunmon = entities.new()
		sunmon:add(hp:new(mon1["hp"]).val)
			:add(atk:new(mon1["atk"]).val)
			:add(camp:new(avatar.componentDict["camp"].val))

		table.insert(a.summonArray, sunmon)
		sunmon:printDesc()
		--print("召唤怪物")
		--选择位置
		--summon
	elseif mon1["weapon"] ~= nil then
		--装备武器
		--todo
	end
	--扣除cost
end

return useCardSystem

