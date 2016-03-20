local Shop = oop.class(logic.BaseModel, logic.EventDispatcher)

function Shop:init()
	print('ShopModel:init')
end

return Shop

