return describe("do statement", function()
	it("should create new scope", function()
		local x = 10
		do
			local x = 20
			assert.same(x, 20)
		end
		return assert.same(x, 10)
	end)
	it("should return value from do block", function()
		local result
		do
			local x = 5
			result = x * 2
		end
		return assert.same(result, 10)
	end)
	it("should work with multiple statements", function()
		local result
		do
			local a = 1
			local b = 2
			local c = 3
			result = a + b + c
		end
		return assert.same(result, 6)
	end)
	it("should handle nested do blocks", function()
		local result
		do
			local x = 10
			local y
			do
				local z = 5
				y = z * 2
			end
			result = x + y
		end
		return assert.same(result, 20)
	end)
	it("should support conditional in do block", function()
		local result
		do
			local value = 5
			if value > 3 then
				result = value * 2
			else
				result = value
			end
		end
		return assert.same(result, 10)
	end)
	it("should work with loops in do block", function()
		local result
		do
			local sum = 0
			for i = 1, 5 do
				sum = sum + i
			end
			result = sum
		end
		return assert.same(result, 15)
	end)
	it("should handle table operations", function()
		local result
		do
			local tb = {
				1,
				2,
				3
			}
			table.insert(tb, 4)
			result = #tb
		end
		return assert.same(result, 4)
	end)
	it("should work with function definition", function()
		local result
		do
			local fn
			fn = function(x)
				return x * 2
			end
			result = fn(5)
		end
		return assert.same(result, 10)
	end)
	it("should support variable shadowing", function()
		local x = "outer"
		local result
		do
			local x = "inner"
			result = x
		end
		assert.same(result, "inner")
		return assert.same(x, "outer")
	end)
	it("should work with method calls", function()
		local obj = {
			value = 10,
			double = function(self)
				return self.value * 2
			end
		}
		local result
		do
			repeat
				result = obj:double()
				break
			until true
		end
		return assert.same(result, 20)
	end)
	it("should handle comprehensions in do block", function()
		local result
		do
			local items = {
				1,
				2,
				3,
				4,
				5
			}
			local _accum_0 = { }
			local _len_0 = 1
			for _index_0 = 1, #items do
				local item = items[_index_0]
				_accum_0[_len_0] = item * 2
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
	it("should work with try-catch", function()
		local success, result = xpcall(function()
			error("test error")
			return false
		end, function(err)
			return true
		end)
		assert.is_false(success)
		return assert.is_true(result)
	end)
	it("should support return statement", function()
		local fn
		fn = function()
			do
				local x = 10
				return x * 2
			end
			return "never reached"
		end
		local result = fn()
		return assert.same(result, 20)
	end)
	it("should work with assignment", function()
		local result
		do
			local a, b, c = 1, 2, 3
			result = a + b + c
		end
		return assert.same(result, 6)
	end)
	it("should handle destructuring", function()
		local result
		do
			local tb = {
				x = 10,
				y = 20
			}
			local x, y = tb.x, tb.y
			result = x + y
		end
		return assert.same(result, 30)
	end)
	it("should work with string interpolation", function()
		local name = "world"
		local result
		do
			local greeting = "hello"
			result = tostring(greeting) .. " " .. tostring(name)
		end
		return assert.same(result, "hello world")
	end)
	it("should support implicit return", function()
		local result
		do
			local value = 42
			result = value
		end
		return assert.same(result, 42)
	end)
	it("should handle empty do block", function()
		local result
		do
			result = nil
		end
		return assert.same(result, nil)
	end)
	return it("should work with backcalls", function()
		local map
		map = function(f, items)
			local _accum_0 = { }
			local _len_0 = 1
			for _index_0 = 1, #items do
				local item = items[_index_0]
				_accum_0[_len_0] = f(item)
				_len_0 = _len_0 + 1
			end
			return _accum_0
		end
		local result
		do
			local items = {
				1,
				2,
				3
			}
			result = map(function(x)
				return x * 2
			end, items)
		end
		return assert.same(result, {
			2,
			4,
			6
		})
	end)
end)
