local _anon_func_0 = function(v)
	local _cond_0 = v(2)
	if not (v(1) < _cond_0) then
		return false
	else
		return _cond_0 <= v(3)
	end
end
return describe("advanced operators", function()
	it("should support chaining comparisons with functions", function()
		local v
		v = function(x)
			return x
		end
		return assert.is_true(_anon_func_0(v))
	end)
	it("should handle compound assignment with or", function()
		local x = nil
		x = x or "default"
		return assert.same(x, "default")
	end)
	it("should not overwrite existing value with or", function()
		local x = "existing"
		x = x or "default"
		return assert.same(x, "existing")
	end)
	it("should support compound string concatenation", function()
		local s = "hello"
		s = s .. " world"
		return assert.same(s, "hello world")
	end)
	it("should work with table appending", function()
		local tab = {
			1,
			2
		}
		tab[#tab + 1] = 3
		tab[#tab + 1] = 4
		return assert.same(tab, {
			1,
			2,
			3,
			4
		})
	end)
	it("should handle spread append", function()
		local tbA = {
			1,
			2
		}
		local tbB = {
			3,
			4
		}
		local _len_0 = #tbA + 1
		for _index_0 = 1, #tbB do
			local _elm_0 = tbB[_index_0]
			tbA[_len_0], _len_0 = _elm_0, _len_0 + 1
		end
		return assert.same(tbA, {
			1,
			2,
			3,
			4
		})
	end)
	it("should support reverse indexing", function()
		local items = {
			1,
			2,
			3,
			4,
			5
		}
		assert.same(items[#items], 5)
		assert.same(items[#items - 1], 4)
		return assert.same(items[#items - 2], 3)
	end)
	it("should work with nil coalescing assignment", function()
		local x = nil
		if x == nil then
			x = "default"
		end
		return assert.same(x, "default")
	end)
	it("should not assign with ??= when value exists", function()
		local x = "existing"
		if x == nil then
			x = "default"
		end
		return assert.same(x, "existing")
	end)
	it("should chain nil coalescing", function()
		local a = nil
		local b = nil
		local c = "value"
		local result
		if a ~= nil then
			result = a
		else
			if b ~= nil then
				result = b
			else
				result = c
			end
		end
		return assert.same(result, "value")
	end)
	it("should support compound modulo", function()
		local x = 20
		x = x % 3
		return assert.same(x, 2)
	end)
	it("should handle compound exponentiation", function()
		local x = 2
		x = x ^ 3
		return assert.same(x, 8)
	end)
	it("should work with compound bitwise and", function()
		local x = 15
		x = x & 7
		return assert.same(x, 7)
	end)
	it("should support compound bitwise or", function()
		local x = 8
		x = x | 3
		return assert.same(x, 11)
	end)
	it("should handle compound bitwise xor", function()
		local x = 12
		x = x ~ 10
		return assert.same(x, 6)
	end)
	it("should work with compound left shift", function()
		local x = 2
		x = x << 3
		return assert.same(x, 16)
	end)
	it("should support compound right shift", function()
		local x = 16
		x = x >> 2
		return assert.same(x, 4)
	end)
	it("should handle negation operator", function()
		assert.same(-10, -10)
		return assert.same
	end)
	it("should work with length operator on tables", function()
		local tab = {
			1,
			2,
			3,
			4,
			5
		}
		return assert.same(#tab, 5)
	end)
	it("should support length on strings", function()
		local s = "hello"
		return assert.same(#s, 5)
	end)
	it("should handle chaining assignment", function()
		local a = 0
		local b = 0
		local c = 0
		local d = 0
		assert.same(a, 0)
		assert.same(b, 0)
		assert.same(c, 0)
		return assert.same(d, 0)
	end)
	it("should work with chaining assignment with functions", function()
		local f
		f = function()
			return 42
		end
		local x = f()
		local y = x
		local z = x
		assert.same(x, 42)
		assert.same(y, 42)
		return assert.same(z, 42)
	end)
	it("should support != as alias for ~=", function()
		assert.is_true(1 ~= 2)
		return assert.is_false(1 ~= 1)
	end)
	it("should work with :: for method chaining", function()
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
		local result = obj:add(5):get()
		return assert.same(result, 15)
	end)
	it("should handle complex expressions with precedence", function()
		local result = 1 + 2 * 3 - 4 / 2
		return assert.same(result, 5)
	end)
	return it("should support mixed operator types", function()
		local result = 10 + 20 * 2 - 5 / 5
		return assert.same(result, 49)
	end)
end)
