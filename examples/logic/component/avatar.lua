local avatar = oop.class()

function avatar:init(desc)
	print('avatar:init')
	self.val = 1
	self.desc = desc

	self.cardArray = {}
	self.summonArray = {}
end
return avatar

