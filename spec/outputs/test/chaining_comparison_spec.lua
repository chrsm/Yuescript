local _anon_func_0 = function()
	local _cond_0 = "b"
	if not ("a" < _cond_0) then
		return false
	else
		return _cond_0 < "c"
	end
end
local _anon_func_1 = function()
	local _cond_0 = "b"
	if not ("a" <= _cond_0) then
		return false
	else
		return _cond_0 <= "c"
	end
end
local _anon_func_2 = function(v)
	local _cond_0 = v(2)
	if not (v(1) < _cond_0) then
		return false
	else
		return _cond_0 < v(3)
	end
end
return describe("chaining comparison", function()
	it("should support simple chaining", function()
		assert.is_true(1 < 2 and 2 < 3)
		assert.is_true(1 <= 2 and 2 <= 3)
		assert.is_true(3 > 2 and 2 > 1)
		return assert.is_true(3 >= 2 and 2 >= 1)
	end)
	it("should support complex chaining", function()
		return assert.is_true(1 < 2 and 2 <= 2 and 2 < 3 and 3 == 3 and 3 > 2 and 2 >= 1 and 1 == 1 and 1 < 3 and 3 ~= 5)
	end)
	it("should work with variables", function()
		local a = 5
		assert.is_true(1 <= a and a <= 10)
		assert.is_true(a >= 3)
		return assert.is_true(a <= 10)
	end)
	it("should handle mixed comparisons", function()
		local x = 5
		assert.is_true(1 < x and x < 10)
		return assert.is_true(1 <= x and x <= 5)
	end)
	it("should work with string comparisons", function()
		assert.is_true(_anon_func_0())
		return assert.is_true(_anon_func_1())
	end)
	it("should handle edge cases", function()
		assert.is_true(0 <= 0 and 0 <= 0)
		return assert.is_true(-5 < 0 and 0 < 5)
	end)
	it("should work in expressions", function()
		local result
		if 1 < 2 and 2 < 3 then
			result = "yes"
		else
			result = "no"
		end
		return assert.same(result, "yes")
	end)
	it("should support != operator", function()
		assert.is_true(1 ~= 2 and 2 ~= 3)
		return assert.is_true(1 ~= 2 and 2 ~= 3)
	end)
	it("should handle boolean results", function()
		assert.is_true(1 < 2 and 2 < 3)
		return assert.is_false(3 < 2 and 2 < 1)
	end)
	it("should work with function calls", function()
		local v
		v = function(x)
			return x
		end
		return assert.is_true(_anon_func_2(v))
	end)
	it("should handle negation", function()
		return assert.is_true(-10 < -5 and -5 < 0)
	end)
	return it("should support mixed operators", function()
		assert.is_true(1 < 2 and 2 <= 2 and 2 < 3)
		return assert.is_true(3 > 2 and 2 >= 2 and 2 > 1)
	end)
end)
