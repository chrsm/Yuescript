return describe("return", function()
	it("should return from comprehension", function()
		local fn
		fn = function()
			local _accum_0 = { }
			local _len_0 = 1
			for x = 1, 5 do
				_accum_0[_len_0] = x * 2
				_len_0 = _len_0 + 1
			end
			return _accum_0
		end
		local result = fn()
		return assert.same(result, {
			2,
			4,
			6,
			8,
			10
		})
	end)
	it("should return from table comprehension", function()
		local fn
		fn = function()
			local _tbl_0 = { }
			for k, v in pairs({
				a = 1,
				b = 2
			}) do
				_tbl_0[k] = v
			end
			return _tbl_0
		end
		local result = fn()
		return assert.same(type(result), "table")
	end)
	it("should return from nested if", function()
		local fn
		fn = function(a, b)
			if a then
				if b then
					return "both"
				else
					return "only a"
				end
			else
				return "neither"
			end
		end
		assert.same(fn(true, true), "both")
		assert.same(fn(true, false), "only a")
		return assert.same(fn(false, false), "neither")
	end)
	it("should return from switch", function()
		local fn
		fn = function(value)
			if 1 == value then
				return "one"
			elseif 2 == value then
				return "two"
			else
				return "other"
			end
		end
		assert.same(fn(1), "one")
		assert.same(fn(2), "two")
		return assert.same(fn(3), "other")
	end)
	it("should return table literal", function()
		local fn
		fn = function()
			return {
				value = 42,
				name = "test"
			}
		end
		local result = fn()
		assert.same(result.value, 42)
		return assert.same(result.name, "test")
	end)
	it("should return array literal", function()
		local fn
		fn = function()
			return {
				1,
				2,
				3
			}
		end
		local result = fn()
		return assert.same(result, {
			1,
			2,
			3
		})
	end)
	it("should return from with statement", function()
		local fn
		fn = function(obj)
			local result = obj.value
			return result
		end
		return assert.same(fn({
			value = 100
		}), 100)
	end)
	it("should return nil implicitly", function()
		local fn
		fn = function()
			local _ = "no return"
		end
		return assert.same(fn(), nil)
	end)
	it("should return multiple values", function()
		local fn
		fn = function()
			return 1, 2, 3
		end
		local a, b, c = fn()
		assert.same(a, 1)
		assert.same(b, 2)
		return assert.same(c, 3)
	end)
	it("should return from function call", function()
		local fn
		fn = function()
			local inner
			inner = function()
				return 42
			end
			return inner()
		end
		return assert.same(fn(), 42)
	end)
	return it("should handle return in expression context", function()
		local fn
		fn = function(cond)
			if cond then
				return "yes"
			else
				return "no"
			end
		end
		assert.same(fn(true), "yes")
		return assert.same(fn(false), "no")
	end)
end)
