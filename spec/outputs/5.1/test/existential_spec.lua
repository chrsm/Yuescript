local _anon_func_0 = function(obj) -- 39
	if obj ~= nil then -- 39
		return obj.value -- 39
	end -- 39
	return nil -- 39
end -- 39
local _anon_func_1 = function(obj) -- 45
	if obj ~= nil then -- 45
		return obj.value -- 45
	end -- 45
	return nil -- 45
end -- 45
local _anon_func_2 = function(obj) -- 50
	if obj ~= nil then -- 50
		return obj.x -- 50
	end -- 50
	return nil -- 50
end -- 50
local _anon_func_3 = function(obj) -- 50
	if obj ~= nil then -- 50
		return obj.y -- 50
	end -- 50
	return nil -- 50
end -- 50
return describe("existential", function() -- 1
	it("should handle ?. with existing object", function() -- 2
		local obj = { -- 3
			value = 42 -- 3
		} -- 3
		local result -- 4
		if obj ~= nil then -- 4
			result = obj.value -- 4
		end -- 4
		return assert.same(result, 42) -- 5
	end) -- 2
	it("should handle ?. with nil object", function() -- 7
		local obj = nil -- 8
		local result -- 9
		if obj ~= nil then -- 9
			result = obj.value -- 9
		end -- 9
		return assert.same(result, nil) -- 10
	end) -- 7
	it("should chain ?. calls", function() -- 12
		local obj = { -- 13
			nested = { -- 13
				value = 100 -- 13
			} -- 13
		} -- 13
		local result -- 14
		if obj ~= nil then -- 14
			do -- 14
				local _obj_0 = obj.nested -- 14
				if _obj_0 ~= nil then -- 14
					result = _obj_0.value -- 14
				end -- 14
			end -- 14
		end -- 14
		return assert.same(result, 100) -- 15
	end) -- 12
	it("should return nil in chain with nil", function() -- 17
		local obj = nil -- 18
		local result -- 19
		if obj ~= nil then -- 19
			do -- 19
				local _obj_0 = obj.nested -- 19
				if _obj_0 ~= nil then -- 19
					result = _obj_0.value -- 19
				end -- 19
			end -- 19
		end -- 19
		return assert.same(result, nil) -- 20
	end) -- 17
	it("should handle ?. with method call", function() -- 22
		local obj = { -- 23
			func = function() -- 23
				return "result" -- 23
			end -- 23
		} -- 23
		local result -- 24
		if obj ~= nil then -- 24
			result = obj.func() -- 24
		end -- 24
		return assert.same(result, "result") -- 25
	end) -- 22
	it("should handle ? on table index", function() -- 27
		local tb = { -- 28
			[1] = "first" -- 28
		} -- 28
		local result -- 29
		if tb ~= nil then -- 29
			result = tb[1] -- 29
		end -- 29
		return assert.same(result, "first") -- 30
	end) -- 27
	it("should return nil for missing index", function() -- 32
		local tb = { } -- 33
		local result -- 34
		if tb ~= nil then -- 34
			result = tb[99] -- 34
		end -- 34
		return assert.same(result, nil) -- 35
	end) -- 32
	it("should work with ? in if condition", function() -- 37
		local obj = { -- 38
			value = 5 -- 38
		} -- 38
		if _anon_func_0(obj) then -- 39
			local result = "exists" -- 40
		end -- 39
		return assert.same(result, "exists") -- 41
	end) -- 37
	it("should combine ?. with and/or", function() -- 43
		local obj = { -- 44
			value = 10 -- 44
		} -- 44
		local result = _anon_func_1(obj) and 20 or 30 -- 45
		return assert.same(result, 20) -- 46
	end) -- 43
	it("should handle with? safely", function() -- 48
		local obj = { -- 49
			x = 1, -- 49
			y = 2 -- 49
		} -- 49
		local sum = _anon_func_2(obj) + _anon_func_3(obj) -- 50
		return assert.same(sum, 3) -- 51
	end) -- 48
	it("should return nil with with? on nil", function() -- 53
		local obj = nil -- 54
		local result -- 55
		if obj ~= nil then -- 55
			result = obj.x -- 55
		end -- 55
		return assert.same(result, nil) -- 56
	end) -- 53
	it("should handle false value correctly", function() -- 58
		local obj = { -- 60
			value = false -- 60
		} -- 60
		local result -- 61
		if obj ~= nil then -- 61
			result = obj.value -- 61
		end -- 61
		return assert.same(result, false) -- 62
	end) -- 58
	it("should handle 0 value correctly", function() -- 64
		local obj = { -- 66
			value = 0 -- 66
		} -- 66
		local result -- 67
		if obj ~= nil then -- 67
			result = obj.value -- 67
		end -- 67
		return assert.same(result, 0) -- 68
	end) -- 64
	it("should handle empty string correctly", function() -- 70
		local obj = { -- 72
			value = "" -- 72
		} -- 72
		local result -- 73
		if obj ~= nil then -- 73
			result = obj.value -- 73
		end -- 73
		return assert.same(result, "") -- 74
	end) -- 70
	it("should handle empty table correctly", function() -- 76
		local obj = { -- 78
			value = { } -- 78
		} -- 78
		local result -- 79
		if obj ~= nil then -- 79
			result = obj.value -- 79
		end -- 79
		return assert.same(type(result), "table") -- 80
	end) -- 76
	it("should work with deep chains", function() -- 82
		local obj = { -- 83
			a = { -- 83
				b = { -- 83
					c = { -- 83
						d = "deep" -- 83
					} -- 83
				} -- 83
			} -- 83
		} -- 83
		local result -- 84
		if obj ~= nil then -- 84
			do -- 84
				local _obj_0 = obj.a -- 84
				if _obj_0 ~= nil then -- 84
					do -- 84
						local _obj_1 = _obj_0.b -- 84
						if _obj_1 ~= nil then -- 84
							do -- 84
								local _obj_2 = _obj_1.c -- 84
								if _obj_2 ~= nil then -- 84
									result = _obj_2.d -- 84
								end -- 84
							end -- 84
						end -- 84
					end -- 84
				end -- 84
			end -- 84
		end -- 84
		return assert.same(result, "deep") -- 85
	end) -- 82
	it("should break chain on first nil", function() -- 87
		local obj = { -- 88
			a = nil -- 88
		} -- 88
		local result -- 89
		if obj ~= nil then -- 89
			do -- 89
				local _obj_0 = obj.a -- 89
				if _obj_0 ~= nil then -- 89
					do -- 89
						local _obj_1 = _obj_0.b -- 89
						if _obj_1 ~= nil then -- 89
							result = _obj_1.c -- 89
						end -- 89
					end -- 89
				end -- 89
			end -- 89
		end -- 89
		return assert.same(result, nil) -- 90
	end) -- 87
	it("should handle ?. with string methods", function() -- 92
		local s = "hello" -- 93
		local result -- 94
		if s ~= nil then -- 94
			result = s:upper() -- 94
		end -- 94
		return assert.same(result, "HELLO") -- 95
	end) -- 92
	return it("should handle ?. with nil string", function() -- 97
		local s = nil -- 98
		local result -- 99
		if s ~= nil then -- 99
			result = s:upper() -- 99
		end -- 99
		return assert.same(result, nil) -- 100
	end) -- 97
end) -- 1
