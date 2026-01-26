local _anon_func_0 = function(flag) -- 37
	if flag then -- 37
		return 1 -- 37
	else -- 37
		return 0 -- 37
	end -- 37
end -- 37
local _anon_func_1 = function() -- 85
	if nil then -- 85
		return true -- 85
	else -- 85
		return false -- 85
	end -- 85
end -- 85
local _anon_func_2 = function() -- 86
	if false then -- 86
		return true -- 86
	else -- 86
		return false -- 86
	end -- 86
end -- 86
local _anon_func_3 = function() -- 89
	if 0 then -- 89
		return true -- 89
	else -- 89
		return false -- 89
	end -- 89
end -- 89
local _anon_func_4 = function() -- 90
	if "" then -- 90
		return true -- 90
	else -- 90
		return false -- 90
	end -- 90
end -- 90
local _anon_func_5 = function() -- 91
	if { } then -- 91
		return true -- 91
	else -- 91
		return false -- 91
	end -- 91
end -- 91
local _anon_func_6 = function() -- 92
	if 1 then -- 92
		return true -- 92
	else -- 92
		return false -- 92
	end -- 92
end -- 92
return describe("cond", function() -- 1
	it("should execute if branch when condition is true", function() -- 2
		local result = nil -- 3
		if true then -- 4
			result = "yes" -- 5
		end -- 4
		return assert.same(result, "yes") -- 6
	end) -- 2
	it("should execute else branch when condition is false", function() -- 8
		local result = nil -- 9
		if false then -- 10
			result = "yes" -- 11
		else -- 13
			result = "no" -- 13
		end -- 10
		return assert.same(result, "no") -- 14
	end) -- 8
	it("should support elseif chain", function() -- 16
		local value = 2 -- 17
		local result -- 18
		if 1 == value then -- 19
			result = "one" -- 19
		elseif 2 == value then -- 20
			result = "two" -- 20
		else -- 21
			result = "other" -- 21
		end -- 18
		return assert.same(result, "two") -- 22
	end) -- 16
	it("should handle nested conditions", function() -- 24
		local result = nil -- 25
		if true then -- 26
			if true then -- 27
				result = "nested" -- 28
			end -- 27
		end -- 26
		return assert.same(result, "nested") -- 29
	end) -- 24
	it("should work as expression", function() -- 31
		local value -- 32
		if true then -- 32
			value = "yes" -- 32
		else -- 32
			value = "no" -- 32
		end -- 32
		return assert.same(value, "yes") -- 33
	end) -- 31
	it("should work in string interpolation", function() -- 35
		local flag = true -- 36
		local result = "value is " .. tostring(_anon_func_0(flag)) -- 37
		return assert.same(result, "value is 1") -- 38
	end) -- 35
	it("should support chained comparisons", function() -- 40
		return assert.is_true(1 < 2 and 2 <= 2 and 2 < 3) -- 41
	end) -- 40
	it("should short-circuit and expression", function() -- 43
		local count = 0 -- 44
		local inc -- 45
		inc = function() -- 45
			count = count + 1 -- 46
			return false -- 47
		end -- 45
		local result = inc() and inc() -- 48
		return assert.same(count, 1) -- 49
	end) -- 43
	it("should short-circuit or expression", function() -- 51
		local count = 0 -- 52
		local inc -- 53
		inc = function() -- 53
			count = count + 1 -- 54
			return true -- 55
		end -- 53
		local result = inc() or inc() -- 56
		return assert.same(count, 1) -- 57
	end) -- 51
	it("should support unless keyword", function() -- 59
		local result = nil -- 60
		if not false then -- 61
			result = "executed" -- 62
		end -- 61
		return assert.same(result, "executed") -- 63
	end) -- 59
	it("should support unless with else", function() -- 65
		local result = nil -- 66
		if not true then -- 67
			result = "no" -- 68
		else -- 70
			result = "yes" -- 70
		end -- 67
		return assert.same(result, "yes") -- 71
	end) -- 65
	it("should handle postfix if", function() -- 73
		local result = nil -- 74
		if true then -- 75
			result = "yes" -- 75
		end -- 75
		return assert.same(result, "yes") -- 76
	end) -- 73
	it("should handle postfix unless", function() -- 78
		local result = nil -- 79
		if not false then -- 80
			result = "yes" -- 80
		end -- 80
		return assert.same(result, "yes") -- 81
	end) -- 78
	it("should evaluate truthiness correctly", function() -- 83
		assert.is_false(_anon_func_1()) -- 85
		assert.is_false(_anon_func_2()) -- 86
		assert.is_true(_anon_func_3()) -- 89
		assert.is_true(_anon_func_4()) -- 90
		assert.is_true(_anon_func_5()) -- 91
		return assert.is_true(_anon_func_6()) -- 92
	end) -- 83
	it("should support and/or operators", function() -- 94
		assert.same(true and false, false) -- 95
		assert.same(false or true, true) -- 96
		assert.same(nil or "default", "default") -- 97
		return assert.same("value" or "default", "value") -- 98
	end) -- 94
	it("should handle complex boolean expressions", function() -- 100
		local a, b, c = true, false, true -- 101
		local result = a and b or c -- 102
		return assert.same(result, c) -- 103
	end) -- 100
	it("should support not operator", function() -- 105
		assert.is_true(not false) -- 106
		assert.is_true(not nil) -- 107
		assert.is_false(not true) -- 108
		return assert.is_false(not 1) -- 109
	end) -- 105
	it("should work with table as condition", function() -- 111
		local result = nil -- 112
		if { } then -- 113
			result = "truthy" -- 114
		end -- 113
		return assert.same(result, "truthy") -- 115
	end) -- 111
	it("should work with string as condition", function() -- 117
		local result = nil -- 118
		if "" then -- 119
			result = "truthy" -- 120
		end -- 119
		return assert.same(result, "truthy") -- 121
	end) -- 117
	it("should work with zero as condition", function() -- 123
		local result = nil -- 124
		if 0 then -- 125
			result = "truthy" -- 126
		end -- 125
		return assert.same(result, "truthy") -- 127
	end) -- 123
	it("should support multiple elseif branches", function() -- 129
		local value = 3 -- 130
		local result -- 131
		if value == 1 then -- 131
			result = "one" -- 132
		elseif value == 2 then -- 133
			result = "two" -- 134
		elseif value == 3 then -- 135
			result = "three" -- 136
		else -- 138
			result = "other" -- 138
		end -- 131
		return assert.same(result, "three") -- 139
	end) -- 129
	it("should handle then keyword syntax", function() -- 141
		local result -- 142
		if true then -- 142
			result = "yes" -- 142
		else -- 142
			result = "no" -- 142
		end -- 142
		return assert.same(result, "yes") -- 143
	end) -- 141
	return it("should work with function call in condition", function() -- 145
		local return_true -- 146
		return_true = function() -- 146
			return true -- 146
		end -- 146
		local result -- 147
		if return_true() then -- 147
			result = "yes" -- 147
		else -- 147
			result = "no" -- 147
		end -- 147
		return assert.same(result, "yes") -- 148
	end) -- 145
end) -- 1
