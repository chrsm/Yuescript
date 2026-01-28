return describe("yaml string", function()
	it("should create basic yaml string", function()
		local s = "hello\nworld"
		assert.is_true((s:match("hello") ~= nil))
		return assert.is_true((s:match("world") ~= nil))
	end)
	it("should preserve indentation", function()
		local s = "key1: value1\nkey2: value2"
		assert.is_true((s:match("key1") ~= nil))
		return assert.is_true((s:match("key2") ~= nil))
	end)
	it("should support interpolation", function()
		local name = "test"
		local s = "hello " .. tostring(name)
		return assert.same(s, "hello test")
	end)
	it("should handle complex interpolation", function()
		local x, y = 10, 20
		local s = "point:\n\tx: " .. tostring(x) .. "\n\ty: " .. tostring(y)
		assert.is_true((s:match("x: 10") ~= nil))
		return assert.is_true((s:match("y: 20") ~= nil))
	end)
	it("should work with expressions", function()
		local s = "result: " .. tostring(1 + 2)
		return assert.is_true((s:match("result: 3") ~= nil))
	end)
	it("should support multiline with variables", function()
		local config = "database:\n\thost: localhost\n\tport: 5432\n\tname: mydb"
		assert.is_true((config:match("database:") ~= nil))
		return assert.is_true((config:match("host:") ~= nil))
	end)
	it("should escape special characters", function()
		local Hello = "Hello"
		local s = "path: \"C:\\Program Files\\App\"\nnote: 'He said: \"" .. tostring(Hello) .. "!\"'"
		return assert.same(s, [[path: "C:\Program Files\App"
note: 'He said: "Hello!"']])
	end)
	it("should work in function", function()
		local fn
		fn = function()
			local str = "foo:\n\tbar: baz"
			return str
		end
		local result = fn()
		return assert.same(result, "foo:\n\tbar: baz")
	end)
	it("should strip common leading whitespace", function()
		local fn
		fn = function()
			local s = "nested:\n\titem: value"
			return s
		end
		local result = fn()
		return assert.same(result, "nested:\n	item: value")
	end)
	it("should support empty lines", function()
		local s = "line1\nline3"
		return assert.same(s, "line1\nline3")
	end)
	it("should work with table access in interpolation", function()
		local t = {
			value = 100
		}
		local s = "value: " .. tostring(t.value)
		return assert.same(s, "value: 100")
	end)
	it("should support function calls in interpolation", function()
		local s = "result: " .. tostring((function()
			return 42
		end)())
		return assert.same(s, "result: 42")
	end)
	it("should handle quotes correctly", function()
		local s = "\"quoted\"\n'single quoted'"
		assert.is_true((s:match('"quoted"') ~= nil))
		return assert.is_true((s:match("'single quoted'") ~= nil))
	end)
	it("should work with multiple interpolations", function()
		local a, b, c = 1, 2, 3
		local s = "values: " .. tostring(a) .. ", " .. tostring(b) .. ", " .. tostring(c)
		return assert.same(s, "values: 1, 2, 3")
	end)
	return it("should preserve newlines", function()
		local s = "first line\nsecond line\nthird line"
		local lines
		do
			local _accum_0 = { }
			local _len_0 = 1
			for line in s:gmatch("[^\n]+") do
				_accum_0[_len_0] = line
				_len_0 = _len_0 + 1
			end
			lines = _accum_0
		end
		return assert.same(#lines, 3)
	end)
end)
