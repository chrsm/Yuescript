return describe("export", function()
	it("should export basic variables", function()
		local a = 1
		local b = 2
		local c = 3
		assert.same(a, 1)
		assert.same(b, 2)
		return assert.same(c, 3)
	end)
	it("should export multiple variables at once", function()
		local x, y, z = 10, 20, 30
		assert.same(x, 10)
		assert.same(y, 20)
		return assert.same(z, 30)
	end)
	it("should export class definitions", function()
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
	it("should export function expressions", function()
		local my_func
		my_func = function()
			return 42
		end
		return assert.same(my_func(), 42)
	end)
	it("should export conditional expressions", function()
		local result
		if true then
			result = "yes"
		else
			result = "no"
		end
		return assert.same(result, "yes")
	end)
	it("should export switch expressions", function()
		local value
		do
			local _exp_0 = 5
			if 5 == _exp_0 then
				value = 100
			else
				value = 0
			end
		end
		return assert.same(value, 100)
	end)
	it("should export with do block", function()
		local result
		do
			local x = 5
			result = x * 2
		end
		return assert.same(result, 10)
	end)
	it("should export comprehension", function()
		local doubled
		do
			local _accum_0 = { }
			local _len_0 = 1
			for i = 1, 5 do
				_accum_0[_len_0] = i * 2
				_len_0 = _len_0 + 1
			end
			doubled = _accum_0
		end
		return assert.same(doubled, {
			2,
			4,
			6,
			8,
			10
		})
	end)
	it("should export with pipe operator", function()
		local result = table.concat({
			1,
			2,
			3
		})
		return assert.same(result, "123")
	end)
	it("should export nil values", function()
		local empty = nil
		return assert.same(empty, nil)
	end)
	it("should export tables", function()
		local config = {
			key1 = "value1",
			key2 = "value2"
		}
		assert.same(config.key1, "value1")
		return assert.same(config.key2, "value2")
	end)
	it("should export string values", function()
		local message = "hello world"
		return assert.same(message, "hello world")
	end)
	it("should export boolean values", function()
		local flag_true = true
		local flag_false = false
		assert.is_true(flag_true)
		return assert.is_false(flag_false)
	end)
	it("should export number values", function()
		local count = 42
		local price = 19.99
		assert.same(count, 42)
		return assert.same(price, 19.99)
	end)
	it("should export function with parameters", function()
		local add
		add = function(a, b)
			return a + b
		end
		return assert.same(add(5, 3), 8)
	end)
	it("should maintain export order", function()
		local first = 1
		local second = 2
		local third = 3
		assert.same(first, 1)
		assert.same(second, 2)
		return assert.same(third, 3)
	end)
	return it("should work with complex expressions", function()
		local calc = (10 + 20) * 2
		return assert.same(calc, 60)
	end)
end)
