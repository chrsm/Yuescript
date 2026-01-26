return describe("export", function() -- 1
	it("should export basic variables", function() -- 2
		local a = 1 -- 3
		local b = 2 -- 4
		local c = 3 -- 5
		assert.same(a, 1) -- 6
		assert.same(b, 2) -- 7
		return assert.same(c, 3) -- 8
	end) -- 2
	it("should export multiple variables at once", function() -- 10
		local x, y, z = 10, 20, 30 -- 11
		assert.same(x, 10) -- 12
		assert.same(y, 20) -- 13
		return assert.same(z, 30) -- 14
	end) -- 10
	it("should export class definitions", function() -- 16
		local MyClass -- 17
		do -- 17
			local _class_0 -- 17
			local _base_0 = { -- 17
				value = 100 -- 17
			} -- 17
			if _base_0.__index == nil then -- 17
				_base_0.__index = _base_0 -- 17
			end -- 17
			_class_0 = setmetatable({ -- 17
				__init = function() end, -- 17
				__base = _base_0, -- 17
				__name = "MyClass" -- 17
			}, { -- 17
				__index = _base_0, -- 17
				__call = function(cls, ...) -- 17
					local _self_0 = setmetatable({ }, _base_0) -- 17
					cls.__init(_self_0, ...) -- 17
					return _self_0 -- 17
				end -- 17
			}) -- 17
			_base_0.__class = _class_0 -- 17
			MyClass = _class_0 -- 17
		end -- 17
		return assert.same(MyClass.value, 100) -- 19
	end) -- 16
	it("should export function expressions", function() -- 21
		local my_func -- 22
		my_func = function() -- 22
			return 42 -- 22
		end -- 22
		return assert.same(my_func(), 42) -- 23
	end) -- 21
	it("should export conditional expressions", function() -- 25
		local result -- 26
		if true then -- 26
			result = "yes" -- 27
		else -- 29
			result = "no" -- 29
		end -- 26
		return assert.same(result, "yes") -- 30
	end) -- 25
	it("should export switch expressions", function() -- 32
		local value -- 33
		do -- 33
			local _exp_0 = 5 -- 33
			if 5 == _exp_0 then -- 34
				value = 100 -- 34
			else -- 35
				value = 0 -- 35
			end -- 33
		end -- 33
		return assert.same(value, 100) -- 36
	end) -- 32
	it("should export with do block", function() -- 38
		local result -- 39
		do -- 39
			local x = 5 -- 40
			result = x * 2 -- 41
		end -- 39
		return assert.same(result, 10) -- 42
	end) -- 38
	it("should export comprehension", function() -- 44
		local doubled -- 45
		do -- 45
			local _accum_0 = { } -- 45
			local _len_0 = 1 -- 45
			for i = 1, 5 do -- 45
				_accum_0[_len_0] = i * 2 -- 45
				_len_0 = _len_0 + 1 -- 45
			end -- 45
			doubled = _accum_0 -- 45
		end -- 45
		return assert.same(doubled, { -- 46
			2, -- 46
			4, -- 46
			6, -- 46
			8, -- 46
			10 -- 46
		}) -- 46
	end) -- 44
	it("should export with pipe operator", function() -- 48
		local result = table.concat({ -- 49
			1, -- 49
			2, -- 49
			3 -- 49
		}) -- 49
		return assert.same(result, "123") -- 50
	end) -- 48
	it("should export nil values", function() -- 52
		local empty = nil -- 53
		return assert.same(empty, nil) -- 54
	end) -- 52
	it("should export tables", function() -- 56
		local config = { -- 58
			key1 = "value1", -- 58
			key2 = "value2" -- 59
		} -- 57
		assert.same(config.key1, "value1") -- 61
		return assert.same(config.key2, "value2") -- 62
	end) -- 56
	it("should export string values", function() -- 64
		local message = "hello world" -- 65
		return assert.same(message, "hello world") -- 66
	end) -- 64
	it("should export boolean values", function() -- 68
		local flag_true = true -- 69
		local flag_false = false -- 70
		assert.is_true(flag_true) -- 71
		return assert.is_false(flag_false) -- 72
	end) -- 68
	it("should export number values", function() -- 74
		local count = 42 -- 75
		local price = 19.99 -- 76
		assert.same(count, 42) -- 77
		return assert.same(price, 19.99) -- 78
	end) -- 74
	it("should work in nested scope", function() -- 80
		do -- 81
			local nested = "value" -- 82
		end -- 81
		return assert.same(nested, "value") -- 83
	end) -- 80
	it("should export function with parameters", function() -- 85
		local add -- 86
		add = function(a, b) -- 86
			return a + b -- 86
		end -- 86
		return assert.same(add(5, 3), 8) -- 87
	end) -- 85
	it("should maintain export order", function() -- 89
		local first = 1 -- 90
		local second = 2 -- 91
		local third = 3 -- 92
		assert.same(first, 1) -- 93
		assert.same(second, 2) -- 94
		return assert.same(third, 3) -- 95
	end) -- 89
	return it("should work with complex expressions", function() -- 97
		local calc = (10 + 20) * 2 -- 98
		return assert.same(calc, 60) -- 99
	end) -- 97
end) -- 1
