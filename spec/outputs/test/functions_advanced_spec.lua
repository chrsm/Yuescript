return describe("advanced functions", function()
	it("should support fat arrow with self", function()
		local obj = {
			value = 10,
			getValue = function(self)
				return self.value
			end
		}
		return assert.same(obj:getValue(), 10)
	end)
	it("should work with argument defaults", function()
		local fn
		fn = function(name, height)
			if name == nil then
				name = "something"
			end
			if height == nil then
				height = 100
			end
			return tostring(name) .. ", " .. tostring(height)
		end
		assert.same(fn(), "something, 100")
		assert.same(fn("test"), "test, 100")
		return assert.same(fn("test", 50), "test, 50")
	end)
	it("should handle defaults with previous arguments", function()
		local fn
		fn = function(x, y)
			if x == nil then
				x = 100
			end
			if y == nil then
				y = x + 1000
			end
			return x + y
		end
		assert.same(fn(), 1200)
		return assert.same(fn(50), 1100)
	end)
	it("should work with multi-line arguments", function()
		local my_func
		my_func = function(a, b, c, d, e, f)
			return a + b + c + d + e + f
		end
		local result = my_func(5, 4, 3, 8, 9, 10)
		return assert.same(result, 39)
	end)
	it("should support nested function calls", function()
		local another_func
		another_func = function(a, b, c, d, e, f)
			return a + b + c + d + e + f
		end
		local my_func
		my_func = function(a, b, c, d, e, f, g)
			return a + b + c + d + e + f + g
		end
		local result = my_func(5, 6, 7, 6, another_func(6, 7, 8, 9, 1, 2), 5, 4)
		return assert.same(result, 66)
	end)
	it("should handle implicit return", function()
		local sum
		sum = function(x, y)
			return x + y
		end
		return assert.same(sum(10, 20), 30)
	end)
	it("should work with explicit return", function()
		local difference
		difference = function(x, y)
			return x - y
		end
		return assert.same(difference(20, 10), 10)
	end)
	it("should support multiple return values", function()
		local mystery
		mystery = function(x, y)
			return x + y, x - y
		end
		local a, b = mystery(10, 20)
		assert.same(a, 30)
		return assert.same(b, -10)
	end)
	it("should work with function as argument", function()
		local apply
		apply = function(fn, x, y)
			return fn(x, y)
		end
		local result = apply((function(a, b)
			return a + b
		end), 5, 10)
		return assert.same(result, 15)
	end)
	it("should handle function returning function", function()
		local create_adder
		create_adder = function(x)
			return function(y)
				return x + y
			end
		end
		local add_five = create_adder(5)
		return assert.same(add_five(10), 15)
	end)
	it("should support immediately invoked function", function()
		local result = (function(x)
			return x * 2
		end)(5)
		return assert.same(result, 10)
	end)
	it("should work with varargs", function()
		local sum_all
		sum_all = function(...)
			local total = 0
			for i = 1, select('#', ...) do
				if type(select(i, ...)) == "number" then
					total = total + select(i, ...)
				end
			end
			return total
		end
		return assert.same(sum_all(1, 2, 3, 4, 5), 15)
	end)
	it("should handle named varargs", function()
		local fn
		fn = function(...)
			local t = {
				n = select("#", ...),
				...
			}
			local count = 0
			for i = 1, t.n do
				count = count + 1
			end
			return count
		end
		return assert.same(fn(1, 2, 3), 3)
	end)
	it("should support prefixed return", function()
		local findValue
		findValue = function()
			local items = {
				1,
				2,
				3
			}
			for _index_0 = 1, #items do
				local item = items[_index_0]
				if item == 5 then
					return item
				end
			end
			return "not found"
		end
		local result = findValue()
		return assert.same(result, "not found")
	end)
	it("should work with parameter destructuring", function()
		local fn
		fn = function(_arg_0)
			local a, b, c
			a, b, c = _arg_0.a, _arg_0.b, _arg_0.c
			return a + b + c
		end
		return assert.same(fn({
			a = 1,
			b = 2,
			c = 3
		}), 6)
	end)
	it("should handle default values in destructuring", function()
		local fn
		fn = function(_arg_0)
			local a1, b
			a1, b = _arg_0.a, _arg_0.b
			if a1 == nil then
				a1 = 123
			end
			if b == nil then
				b = 'abc'
			end
			return a1 .. " " .. b
		end
		assert.same(fn({ }), "123 abc")
		return assert.same(fn({
			a = 456
		}), "456 abc")
	end)
	it("should support empty function body", function()
		local empty_fn
		empty_fn = function() end
		return assert.same(empty_fn(), nil)
	end)
	it("should work with function in table", function()
		local tb = {
			value = 10,
			double = function(self)
				return self.value * 2
			end
		}
		return assert.same(tb:double(), 20)
	end)
	it("should handle function with no arguments", function()
		local fn
		fn = function()
			return "result"
		end
		assert.same(fn(), "result")
		return assert.same(fn(), "result")
	end)
	it("should support calling function with !", function()
		local fn
		fn = function()
			return 42
		end
		return assert.same(fn(), 42)
	end)
	it("should work with nested functions", function()
		local outer
		outer = function(x)
			local inner
			inner = function(y)
				return x + y
			end
			return inner
		end
		local add_five = outer(5)
		return assert.same(add_five(10), 15)
	end)
	it("should handle function in expression", function()
		local result
		if (function(x)
			return x > 10
		end)(15) then
			result = "large"
		else
			result = "small"
		end
		return assert.same(result, "large")
	end)
	return it("should support function as return value", function()
		local get_operation
		get_operation = function(op)
			if "add" == op then
				return function(a, b)
					return a + b
				end
			elseif "subtract" == op then
				return function(a, b)
					return a - b
				end
			else
				return function()
					return 0
				end
			end
		end
		local add = get_operation("add")
		return assert.same(add(5, 3), 8)
	end)
end)
