local _ = {
	1,
	2
}
_ = {
	1,
	2
}
_ = {
	1,
	2
}
_ = {
	1,
	2
}
_ = {
	1,
	2
}
_ = {
	something(1, 2, 4, 5, 6),
	3,
	4,
	5
}
_ = {
	a(1, 2, 3),
	4,
	5,
	6,
	1,
	2,
	3
}
_ = {
	b(1, 2, 3, 4, 5, 6),
	1,
	2,
	3,
	1,
	2,
	3
}
_ = {
	1,
	2,
	3
}
_ = {
	c(1, 2, 3)
}
hello(1, 2, 3, 4, 1, 2, 3, 4, 4, 5)
x(1, 2, 3, 4, 5, 6)
hello(1, 2, 3, world(4, 5, 6, 5, 6, 7, 8))
hello(1, 2, 3, world(4, 5, 6, 5, 6, 7, 8), 9, 9)
_ = {
	hello(1, 2),
	3,
	4,
	5,
	6
}
local x = {
	hello(1, 2, 3, 4, 5, 6, 7),
	1,
	2,
	3,
	4
}
if hello(1, 2, 3, world, world) then
	print("hello")
end
if hello(1, 2, 3, world, world) then
	print("hello")
end
a(one, two, three)
b(one, two, three)
c(one, two, three, four)
d(one, two, three, four)
e(function() end, function() end, function() end)
e({
	function() end,
	function() end,
	function() end
})
e({
	function() end,
	function() end,
	function() end
})
local v
v = function()
	return a, b, c
end
local v1, v2, v3
v1, v2, v3 = (function()
	return a
end), b, c
local a, b, c, d, e, f = 1, (f2({
	abc = abc
})), 3, 4, f5(abc), 6
for a, b, c in pairs(tb) do
	print(a, b, c)
end
for i = 1, 10, -1 do
	print(i)
end
local a, b, c
do
	local tb = {
		a = 1,
		b = function() end
	}
	local tb2 = {
		a = 1,
		b = function() end
	}
	local tb3
	local _class_0
	local _base_0 = {
		a = 1,
		b = function() end
	}
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	_class_0 = setmetatable({
		__init = function() end,
		__base = _base_0,
		__name = "tb3"
	}, {
		__index = _base_0,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	tb3 = _class_0
end
do
	local tb = setmetatable({
		print(123),
		abc = 1,
		c = "",
		z = 998
	}, {
		__close = function() end,
		__eq = function() end,
		__call = function() end
	})
	local CY
	local _class_0
	local xa, xb, xc, xd
	local _base_0 = { }
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	_class_0 = setmetatable({
		__init = function(self)
			return print(xa, xb, xc, xd)
		end,
		__base = _base_0,
		__name = "CY"
	}, {
		__index = _base_0,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	local self = _class_0;
	xa = 1
	xb = 2
	xc = 3
	xd = setmetatable({ }, {
		__close = function(self) end
	})
	local _close_0 <close> = xd
	CY = _class_0
end
do
	local first, second, color
	local _obj_0 = obj2
	first, second, color = _obj_0.numbers[1], _obj_0.numbers[2], _obj_0.properties.color
end
return nil
