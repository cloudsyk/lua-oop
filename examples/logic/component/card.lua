local card = oop.class()

function card:init(v)
	print('card:init')
	self.val = 1
	self.desc = v
end
return card

