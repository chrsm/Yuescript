return describe("anonymous class", function()
	it("should create anonymous class", function()
		local AnonymousClass
		do
			local _class_0
			local _base_0 = {
				value = 100,
				getValue = function(self)
					return self.value
				end
			}
			if _base_0.__index == nil then
				_base_0.__index = _base_0
			end
			_class_0 = setmetatable({
				__init = function() end,
				__base = _base_0,
				__name = "AnonymousClass"
			}, {
				__index = _base_0,
				__call = function(cls, ...)
					local _self_0 = setmetatable({ }, _base_0)
					cls.__init(_self_0, ...)
					return _self_0
				end
			})
			_base_0.__class = _class_0
			AnonymousClass = _class_0
		end
		local instance = AnonymousClass()
		return assert.same(instance:getValue(), 100)
	end)
	it("should use assigned name", function()
		local MyClass
		do
			local _class_0
			local _base_0 = {
				value = 50
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
		local instance = MyClass()
		assert.is_true(MyClass.__name == "MyClass")
		return assert.same(instance.value, 50)
	end)
	return it("should support anonymous subclass", function()
		local Base
		do
			local _class_0
			local _base_0 = {
				baseMethod = function(self)
					return "base"
				end
			}
			if _base_0.__index == nil then
				_base_0.__index = _base_0
			end
			_class_0 = setmetatable({
				__init = function() end,
				__base = _base_0,
				__name = "Base"
			}, {
				__index = _base_0,
				__call = function(cls, ...)
					local _self_0 = setmetatable({ }, _base_0)
					cls.__init(_self_0, ...)
					return _self_0
				end
			})
			_base_0.__class = _class_0
			Base = _class_0
		end
		local Sub
		do
			local _class_0
			local _parent_0 = Base
			local _base_0 = {
				subMethod = function(self)
					return "sub"
				end
			}
			for _key_0, _val_0 in pairs(_parent_0.__base) do
				if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
					_base_0[_key_0] = _val_0
				end
			end
			if _base_0.__index == nil then
				_base_0.__index = _base_0
			end
			setmetatable(_base_0, _parent_0.__base)
			_class_0 = setmetatable({
				__init = function(self, ...)
					return _class_0.__parent.__init(self, ...)
				end,
				__base = _base_0,
				__name = "Sub",
				__parent = _parent_0
			}, {
				__index = function(cls, name)
					local val = rawget(_base_0, name)
					if val == nil then
						local parent = rawget(cls, "__parent")
						if parent then
							return parent[name]
						end
					else
						return val
					end
				end,
				__call = function(cls, ...)
					local _self_0 = setmetatable({ }, _base_0)
					cls.__init(_self_0, ...)
					return _self_0
				end
			})
			_base_0.__class = _class_0
			if _parent_0.__inherited then
				_parent_0.__inherited(_parent_0, _class_0)
			end
			Sub = _class_0
		end
		local instance = Sub()
		assert.same(instance:baseMethod(), "base")
		return assert.same(instance:subMethod(), "sub")
	end)
end)
