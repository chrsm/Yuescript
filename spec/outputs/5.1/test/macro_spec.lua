return describe("macro", function() -- 1
	it("should define and call basic macro", function() -- 2
		local result = (5 * 2) -- 4
		return assert.same(result, 10) -- 5
	end) -- 2
	it("should maintain hygiene in macros", function() -- 7
		local a = 8 -- 12
		local result = 2 -- 13
		return assert.same(result, 2) -- 14
	end) -- 7
	it("should validate AST types", function() -- 16
		local result = { -- 18
			123, -- 18
			'xyz' -- 18
		} -- 18
		return assert.same(result, "[123, xyz]") -- 19
	end) -- 16
	it("should support simple code generation", function() -- 21
		local result = (10 + 1) -- 23
		return assert.same(result, 11) -- 24
	end) -- 21
	it("should support nested macro calls", function() -- 26
		local result = 7 -- 29
		return assert.same(result, 7) -- 30
	end) -- 26
	it("should respect macro scope in do blocks", function() -- 32
		do -- 34
			local result = inner -- 36
			assert.same(result, "inner") -- 37
		end -- 34
		local result = outer -- 38
		return assert.same(result, "outer") -- 39
	end) -- 32
	it("should provide $LINE macro", function() -- 41
		local line_num = 42 -- 42
		return assert.is_true(line_num > 0) -- 43
	end) -- 41
	it("should inject Lua code", function() -- 45
		local x = 0 -- 47
		do -- 48
local function f(a)
				return a + 1
			end
			x = x + f(3)
		end -- 48
		return assert.same(x, 4) -- 54
	end) -- 45
	it("should work in conditional compilation", function() -- 56
		local result = "debug mode" -- 62
		return assert.same(result, "debug mode") -- 63
	end) -- 56
	it("should work with class system", function() -- 65
		local Thing -- 66
		do -- 66
			local _class_0 -- 66
			local _base_0 = { -- 66
				value = 100, -- 68
				get_value = function(self) -- 68
					return self.value -- 68
				end -- 66
			} -- 66
			if _base_0.__index == nil then -- 66
				_base_0.__index = _base_0 -- 66
			end -- 66
			_class_0 = setmetatable({ -- 66
				__init = function() end, -- 66
				__base = _base_0, -- 66
				__name = "Thing" -- 66
			}, { -- 66
				__index = _base_0, -- 66
				__call = function(cls, ...) -- 66
					local _self_0 = setmetatable({ }, _base_0) -- 66
					cls.__init(_self_0, ...) -- 66
					return _self_0 -- 66
				end -- 66
			}) -- 66
			_base_0.__class = _class_0 -- 66
			Thing = _class_0 -- 66
		end -- 66
		local instance = Thing() -- 69
		return assert.same(instance:get_value(), 100) -- 70
	end) -- 65
	it("should handle macro in switch expressions", function() -- 72
		local result -- 74
		do -- 74
			local _exp_0 = "test" -- 74
			if "test" == _exp_0 then -- 75
				result = "matched" -- 76
			else -- 78
				result = "no match" -- 78
			end -- 74
		end -- 74
		return assert.same(result, "matched") -- 79
	end) -- 72
	it("should support macro in expression context", function() -- 81
		local result = 5 + (2 * 3) -- 83
		return assert.same(result, 11) -- 84
	end) -- 81
	it("should handle $is_ast for type checking", function() -- 86
		local result = 42 -- 91
		return assert.same(result, 42) -- 92
	end) -- 86
	it("should work with string interpolation", function() -- 94
		local result = { -- 96
			["test"] = 123 -- 96
		} -- 96
		return assert.same(result, "test: 123") -- 97
	end) -- 94
	it("should support function call syntax", function() -- 99
		local result = (5 + 10) -- 101
		return assert.same(result, 15) -- 102
	end) -- 99
	it("should handle empty macro return", function() -- 104
		local a = 1 -- 106
		a = 2 -- 108
		return assert.same(a, 2) -- 109
	end) -- 104
	it("should work with table literals", function() -- 111
		local point = { -- 113
			x = 10, -- 113
			y = 20 -- 113
		} -- 113
		assert.same(point.x, 10) -- 114
		return assert.same(point.y, 20) -- 115
	end) -- 111
	it("should support conditional expressions in macro", function() -- 117
		local result = (5 + 1) -- 119
		return assert.same(result, 6) -- 120
	end) -- 117
	it("should work with comprehension", function() -- 122
		local result -- 124
		do -- 124
			local _accum_0 = { } -- 124
			local _len_0 = 1 -- 124
			local _list_0 = { -- 124
				1, -- 124
				2, -- 124
				3 -- 124
			} -- 124
			for _index_0 = 1, #_list_0 do -- 124
				local _ = _list_0[_index_0] -- 124
				_accum_0[_len_0] = _ * 2 -- 124
				_len_0 = _len_0 + 1 -- 124
			end -- 124
			result = _accum_0 -- 124
		end -- 124
		return assert.same(result, { -- 125
			2, -- 125
			4, -- 125
			6 -- 125
		}) -- 125
	end) -- 122
	it("should support complex expression macros", function() -- 127
		local result = (1 + 2 * 3) -- 129
		return assert.same(result, 7) -- 130
	end) -- 127
	return it("should work with string literals", function() -- 132
		local result = "Hello, " .. tostring(name) -- 134
		return assert.same(result, "Hello, World") -- 135
	end) -- 132
end) -- 1
