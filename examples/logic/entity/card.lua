local card = oop.class()

function card:init()
	print('card:init')
    self.id = 1
    self.componentDict = {}

end


function card:add(comp)
	print('card:add '..comp:getClassName())
    --q2,如何描述component的类型.
    --q3,如何描述只存在1个的comp和存在多个comp的情况
    self.componentDict[comp:getClassName()] = comp
    return self
end


function card:printDesc()
    for k, v in pairs(self.componentDict) do
        local comp = v
    	print('type:'..comp:getClassName().." "..self.componentDict[comp:getClassName()].desc)
    end
end

return card
