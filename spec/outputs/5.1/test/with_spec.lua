return describe("with", function() -- 1
	it("should access property with . syntax", function() -- 2
		local obj = { -- 3
			value = 42 -- 3
		} -- 3
		do -- 4
			local result = obj.value -- 5
		end -- 4
		return assert.same(result, 42) -- 6
	end) -- 2
	it("should call method with : syntax", function() -- 8
		local obj = { -- 9
			func = function() -- 9
				return "result" -- 9
			end -- 9
		} -- 9
		do -- 10
			local result = obj:func() -- 11
		end -- 10
		return assert.same(result, "result") -- 12
	end) -- 8
	it("should work as statement", function() -- 14
		local obj = { -- 15
			x = 10, -- 15
			y = 20 -- 15
		} -- 15
		obj.sum = obj.x + obj.y -- 17
		return assert.same(obj.sum, 30) -- 18
	end) -- 14
	it("should support nested with", function() -- 20
		local outer = { -- 21
			inner = { -- 21
				value = 100 -- 21
			} -- 21
		} -- 21
		do -- 22
			local _with_0 = outer.inner -- 22
			local result = _with_0.value -- 23
		end -- 22
		return assert.same(result, 100) -- 24
	end) -- 20
	it("should work with? safely", function() -- 26
		local obj = { -- 27
			x = 5 -- 27
		} -- 27
		do -- 28
			local result = obj.x -- 29
		end -- 28
		return assert.same(result, 5) -- 30
	end) -- 26
	it("should work with if inside with", function() -- 32
		local obj = { -- 33
			x = 10, -- 33
			y = 20 -- 33
		} -- 33
		if obj.x > 5 then -- 35
			local result = obj.x + obj.y -- 36
		end -- 35
		return assert.same(result, 30) -- 37
	end) -- 32
	it("should work with switch inside with", function() -- 39
		local obj = { -- 40
			type = "add", -- 40
			a = 5, -- 40
			b = 3 -- 40
		} -- 40
		do -- 41
			local result -- 42
			local _exp_0 = obj.type -- 42
			if "add" == _exp_0 then -- 43
				result = obj.a + obj.b -- 43
			else -- 44
				result = 0 -- 44
			end -- 42
		end -- 41
		return assert.same(result, 8) -- 45
	end) -- 39
	it("should work with loop inside with", function() -- 47
		local obj = { -- 48
			items = { -- 48
				1, -- 48
				2, -- 48
				3 -- 48
			} -- 48
		} -- 48
		local sum = 0 -- 49
		local _list_0 = obj.items -- 51
		for _index_0 = 1, #_list_0 do -- 51
			local item = _list_0[_index_0] -- 51
			sum = sum + item -- 52
		end -- 51
		return assert.same(sum, 6) -- 53
	end) -- 47
	it("should work with destructure", function() -- 55
		local obj = { -- 56
			x = 1, -- 56
			y = 2, -- 56
			z = 3 -- 56
		} -- 56
		do -- 57
			local x, y, z = obj[1], obj[2], obj[3] -- 58
		end -- 57
		assert.same(x, 1) -- 59
		assert.same(y, 2) -- 60
		return assert.same(z, 3) -- 61
	end) -- 55
	it("should handle simple with body", function() -- 63
		local obj = { -- 64
			value = 42 -- 64
		} -- 64
		obj.value2 = 100 -- 66
		return assert.same(obj.value2, 100) -- 67
	end) -- 63
	it("should work with return inside", function() -- 69
		local obj = { -- 70
			value = 100 -- 70
		} -- 70
		local fn -- 71
		fn = function() -- 71
			return obj.value -- 73
		end -- 71
		return assert.same(fn(), 100) -- 74
	end) -- 69
	it("should work with break inside", function() -- 76
		local sum = 0 -- 77
		for i = 1, 5 do -- 78
			local obj = { -- 79
				value = i -- 79
			} -- 79
			if obj.value == 3 then -- 81
				break -- 82
			end -- 81
			sum = sum + obj.value -- 83
		end -- 78
		return assert.same(sum, 3) -- 84
	end) -- 76
	it("should chain property access", function() -- 86
		local obj = { -- 87
			a = { -- 87
				b = { -- 87
					c = 42 -- 87
				} -- 87
			} -- 87
		} -- 87
		do -- 88
			local _with_0 = obj.a.b -- 88
			local result = _with_0.c -- 89
		end -- 88
		return assert.same(result, 42) -- 90
	end) -- 86
	it("should work with multiple statements", function() -- 92
		local obj = { -- 93
			x = 1, -- 93
			y = 2 -- 93
		} -- 93
		local sum = 0 -- 94
		do -- 95
			sum = sum + obj.x -- 96
			sum = sum + obj.y -- 97
		end -- 95
		return assert.same(sum, 3) -- 98
	end) -- 92
	return it("should preserve object reference", function() -- 100
		local obj = { -- 101
			value = 42 -- 101
		} -- 101
		obj.value = 100 -- 103
		return assert.same(obj.value, 100) -- 104
	end) -- 100
end) -- 1
