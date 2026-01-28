return describe("multiline arguments", function()
	it("should split arguments across lines", function()
		local sum
		sum = function(a, b, c, d, e, f)
			return a + b + c + d + e + f
		end
		local result = sum(5, 4, 3, 8, 9, 10)
		return assert.same(result, 39)
	end)
	it("should handle nested function calls", function()
		local outer
		outer = function(a, b, c, d, e, f)
			return a + b + c + d + e + f
		end
		local result = outer(5, 6, 7, 6, 2, 3)
		return assert.same(result, 29)
	end)
	it("should work with string arguments", function()
		local fn
		fn = function(a, b, c, d)
			return a .. b .. c .. d
		end
		local result = fn("hello", " ", "world", "!")
		return assert.same(result, "hello world!")
	end)
	it("should support table arguments", function()
		local fn
		fn = function(a, b, c)
			return {
				a,
				b,
				c
			}
		end
		local result = fn({
			1,
			2
		}, {
			3,
			4
		}, {
			5,
			6
		})
		return assert.same(result, {
			{
				1,
				2
			},
			{
				3,
				4
			},
			{
				5,
				6
			}
		})
	end)
	it("should handle mixed types", function()
		local fn
		fn = function(a, b, c, d)
			return {
				a,
				b,
				c,
				d
			}
		end
		local result = fn("text", 123, true, nil)
		return assert.same(result, {
			"text",
			123,
			true,
			nil
		})
	end)
	it("should work in table literal", function()
		local fn
		fn = function(a, b)
			return a + b
		end
		local result = {
			1,
			2,
			3,
			4,
			fn(4, 5, 5, 6),
			8,
			9,
			10
		}
		return assert.same(result, {
			1,
			2,
			3,
			4,
			9,
			8,
			9,
			10
		})
	end)
	it("should handle deeply nested indentation", function()
		local fn
		fn = function(a, b, c, d, e, f, g)
			return a + b + c + d + e + f + g
		end
		local y = {
			fn(1, 2, 3, 4, 5, 6, 7)
		}
		local result = y[1]
		return assert.same(result, 28)
	end)
	it("should work with conditional statements", function()
		local fn
		fn = function(a, b, c, d, e, f)
			return a + b + c + d + e + f
		end
		local result1 = fn(1, 2, 3, 4, 5, 6)
		local result
		if result1 > 20 then
			result = "yes"
		else
			result = "no"
		end
		return assert.same(result, "yes")
	end)
	it("should support function expressions", function()
		local doublePlus
		doublePlus = function(x, y)
			return x * 2 + y
		end
		local result = doublePlus(5, 10)
		return assert.same(result, 20)
	end)
	it("should handle chained function calls", function()
		local add
		add = function(a, b, c, d)
			return a + b + c + d
		end
		local multiply
		multiply = function(a, b, c, d)
			return a * b * c * d
		end
		local result = multiply(1, 2, 3, 4)
		return assert.same(result, 24)
	end)
	it("should work with method calls", function()
		local obj = {
			value = 10,
			add = function(self, a, b, c)
				return self.value + a + b + c
			end
		}
		local result = obj:add(5, 10, 15)
		return assert.same(result, 40)
	end)
	it("should support many arguments", function()
		local sum_many
		sum_many = function(...)
			local total = 0
			for i = 1, select('#', ...) do
				if type(select(i, ...)) == "number" then
					total = total + select(i, ...)
				end
			end
			return total
		end
		local result = sum_many(1, 2, 3, 4, 5, 6, 7, 8, 9)
		return assert.same(result, 45)
	end)
	it("should work with return statement", function()
		local fn
		fn = function(a, b, c)
			return a + b + c
		end
		local get_value
		get_value = function()
			return fn(10, 20, 30)
		end
		local result = get_value()
		return assert.same(result, 60)
	end)
	it("should handle default parameters", function()
		local fn
		fn = function(a, b, c)
			if a == nil then
				a = 1
			end
			if b == nil then
				b = 2
			end
			if c == nil then
				c = 3
			end
			return a + b + c
		end
		local result = fn(10, 20, 30)
		return assert.same(result, 60)
	end)
	return it("should work with varargs", function()
		local collect
		collect = function(...)
			return {
				...
			}
		end
		local result = collect(1, 2, 3, 4, 5, 6)
		return assert.same(result, {
			1,
			2,
			3,
			4,
			5,
			6
		})
	end)
end)
