local spell = oop.class()

function spell:init(t, p)
	print('spell:init')

	--q5 法术也有类型
	self.type = t or 1--temp
	self.para = p or 1--temp
	self.desc = "type = "..self.type.." para =  "..self.para 
end
return spell

