local Object = require 'oop.Object'


local function class(...)
	local cls = {}
	local comps = {}

	--对象的metatable
	cls.__objmt = {__index=cls, __class=cls}
	--class数据，目前只存放包名和类名
	cls.__classData = {}
	--基类们
	cls.__components = comps

	Object.inherit(cls, Object, ...)
	return cls
end

return class
