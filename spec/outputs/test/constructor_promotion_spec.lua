return describe("constructor promotion", function()
	it("should promote simple arguments to assignment", function()
		local Thing
		do
			local _class_0
			local _base_0 = { }
			if _base_0.__index == nil then
				_base_0.__index = _base_0
			end
			_class_0 = setmetatable({
				__init = function(self, name, age)
					self.name = name
					self.age = age
				end,
				__base = _base_0,
				__name = "Thing"
			}, {
				__index = _base_0,
				__call = function(cls, ...)
					local _self_0 = setmetatable({ }, _base_0)
					cls.__init(_self_0, ...)
					return _self_0
				end
			})
			_base_0.__class = _class_0
			Thing = _class_0
		end
		local instance = Thing("Alice", 30)
		assert.same(instance.name, "Alice")
		return assert.same(instance.age, 30)
	end)
	it("should promote multiple arguments", function()
		local Point
		do
			local _class_0
			local _base_0 = { }
			if _base_0.__index == nil then
				_base_0.__index = _base_0
			end
			_class_0 = setmetatable({
				__init = function(self, x, y, z)
					self.x = x
					self.y = y
					self.z = z
				end,
				__base = _base_0,
				__name = "Point"
			}, {
				__index = _base_0,
				__call = function(cls, ...)
					local _self_0 = setmetatable({ }, _base_0)
					cls.__init(_self_0, ...)
					return _self_0
				end
			})
			_base_0.__class = _class_0
			Point = _class_0
		end
		local p = Point(1, 2, 3)
		assert.same(p.x, 1)
		assert.same(p.y, 2)
		return assert.same(p.z, 3)
	end)
	return it("should work with multiple parameters", function()
		local Container
		do
			local _class_0
			local _base_0 = { }
			if _base_0.__index == nil then
				_base_0.__index = _base_0
			end
			_class_0 = setmetatable({
				__init = function(self, a, b, c)
					self.a = a
					self.b = b
					self.c = c
				end,
				__base = _base_0,
				__name = "Container"
			}, {
				__index = _base_0,
				__call = function(cls, ...)
					local _self_0 = setmetatable({ }, _base_0)
					cls.__init(_self_0, ...)
					return _self_0
				end
			})
			_base_0.__class = _class_0
			Container = _class_0
		end
		local c = Container()
		assert.same(c.a, nil)
		assert.same(c.b, nil)
		return assert.same(c.c, nil)
	end)
end)
