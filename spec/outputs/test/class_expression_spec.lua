local _anon_func_0 = function(setmetatable)
	local _class_0
	local _base_0 = { }
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	_class_0 = setmetatable({
		__init = function(self)
			self.value = 1
		end,
		__base = _base_0
	}, {
		__index = _base_0,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	return _class_0
end
local _anon_func_1 = function(setmetatable)
	local _class_0
	local _base_0 = { }
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	_class_0 = setmetatable({
		__init = function(self)
			self.value = 2
		end,
		__base = _base_0
	}, {
		__index = _base_0,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	return _class_0
end
return describe("class expression", function()
	it("should support class expression assignment", function()
		local MyClass
		do
			local _class_0
			local _base_0 = {
				value = 100
			}
			if _base_0.__index == nil then
				_base_0.__index = _base_0
			end
			_class_0 = setmetatable({
				__init = function() end,
				__base = _base_0,
				__name = "MyClass"
			}, {
				__index = _base_0,
				__call = function(cls, ...)
					local _self_0 = setmetatable({ }, _base_0)
					cls.__init(_self_0, ...)
					return _self_0
				end
			})
			_base_0.__class = _class_0
			MyClass = _class_0
		end
		return assert.same(MyClass.value, 100)
	end)
	it("should support class expression in table", function()
		local classes = {
			Alpha = _anon_func_0(setmetatable),
			Beta = _anon_func_1(setmetatable)
		}
		local a = classes.Alpha()
		local b = classes.Beta()
		assert.same(a.value, 1)
		return assert.same(b.value, 2)
	end)
	return it("should work with return", function()
		local fn
		fn = function()
			local _class_0
			local _base_0 = {
				value = 50
			}
			if _base_0.__index == nil then
				_base_0.__index = _base_0
			end
			_class_0 = setmetatable({
				__init = function() end,
				__base = _base_0
			}, {
				__index = _base_0,
				__call = function(cls, ...)
					local _self_0 = setmetatable({ }, _base_0)
					cls.__init(_self_0, ...)
					return _self_0
				end
			})
			_base_0.__class = _class_0
			return _class_0
		end
		local Instance = fn()
		return assert.same(Instance().value, 50)
	end)
end)
