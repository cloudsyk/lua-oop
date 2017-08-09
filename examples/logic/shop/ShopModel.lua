local Shop = oop.class(logic.BaseModel, logic.EventDispatcher)

function Shop:init()
	print('ShopModel:init')
end

function Shop:onDestroy()
	print('ShopModel:onDestroy')
end

return Shop

