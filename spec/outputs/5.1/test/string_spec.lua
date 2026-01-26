return describe("string", function() -- 1
	it("should support single quote strings", function() -- 2
		local s = 'hello' -- 3
		return assert.same(s, "hello") -- 4
	end) -- 2
	it("should support double quote strings", function() -- 6
		local s = "world" -- 7
		return assert.same(s, "world") -- 8
	end) -- 6
	it("should support escape sequences", function() -- 10
		local s = "hello\nworld" -- 11
		return assert.is_true(s:match("\n") ~= nil) -- 12
	end) -- 10
	it("should support escaped quotes", function() -- 14
		local s = "he said \"hello\"" -- 15
		return assert.same(s, 'he said "hello"') -- 16
	end) -- 14
	it("should support backslash escape", function() -- 18
		local s = "\\" -- 19
		return assert.same(s, "\\") -- 20
	end) -- 18
	it("should support multi-line strings with [[ ]]", function() -- 22
		local s = [[			hello
			world
		]] -- 23
		assert.is_true(s:match("hello") ~= nil) -- 27
		return assert.is_true(s:match("world") ~= nil) -- 28
	end) -- 22
	it("should support multi-line strings with [=[ ]=]", function() -- 30
		local s = [==[			hello
			world
		]==] -- 31
		assert.is_true(s:match("hello") ~= nil) -- 35
		return assert.is_true(s:match("world") ~= nil) -- 36
	end) -- 30
	it("should support string interpolation with double quotes", function() -- 38
		local name = "world" -- 39
		local s = "hello " .. tostring(name) -- 40
		return assert.same(s, "hello world") -- 41
	end) -- 38
	it("should support expression interpolation", function() -- 43
		local a, b = 1, 2 -- 44
		local s = tostring(a) .. " + " .. tostring(b) .. " = " .. tostring(a + b) -- 45
		return assert.same(s, "1 + 2 = 3") -- 46
	end) -- 43
	it("should not interpolate in single quotes", function() -- 48
		local name = "world" -- 49
		local s = 'hello #{name}' -- 50
		return assert.same(s, "hello " .. tostring(name)) -- 51
	end) -- 48
	it("should escape interpolation with \#", function() -- 53
		local name = "world" -- 54
		local s = "hello \\" .. tostring(name) -- 55
		return assert.same(s, "hello " .. tostring(name)) -- 56
	end) -- 53
	it("should support method calls on string literals", function() -- 58
		local result = ("hello"):upper() -- 59
		return assert.same(result, "HELLO") -- 60
	end) -- 58
	it("should support chained method calls", function() -- 62
		local result = ("hello world"):upper():match("HELLO") -- 63
		return assert.same(result, "HELLO") -- 64
	end) -- 62
	it("should support YAML style strings", function() -- 66
		local s = "hello\nworld" -- 67
		assert.is_true(s:match("hello") ~= nil) -- 70
		return assert.is_true(s:match("world") ~= nil) -- 71
	end) -- 66
	it("should support YAML style with interpolation", function() -- 73
		local name = "test" -- 74
		local s = "hello " .. tostring(name) -- 75
		return assert.same(s, "hello test\n") -- 77
	end) -- 73
	it("should support string concatenation", function() -- 79
		local s = "hello" .. " " .. "world" -- 80
		return assert.same(s, "hello world") -- 81
	end) -- 79
	it("should handle empty strings", function() -- 83
		local s = "" -- 84
		return assert.same(s, "") -- 85
	end) -- 83
	it("should support Unicode characters", function() -- 87
		local s = "hello 世界" -- 88
		return assert.is_true(s:match("世界") ~= nil) -- 89
	end) -- 87
	it("should support string length", function() -- 91
		local s = "hello" -- 92
		return assert.same(#s, 5) -- 93
	end) -- 91
	it("should support multi-line YAML with complex content", function() -- 95
		local config = "key1: value1\nkey2: value2\nkey3: value3" -- 96
		return assert.is_true(config:match("key1") ~= nil) -- 100
	end) -- 95
	it("should support interpolation in YAML strings", function() -- 102
		local x, y = 10, 20 -- 103
		local s = "point:\n\tx: " .. tostring(x) .. "\n\ty: " .. tostring(y) -- 104
		assert.is_true(s:match("x: 10") ~= nil) -- 108
		return assert.is_true(s:match("y: 20") ~= nil) -- 109
	end) -- 102
	it("should support function call in interpolation", function() -- 111
		local s = "result: " .. tostring(function() -- 112
			return 42 -- 112
		end) -- 112
		return assert.same(s, "result: 42") -- 113
	end) -- 111
	it("should support table indexing in interpolation", function() -- 115
		local t = { -- 116
			value = 100 -- 116
		} -- 116
		local s = "value: " .. tostring(t.value) -- 117
		return assert.same(s, "value: 100") -- 118
	end) -- 115
	it("should handle escaped characters correctly", function() -- 120
		local s = "tab:\t, newline:\n, return:\r" -- 121
		assert.is_true(s:match("\t") ~= nil) -- 122
		return assert.is_true(s:match("\n") ~= nil) -- 123
	end) -- 120
	it("should support string methods with colon syntax", function() -- 125
		local s = "hello" -- 126
		return assert.same(s:sub(1, 2), "he") -- 127
	end) -- 125
	it("should work in expressions", function() -- 129
		local result = "hello" .. " world" -- 130
		return assert.same(result, "hello world") -- 131
	end) -- 129
	it("should support octal escape", function() -- 133
		local s = "\65" -- 134
		return assert.same(s, "A") -- 135
	end) -- 133
	it("should support hex escape", function() -- 137
		local s = "\x41" -- 138
		return assert.same(s, "A") -- 139
	end) -- 137
	return it("should support unicode escape", function() -- 141
		local s = "\u{4e16}" -- 142
		return assert.same(s, "世") -- 143
	end) -- 141
end) -- 1
