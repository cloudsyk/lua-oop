local cost = oop.class()

function cost:init(v)
	self.val = v
	self.desc = self.val
end
return cost

