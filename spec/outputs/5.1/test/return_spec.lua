return describe("return", function() -- 1
	it("should return from comprehension", function() -- 2
		local fn -- 3
		fn = function() -- 3
			local _accum_0 = { } -- 4
			local _len_0 = 1 -- 4
			for x = 1, 5 do -- 4
				_accum_0[_len_0] = x * 2 -- 4
				_len_0 = _len_0 + 1 -- 4
			end -- 4
			return _accum_0 -- 4
		end -- 3
		local result = fn() -- 5
		return assert.same(result, { -- 6
			2, -- 6
			4, -- 6
			6, -- 6
			8, -- 6
			10 -- 6
		}) -- 6
	end) -- 2
	it("should return from table comprehension", function() -- 8
		local fn -- 9
		fn = function() -- 9
			local _tbl_0 = { } -- 10
			for k, v in pairs({ -- 10
				a = 1, -- 10
				b = 2 -- 10
			}) do -- 10
				_tbl_0[k] = v -- 10
			end -- 10
			return _tbl_0 -- 10
		end -- 9
		local result = fn() -- 11
		return assert.same(type(result), "table") -- 12
	end) -- 8
	it("should return from nested if", function() -- 14
		local fn -- 15
		fn = function(a, b) -- 15
			if a then -- 16
				if b then -- 17
					return "both" -- 18
				else -- 20
					return "only a" -- 20
				end -- 17
			else -- 22
				return "neither" -- 22
			end -- 16
		end -- 15
		assert.same(fn(true, true), "both") -- 23
		assert.same(fn(true, false), "only a") -- 24
		return assert.same(fn(false, false), "neither") -- 25
	end) -- 14
	it("should return from switch", function() -- 27
		local fn -- 28
		fn = function(value) -- 28
			if 1 == value then -- 30
				return "one" -- 30
			elseif 2 == value then -- 31
				return "two" -- 31
			else -- 32
				return "other" -- 32
			end -- 29
		end -- 28
		assert.same(fn(1), "one") -- 33
		assert.same(fn(2), "two") -- 34
		return assert.same(fn(3), "other") -- 35
	end) -- 27
	it("should return table literal", function() -- 37
		local fn -- 38
		fn = function() -- 38
			return { -- 40
				value = 42, -- 40
				name = "test" -- 41
			} -- 39
		end -- 38
		local result = fn() -- 42
		assert.same(result.value, 42) -- 43
		return assert.same(result.name, "test") -- 44
	end) -- 37
	it("should return array literal", function() -- 46
		local fn -- 47
		fn = function() -- 47
			return { -- 49
				1, -- 49
				2, -- 50
				3 -- 51
			} -- 48
		end -- 47
		local result = fn() -- 52
		return assert.same(result, { -- 53
			1, -- 53
			2, -- 53
			3 -- 53
		}) -- 53
	end) -- 46
	it("should return from with statement", function() -- 55
		local fn -- 56
		fn = function(obj) -- 56
			local result = obj.value -- 57
			return result -- 58
		end -- 56
		return assert.same(fn({ -- 59
			value = 100 -- 59
		}), 100) -- 59
	end) -- 55
	it("should return nil implicitly", function() -- 61
		fn(function() -- 62
			return print("no return") -- 62
		end) -- 62
		return assert.same(fn(), nil) -- 63
	end) -- 61
	it("should return multiple values", function() -- 65
		fn(function() -- 66
			return 1, 2, 3 -- 66
		end) -- 66
		local a, b, c = fn() -- 67
		assert.same(a, 1) -- 68
		assert.same(b, 2) -- 69
		return assert.same(c, 3) -- 70
	end) -- 65
	it("should return from function call", function() -- 72
		local fn -- 73
		fn = function() -- 73
			local inner -- 74
			inner = function() -- 74
				return 42 -- 74
			end -- 74
			return inner() -- 75
		end -- 73
		return assert.same(fn(), 42) -- 76
	end) -- 72
	return it("should handle return in expression context", function() -- 78
		local fn -- 79
		fn = function(cond) -- 79
			if cond then -- 80
				return "yes" -- 81
			else -- 83
				return "no" -- 83
			end -- 80
		end -- 79
		assert.same(fn(true), "yes") -- 84
		return assert.same(fn(false), "no") -- 85
	end) -- 78
end) -- 1
