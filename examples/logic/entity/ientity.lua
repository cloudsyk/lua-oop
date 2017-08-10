local ientity = oop.class()

function ientity:init(i)
	print('ientity:init')
    self.id = i or 1
    self.componentDict = {}

end


function ientity:add(comp)
	print('ientity:add '..comp:getClassName())
    --q2,如何描述component的类型.
    --q3,如何描述只存在1个的comp和存在多个comp的情况
    self.componentDict[comp:getClassName()] = comp
    return self
end


function ientity:printDesc()
    print("entity "..self.id)
    for k, v in pairs(self.componentDict) do
        local comp = v
        --print('  type:'..comp:getClassName())
        local desc = self.componentDict[comp:getClassName()].desc or " nil"
        
    	print('  type:'..comp:getClassName().." "..desc)
    end
end

return ientity
