return describe("literals", function() -- 1
	it("should support integer literals", function() -- 2
		return assert.same(123, 123) -- 3
	end) -- 2
	it("should support float literals", function() -- 5
		return assert.same(1.5, 1.5) -- 6
	end) -- 5
	it("should support scientific notation", function() -- 8
		return assert.same(1.5e2, 150) -- 9
	end) -- 8
	it("should support negative numbers", function() -- 11
		return assert.same(-42, -42) -- 12
	end) -- 11
	it("should support hexadecimal literals", function() -- 14
		return assert.same(0xff, 255) -- 15
	end) -- 14
	it("should support hexadecimal with uppercase", function() -- 17
		return assert.same(0XFF, 255) -- 18
	end) -- 17
	it("should support binary literals", function() -- 20
		return assert.same(5, 5) -- 21
	end) -- 20
	it("should support binary with uppercase", function() -- 23
		return assert.same(5, 5) -- 24
	end) -- 23
	it("should support number with underscores", function() -- 26
		return assert.same(1000000, 1000000) -- 27
	end) -- 26
	it("should support hex with underscores", function() -- 29
		return assert.same(0xDEADBEEF, 0xDEADBEEF) -- 30
	end) -- 29
	it("should support double quote strings", function() -- 32
		return assert.same("hello", "hello") -- 33
	end) -- 32
	it("should support single quote strings", function() -- 35
		return assert.same('world', 'world') -- 36
	end) -- 35
	it("should support multi-line strings with [[", function() -- 38
		local s = [[			hello
			world
		]] -- 39
		return assert.is_true(s:match("hello")) -- 43
	end) -- 38
	it("should support multi-line strings with [=[", function() -- 45
		local s = [==[			test
		]==] -- 46
		return assert.is_true(s:match("test")) -- 49
	end) -- 45
	it("should support boolean true", function() -- 51
		return assert.same(true, true) -- 52
	end) -- 51
	it("should support boolean false", function() -- 54
		return assert.same(false, false) -- 55
	end) -- 54
	it("should support nil", function() -- 57
		return assert.same(nil, nil) -- 58
	end) -- 57
	it("should support empty table", function() -- 60
		local t = { } -- 61
		return assert.same(#t, 0) -- 62
	end) -- 60
	it("should support table with keys", function() -- 64
		local t = { -- 65
			a = 1, -- 65
			b = 2 -- 65
		} -- 65
		assert.same(t.a, 1) -- 66
		return assert.same(t.b, 2) -- 67
	end) -- 64
	it("should support array literal", function() -- 69
		local t = { -- 70
			1, -- 70
			2, -- 70
			3 -- 70
		} -- 70
		assert.same(t[1], 1) -- 71
		assert.same(t[2], 2) -- 72
		return assert.same(t[3], 3) -- 73
	end) -- 69
	return it("should support mixed table", function() -- 75
		local t = { -- 77
			1, -- 77
			2, -- 77
			3, -- 77
			key = "value" -- 78
		} -- 76
		assert.same(t[1], 1) -- 80
		return assert.same(t.key, "value") -- 81
	end) -- 75
end) -- 1
