return describe("vararg", function() -- 1
	it("should pass varargs to function", function() -- 2
		local sum -- 3
		sum = function(...) -- 3
			local total = 0 -- 4
			for i = 1, select("#", ...) do -- 5
				if type(select(i, ...)) == "number" then -- 6
					total = total + select(i, ...) -- 7
				end -- 6
			end -- 5
			return total -- 8
		end -- 3
		local result = sum(1, 2, 3, 4, 5) -- 9
		return assert.same(result, 15) -- 10
	end) -- 2
	it("should handle empty varargs", function() -- 12
		local fn -- 13
		fn = function(...) -- 13
			return select("#", ...) -- 13
		end -- 13
		local result = fn() -- 14
		return assert.same(result, 0) -- 15
	end) -- 12
	it("should spread varargs in function call", function() -- 17
		local receiver -- 18
		receiver = function(a, b, c) -- 18
			return { -- 18
				a, -- 18
				b, -- 18
				c -- 18
			} -- 18
		end -- 18
		local source -- 19
		source = function() -- 19
			return 1, 2, 3 -- 19
		end -- 19
		local result = receiver(source()) -- 20
		return assert.same(result, { -- 21
			1, -- 21
			2, -- 21
			3 -- 21
		}) -- 21
	end) -- 17
	it("should use varargs in table", function() -- 23
		local fn -- 24
		fn = function(...) -- 24
			return { -- 24
				... -- 24
			} -- 24
		end -- 24
		local result = fn(1, 2, 3) -- 25
		return assert.same(result, { -- 26
			1, -- 26
			2, -- 26
			3 -- 26
		}) -- 26
	end) -- 23
	it("should forward varargs", function() -- 28
		local middle -- 29
		middle = function(fn, ...) -- 29
			return fn(...) -- 29
		end -- 29
		local inner -- 30
		inner = function(a, b, c) -- 30
			return a + b + c -- 30
		end -- 30
		local result = middle(inner, 1, 2, 3) -- 31
		return assert.same(result, 6) -- 32
	end) -- 28
	it("should count varargs with select", function() -- 34
		local fn -- 35
		fn = function(...) -- 35
			return select("#", ...) -- 35
		end -- 35
		assert.same(fn(1, 2, 3), 3) -- 36
		assert.same(fn("a", "b"), 2) -- 37
		return assert.same(fn(), 0) -- 38
	end) -- 34
	it("should select from varargs", function() -- 40
		local fn -- 41
		fn = function(...) -- 41
			return select(2, ...) -- 41
		end -- 41
		local result = fn(1, 2, 3) -- 42
		return assert.same(result, 2) -- 43
	end) -- 40
	it("should work with named parameters and varargs", function() -- 45
		local fn -- 46
		fn = function(first, ...) -- 46
			return { -- 47
				first, -- 47
				select("#", ...) -- 47
			} -- 47
		end -- 46
		local result = fn("first", "second", "third") -- 48
		return assert.same(result, { -- 49
			"first", -- 49
			2 -- 49
		}) -- 49
	end) -- 45
	it("should handle nil in varargs", function() -- 51
		local fn -- 52
		fn = function(...) -- 52
			local count = select("#", ...) -- 53
			local has_nil = false -- 54
			for i = 1, count do -- 55
				if select(i, ...) == nil then -- 56
					has_nil = true -- 56
				end -- 56
			end -- 55
			return { -- 57
				count, -- 57
				has_nil -- 57
			} -- 57
		end -- 52
		local result = fn(1, nil, 3) -- 58
		return assert.same(result, { -- 59
			3, -- 59
			true -- 59
		}) -- 59
	end) -- 51
	it("should work with table unpack", function() -- 61
		local fn -- 62
		fn = function(...) -- 62
			return { -- 62
				... -- 62
			} -- 62
		end -- 62
		local result = fn(table.unpack({ -- 63
			1, -- 63
			2, -- 63
			3 -- 63
		})) -- 63
		return assert.same(result, { -- 64
			1, -- 64
			2, -- 64
			3 -- 64
		}) -- 64
	end) -- 61
	return it("should work with varargs in comprehension", function() -- 66
		local fn -- 67
		fn = function(...) -- 67
			local _accum_0 = { } -- 67
			local _len_0 = 1 -- 67
			local _list_0 = { -- 67
				... -- 67
			} -- 67
			for _index_0 = 1, #_list_0 do -- 67
				local x = _list_0[_index_0] -- 67
				_accum_0[_len_0] = x * 2 -- 67
				_len_0 = _len_0 + 1 -- 67
			end -- 67
			return _accum_0 -- 67
		end -- 67
		local result = fn(1, 2, 3, 4, 5) -- 68
		return assert.same(result, { -- 69
			2, -- 69
			4, -- 69
			6, -- 69
			8, -- 69
			10 -- 69
		}) -- 69
	end) -- 66
end) -- 1
