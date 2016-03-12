local Object = {}


local function doCallInit(class, obj, ...)
	-- 同一个类的init不能重复调用
	local called = rawget(obj, '__initCalled')
	for _,cls in ipairs(called) do
		if cls==class then return end
	end
	local init = rawget(class, 'init')
	if init~=nil and type(init)=='function' then
		init(obj, ...)
	end
	called[#called+1] = class
end

local function callInit(class, obj, ...)
	local isCustom = rawget(class, '__customInit')
	if isCustom then
		doCallInit(class, obj, ...)
	else
		local parents = rawget(class, '__components')
		for _,comp in ipairs(parents) do
			callInit(comp, obj, ...)
		end
		doCallInit(class, obj, ...)
	end
end

local function new(class, ...)
	local obj = {__initCalled={}}
	setmetatable(obj, rawget(class, '__objmt'))
	-- 调用init
	callInit(class, obj, ...)
	return obj
end

local function doCallOnDestroy(cls, obj, called)
	for _, calledClass in ipairs(called) do
		if calledClass == cls then return end
	end
	local onDestroy = rawget(cls, 'onDestroy')
	if onDestroy~=nil and type(onDestroy)=='function' then
		onDestroy(obj)
	end
	local comps = rawget(cls,'__components')
	for _,comp in ipairs(comps) do
		doCallOnDestroy(comp, obj, called)
	end
	table.insert(called, cls)
end

local function doDestroy(obj)
	local called = {}
	local cls = getmetatable(obj).__class
	doCallOnDestroy(cls, obj, called)
	obj._isDestroyed = true
end

local function isDestroyed(obj)
	return obj._isDestroyed
end

local function customInit(class)
	rawset(class, '__customInit', true)
end

local function setClassData(class, key,value)
	local data = rawget(class, '__classData')
	data[key] = value
	return class
end

local function getClassData(class, key)
	return rawget(class, '__classData')[key]
end

local function getClass(obj)
	return getmetatable(obj).__class
end

local function getClassName(obj)
	local class = getClass(obj)
	return getClassData(class, 'class_name')
end

local function getPackageName(obj)
	local class = getClass(obj)
	return getClassData(class, 'package_name')
end

local function getFullClassName(obj)
	local className = getClassName(obj)
	if not className then return nil end
	local package = getPackageName(obj)
	if not package then return className end
	return package ..'.'..className
end

local function copyFunctions(cls, comp)
	for key,value in pairs(comp) do
		if type(value) == 'function' and key~='init' and key~='onDestroy' then
			rawset(cls, key, value)
		end
	end
end

-- 一个类添加父类，调用这个函数之后，会影响这个类的所有对象
local function inherit(cls, ...)
	local arg = {...}
	for _, comp in ipairs(arg) do
		local comps = rawget(cls, '__components')
		comps[#comps+ 1] = comp
		copyFunctions(cls, comp)
	end
	return cls
end

local function initInstance(cls, ...)
	local mt = {__class=cls}
	setmetatable(cls, mt)
	cls.__initCalled = {}
	callInit(cls, cls, ...)
end

-- 给一个对象添加一个组件，只影响到这一个对象
-- 后面的参数是初始化组件时的参数
-- 请注意，这里会调用init
--function Object.addClass(obj, cls, ...)
--	local comps = getmetatable(obj).__components
--	comps[#comps + 1] = cls 
--	Object.callInit(cls, obj,  ...)
--end



-- 为了正常运行
Object.__components = {}

-- class函数。
Object.new = new
-- class函数。自己调用父类的初始化函数
Object.inherit = inherit
-- class函数。需要自己来调用父类的初始化函数时，先调用这个函数。
Object.customInit = customInit
-- class函数。自己调用父类的初始化函数
Object.callInit = callInit
-- class函数。设置类的自定义数据
Object.setClassData = setClassData
-- class函数。获得类的自定义数据
Object.getClassData = getClassData
-- class函数。当做单例来初始化
Object.initInstance = initInstance

-- obj函数。获得类
Object.getClass = getClass
-- obj函数。获得类名
Object.getClassName = getClassName
-- obj函数。获得包名
Object.getPackgeName = getPackageName
-- obj函数。获得包名+类名
Object.getFullClassName = getFullClassName

-- obj函数。
Object.doDestroy = doDestroy
Object.isDestroyed = isDestroyed

return Object
