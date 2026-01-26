return describe("metatable", function()
	it("should get metatable with <> syntax", function()
		local obj = setmetatable({
			value = 42
		}, {
			__index = {
				extra = "data"
			}
		})
		local mt = getmetatable(obj)
		return assert.is_true(mt ~= nil)
	end)
	it("should set metatable with <>", function()
		local obj = { }
		setmetatable(obj, {
			__index = {
				value = 100
			}
		})
		return assert.same(obj.value, 100)
	end)
	it("should access metatable with <>", function()
		local obj = setmetatable({ }, {
			__index = {
				value = 50
			}
		})
		local result = getmetatable(obj).__index.value
		return assert.same(result, 50)
	end)
	it("should work with <index> metamethod", function()
		local obj = setmetatable({ }, {
			__index = function(self, key)
				if key == "computed" then
					return "computed_value"
				end
			end
		})
		return assert.same(obj.computed, "computed_value")
	end)
	it("should work with <newindex> metamethod", function()
		local obj = setmetatable({ }, {
			__newindex = function(self, key, value)
				return rawset(self, "stored_" .. key, value)
			end
		})
		obj.test = 123
		return assert.same(obj.stored_test, 123)
	end)
	it("should work with <add> metamethod", function()
		local obj = setmetatable({
			value = 10
		}, {
			__add = function(a, b)
				return a.value + b.value
			end
		})
		local obj2 = setmetatable({
			value = 20
		}, {
			__add = function(a, b)
				return a.value + b.value
			end
		})
		local result = obj + obj2
		return assert.same(result, 30)
	end)
	it("should work with <call> metamethod", function()
		local obj = setmetatable({ }, {
			__call = function(self, x)
				return x * 2
			end
		})
		local result = obj(5)
		return assert.same(result, 10)
	end)
	it("should work with <tostring> metamethod", function()
		local obj = setmetatable({
			value = 42
		}, {
			__tostring = function(self)
				return "Value: " .. tostring(self.value)
			end
		})
		local result = tostring(obj)
		return assert.same(result, "Value: 42")
	end)
	it("should work with <eq> metamethod", function()
		local obj1 = setmetatable({
			id = 1
		}, {
			__eq = function(a, b)
				return a.id == b.id
			end
		})
		local obj2 = setmetatable({
			id = 1
		}, {
			__eq = function(a, b)
				return a.id == b.id
			end
		})
		return assert.is_true(obj1 == obj2)
	end)
	it("should destructure metatable", function()
		local obj = setmetatable({ }, {
			new = function()
				return "new result"
			end,
			update = function()
				return "update result"
			end
		})
		local new, update
		do
			local _obj_0 = getmetatable(obj)
			new, update = _obj_0.new, _obj_0.update
		end
		assert.is_true(type(new) == "function")
		return assert.is_true(type(update) == "function")
	end)
	it("should check if two objects have same metatable", function()
		local mt = {
			value = 100
		}
		local obj1 = setmetatable({ }, mt)
		local obj2 = setmetatable({ }, mt)
		return assert.is_true(getmetatable(obj1) == getmetatable(obj2))
	end)
	return it("should work with <concat> metamethod", function()
		local obj = setmetatable({
			value = "hello"
		}, {
			__concat = function(a, b)
				return a.value .. b
			end
		})
		local result = obj .. " world"
		return assert.same(result, "hello world")
	end)
end)
