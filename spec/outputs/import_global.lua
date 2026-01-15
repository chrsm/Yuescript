do
	local print = print
	local math = math
	print("hello")
	math.random(10)
end
do
	local print = print
	local value = 1
	value = value + 2
	print(value)
end
do
	local print
	print = function(msg)
		return msg
	end
	do
		local math = math
		print("local")
		math.random(1)
	end
end
do
	local print = print
	local tostring
	tostring = function(v)
		return "local"
	end
	tostring("value")
	print(tostring(123))
end
do
	local func
	func = function(x, y)
		local type = type
		local tostring = tostring
		local print = print
		return type(x, tostring(y, print))
	end
	func(1, 2)
end
do
	local xpcall = xpcall
	local func = func
	local world = world
	local tostring = tostring
	local print = print
	xpcall(function()
		return func("hello " .. tostring(world))
	end, function(err)
		return print(err)
	end)
end
do
	local print = print
	print(FLAG)
	FLAG = 123
end
do
	local print = print
	Foo = 10
	print(Foo)
	Foo = Foo + 2
end
do
	local print = print
	Bar = 1
	Baz = 2
	print(Bar, Baz)
end
do
	local y = y
	x = 3434
	if y then
		x = 10
	end
end
do
	local lowercase = lowercase
	local tostring = tostring
	local Uppercase = Uppercase
	local foobar = "all " .. tostring(lowercase)
	FooBar = "pascal case"
	FOOBAR = "all " .. tostring(Uppercase)
end
do
	local setmetatable = setmetatable
	local print = print
	do
		local _class_0
		local _base_0 = { }
		if _base_0.__index == nil then
			_base_0.__index = _base_0
		end
		_class_0 = setmetatable({
			__init = function() end,
			__base = _base_0,
			__name = "A"
		}, {
			__index = _base_0,
			__call = function(cls, ...)
				local _self_0 = setmetatable({ }, _base_0)
				cls.__init(_self_0, ...)
				return _self_0
			end
		})
		_base_0.__class = _class_0
		A = _class_0
	end
	Flag = 1
	const, x, y = "const", 1, 2
	print(math, table)
end
do
	local X = X
	X:func(1, 2, 3)
	X.tag = "abc"
	return X
end
