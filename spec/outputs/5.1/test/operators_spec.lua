return describe("operators", function() -- 1
	it("should support addition", function() -- 2
		return assert.same(1 + 2, 3) -- 3
	end) -- 2
	it("should support subtraction", function() -- 5
		return assert.same(5 - 3, 2) -- 6
	end) -- 5
	it("should support multiplication", function() -- 8
		return assert.same(4 * 3, 12) -- 9
	end) -- 8
	it("should support division", function() -- 11
		return assert.same(10 / 2, 5) -- 12
	end) -- 11
	it("should support modulo", function() -- 14
		return assert.same(10 % 3, 1) -- 15
	end) -- 14
	it("should support exponentiation", function() -- 17
		return assert.same(2 ^ 3, 8) -- 18
	end) -- 17
	it("should support unary minus", function() -- 20
		return assert.same(-5, -5) -- 21
	end) -- 20
	it("should support equality comparison", function() -- 23
		assert.is_true(1 == 1) -- 24
		return assert.is_false(1 == 2) -- 25
	end) -- 23
	it("should support inequality comparison", function() -- 27
		assert.is_true(1 ~= 2) -- 28
		return assert.is_false(1 ~= 1) -- 29
	end) -- 27
	it("should support less than", function() -- 31
		assert.is_true(1 < 2) -- 32
		return assert.is_false(2 < 1) -- 33
	end) -- 31
	it("should support greater than", function() -- 35
		assert.is_true(2 > 1) -- 36
		return assert.is_false(1 > 2) -- 37
	end) -- 35
	it("should support less than or equal", function() -- 39
		assert.is_true(1 <= 2) -- 40
		assert.is_true(2 <= 2) -- 41
		return assert.is_false(3 <= 2) -- 42
	end) -- 39
	it("should support greater than or equal", function() -- 44
		assert.is_true(2 >= 1) -- 45
		assert.is_true(2 >= 2) -- 46
		return assert.is_false(1 >= 2) -- 47
	end) -- 44
	it("should support logical and", function() -- 49
		assert.same(true and false, false) -- 50
		assert.same(true and true, true) -- 51
		return assert.same(false and true, false) -- 52
	end) -- 49
	it("should support logical or", function() -- 54
		assert.same(true or false, true) -- 55
		assert.same(false or true, true) -- 56
		return assert.same(false or false, false) -- 57
	end) -- 54
	it("should support logical not", function() -- 59
		assert.same(not true, false) -- 60
		assert.same(not false, true) -- 61
		return assert.same(not nil, true) -- 62
	end) -- 59
	it("should support bitwise and", function() -- 64
		return assert.same(5 & 3, 1) -- 65
	end) -- 64
	it("should support bitwise or", function() -- 67
		return assert.same(5 | 3, 7) -- 68
	end) -- 67
	it("should support bitwise xor", function() -- 70
		return assert.same(5 ~ 3, 6) -- 71
	end) -- 70
	it("should support left shift", function() -- 73
		return assert.same(2 << 3, 16) -- 74
	end) -- 73
	it("should support right shift", function() -- 76
		return assert.same(16 >> 2, 4) -- 77
	end) -- 76
	it("should support string concatenation", function() -- 79
		return assert.same("hello" .. " world", "hello world") -- 80
	end) -- 79
	it("should support length operator", function() -- 82
		assert.same(#"hello", 5) -- 83
		return assert.same(#{ -- 84
			1, -- 84
			2, -- 84
			3 -- 84
		}, 3) -- 84
	end) -- 82
	it("should respect operator precedence", function() -- 86
		assert.same(1 + 2 * 3, 7) -- 87
		return assert.same((1 + 2) * 3, 9) -- 88
	end) -- 86
	it("should support compound assignment", function() -- 90
		local x = 10 -- 91
		x = x + 5 -- 92
		return assert.same(x, 15) -- 93
	end) -- 90
	it("should support compound subtraction", function() -- 95
		local x = 10 -- 96
		x = x - 3 -- 97
		return assert.same(x, 7) -- 98
	end) -- 95
	it("should support compound multiplication", function() -- 100
		local x = 5 -- 101
		x = x * 2 -- 102
		return assert.same(x, 10) -- 103
	end) -- 100
	it("should support compound division", function() -- 105
		local x = 20 -- 106
		x = x / 4 -- 107
		return assert.same(x, 5) -- 108
	end) -- 105
	it("should handle division by zero", function() -- 110
		local result = pcall(function() -- 112
			local x = 10 / 0 -- 113
		end) -- 112
		return assert.is_true(result) -- 115
	end) -- 110
	it("should handle very large numbers", function() -- 117
		local big = 1e100 -- 118
		return assert.is_true(big > 0) -- 119
	end) -- 117
	it("should handle very small numbers", function() -- 121
		local small = 1e-100 -- 122
		return assert.is_true(small > 0) -- 123
	end) -- 121
	it("should support negation", function() -- 125
		assert.same(-10, -10) -- 126
		return assert.same -- 127
	end) -- 125
	it("should work with complex expressions", function() -- 129
		local result = (1 + 2) * (3 + 4) / 2 -- 130
		return assert.same(result, 10.5) -- 131
	end) -- 129
	it("should support power with decimal", function() -- 133
		return assert.same(4 ^ 0.5, 2) -- 134
	end) -- 133
	return it("should handle modulo with negative numbers", function() -- 136
		return assert.same(-10 % 3, 2) -- 137
	end) -- 136
end) -- 1
