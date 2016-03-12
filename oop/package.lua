--第一个字母是大写吗
local function isFirstUpper(str)
	local first = str:sub(1,1) 
	return first == first:upper()-- and first:match('%a')
end

--分割字符串
local function splitString(str, delimiter)
  local result = { }
  local from  = 1
  local delim_from, delim_to = string.find( str, delimiter, from, true  )
  while delim_from do
    table.insert( result, string.sub( str, from , delim_from-1 ) )
    from  = delim_to + 1
    delim_from, delim_to = string.find( str, delimiter, from , true )
  end
  table.insert( result, string.sub( str, from  ) )
  return result
end

local setMeta = function(package, packageName)
	local mt={}
	mt.__index=function(table, key)
		-- 根据包名和类名加载文件
		local got
		if packageName then
			got = require(packageName..'.'..key)
		-- 如果不是大写，则立刻返回nil
		elseif not isFirstUpper(key) then 
			return nil
		else
			got = require(key)
		end
		---- 获得的必须是table
		--if type(got)~='table' then
		--	print(packageName, key, 'not found')
		--	return nil
		--end
		-- 设置包名、类名
		if type(got)=='table' and got.setClassData~=nil then
			if packageName then
				got:setClassData('package_name', packageName)
			end
			got:setClassData('class_name', key)
		end
		-- 放入package
		package[key] = got
		return got
	end

	setmetatable(package, mt)
end


-- 定义包
local function package(name)
	--一个包，也是一个table
	local package = {}
	setMeta(package,name)
	local parts = splitString(name, '.')
	local var=_G
	for i=1, #parts-1 do 
		var = var[parts[i]]
	end
	var[parts[#parts]] = package
end

-- 让_G也成为一个包
setMeta(_G)


return package
