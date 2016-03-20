package.path = string.format("%s;%s", package.path, "../?.lua")
oop = require('oop.include')
oop.package('logic')
oop.package('logic.rank')
oop.package('logic.shop')

local log_sp = function()
	print("=========================================================")
end
log_sp()
GlobalConfig:initInstance()
GlobalConfig:test()
log_sp()

local rank = logic.rank.RankModel:new()
log_sp()
local shop = logic.shop.ShopModel:new()
shop:dispatchEvent("shopEvent")

