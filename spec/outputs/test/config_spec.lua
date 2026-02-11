return describe("config", function()
	it("should handle implicit return", function()
		local fn
		fn = function()
			return 42
		end
		return assert.same(fn(), 42)
	end)
	it("should handle return in last position", function()
		local fn
		fn = function()
			if true then
				return 100
			else
				return 200
			end
		end
		return assert.same(fn(), 100)
	end)
	it("should work with various code patterns", function()
		local x = 1 + 2
		local y
		if x > 0 then
			y = "positive"
		else
			y = "negative"
		end
		return assert.same(y, "positive")
	end)
	it("should handle class definitions", function()
		local TestClass
		do
			local _class_0
			local _base_0 = {
				value = 100,
				get_value = function(self)
					return self.value
				end
			}
			if _base_0.__index == nil then
				_base_0.__index = _base_0
			end
			_class_0 = setmetatable({
				__init = function() end,
				__base = _base_0,
				__name = "TestClass"
			}, {
				__index = _base_0,
				__call = function(cls, ...)
					local _self_0 = setmetatable({ }, _base_0)
					cls.__init(_self_0, ...)
					return _self_0
				end
			})
			_base_0.__class = _class_0
			TestClass = _class_0
		end
		local instance = TestClass()
		return assert.same(instance:get_value(), 100)
	end)
	it("should handle macro definitions", function()
		local result = (5 + 1)
		return assert.same(result, 6)
	end)
	it("should handle import statements", function()
		local format
		do
			local _obj_0 = require("string")
			format = _obj_0.format
		end
		return assert.is_true(type(format) == "function")
	end)
	it("should handle string interpolation", function()
		local name = "world"
		local result = "hello " .. tostring(name)
		return assert.same(result, "hello world")
	end)
	it("should handle comprehensions", function()
		local result
		do
			local _accum_0 = { }
			local _len_0 = 1
			for x = 1, 5 do
				_accum_0[_len_0] = x * 2
				_len_0 = _len_0 + 1
			end
			result = _accum_0
		end
		return assert.same(result, {
			2,
			4,
			6,
			8,
			10
		})
	end)
	it("should handle switch expressions", function()
		local result
		do
			local _exp_0 = 2
			if 1 == _exp_0 then
				result = "one"
			elseif 2 == _exp_0 then
				result = "two"
			else
				result = "other"
			end
		end
		return assert.same(result, "two")
	end)
	it("should handle with statements", function()
		local obj = {
			x = 10,
			y = 20
		}
		local result
		repeat
			result = obj.x + obj.y
			break
		until true
		return assert.same(result, 30)
	end)
	it("should handle existential operators", function()
		local obj = {
			value = 100
		}
		local result
		if obj ~= nil then
			result = obj.value
		end
		return assert.same(result, 100)
	end)
	it("should handle pipe operator", function()
		local result = table.concat({
			1,
			2,
			3
		})
		return assert.same(result, "123")
	end)
	it("should handle loops", function()
		local sum = 0
		for i = 1, 5 do
			sum = sum + i
		end
		return assert.same(sum, 15)
	end)
	it("should handle while loops", function()
		local count = 0
		while count < 3 do
			count = count + 1
		end
		return assert.same(count, 3)
	end)
	it("should handle table literals", function()
		local t = {
			key1 = "value1",
			key2 = "value2"
		}
		return assert.same(t.key1, "value1")
	end)
	it("should handle function definitions", function()
		local fn
		fn = function(a, b)
			return a + b
		end
		return assert.same(fn(5, 3), 8)
	end)
	it("should handle nested functions", function()
		local outer
		outer = function()
			local inner
			inner = function(x)
				return x * 2
			end
			return inner(10)
		end
		return assert.same(outer(), 20)
	end)
	return it("should handle destructure", function()
		local t = {
			x = 1,
			y = 2,
			z = 3
		}
		local x, y, z = t.x, t.y, t.z
		assert.same(x, 1)
		assert.same(y, 2)
		return assert.same(z, 3)
	end)
end)
