local monster = oop.class()

function monster:init(a, h)
	print('monster:init')

	--q4 关于属性，是每个属性都是1个comp，还是1个comp可以包含多个属性
	self.atk = a or 1
	self.hp = h or 1
	self.mhp = h or 1
	self.desc = "atk = "..self.atk.." hp = "..self.hp.." mhp = "..self.mhp
end

return monster

