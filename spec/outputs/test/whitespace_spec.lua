return describe("whitespace", function()
	it("should support semicolon statement separator", function()
		local a = 1
		local b = 2
		local result = a + b
		return assert.same(result, 3)
	end)
	it("should handle multiple statements on one line", function()
		local x = 10
		local y = 20
		local z = x + y
		return assert.same(z, 30)
	end)
	it("should work with semicolon in function", function()
		local fn
		fn = function()
			local a = 1
			local b = 2
			return a + b
		end
		return assert.same(fn(), 3)
	end)
	it("should support multiline chaining", function()
		local obj = {
			value = 10,
			add = function(self, n)
				self.value = self.value + n
				return self
			end,
			get = function(self)
				return self.value
			end
		}
		local result = obj:add(5):add(10):get()
		return assert.same(result, 25)
	end)
	it("should handle multiline method calls", function()
		local str = "  hello  "
		local result = str:match("^%s*(.-)%s*$"):upper()
		return assert.same(result, "HELLO")
	end)
	it("should work with nested chaining", function()
		local obj = {
			level1 = {
				level2 = {
					level3 = function(self)
						return "deep"
					end
				}
			}
		}
		local result = obj.level1.level2:level3()
		return assert.same(result, "deep")
	end)
	it("should support chaining with conditionals", function()
		local obj = {
			value = 10,
			isPositive = function(self)
				return self.value > 0
			end
		}
		local result = obj:isPositive()
		return assert.is_true(result)
	end)
	it("should work with pipe in chaining", function()
		local result = table.concat((function(tb)
			local _accum_0 = { }
			local _len_0 = 1
			for _index_0 = 1, #tb do
				local x = tb[_index_0]
				_accum_0[_len_0] = x * 2
				_len_0 = _len_0 + 1
			end
			return _accum_0
		end)({
			1,
			2,
			3
		}))
		return assert.same(result, "246")
	end)
	it("should handle mixed separators", function()
		local a = 1
		local b = 2
		local c = 3
		local d = 4
		local result = a + b + c + d
		return assert.same(result, 10)
	end)
	it("should support indentation with spaces", function()
		local fn
		fn = function()
			if true then
				local result = 10
				return result
			end
		end
		return assert.same(fn(), 10)
	end)
	it("should work with consistent indentation", function()
		local tb = {
			a = 1,
			b = 2,
			nested = {
				c = 3,
				d = 4
			}
		}
		assert.same(tb.a, 1)
		return assert.same(tb.nested.c, 3)
	end)
	it("should handle semicolon with comments", function()
		local a = 1
		local b = 2
		local result = a + b
		return assert.same(result, 3)
	end)
	it("should work in multiline function call", function()
		local sum
		sum = function(a, b)
			return a + b
		end
		local result = sum(5, sum(10, sum(3, 7)))
		return assert.same(result, 25)
	end)
	it("should support chaining in assignment", function()
		local obj = {
			value = 5,
			double = function(self)
				return self.value * 2
			end
		}
		local doubled = obj:double()
		return assert.same(doubled, 10)
	end)
	it("should handle complex chaining", function()
		local result = ("hello"):upper():sub(1, 3):lower()
		return assert.same(result, "hel")
	end)
	return it("should work with backcalls and whitespace", function()
		local readAsync
		readAsync = function(file, callback)
			return callback("data")
		end
		local process
		process = function(data)
			if data then
				return true
			end
		end
		local results
		do
			results = readAsync("data.txt", function(data)
				return process(data)
			end)
		end
		return assert.is_true(true)
	end)
end)
