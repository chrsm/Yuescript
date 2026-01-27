return describe("yaml string", function()
	it("should create basic yaml string", function()
		local s = "hello\nworld"
		assert.is_true(s:match("hello"))
		return assert.is_true(s:match("world"))
	end)
	it("should preserve indentation", function()
		local s = "key1: value1\nkey2: value2"
		assert.is_true(s:match("key1"))
		return assert.is_true(s:match("key2"))
	end)
	it("should support interpolation", function()
		local name = "test"
		local s = "hello " .. tostring(name)
		return assert.same(s, "hello test")
	end)
	it("should handle complex interpolation", function()
		local x, y = 10, 20
		local s = "point:\n\tx: " .. tostring(x) .. "\n\ty: " .. tostring(y)
		assert.is_true(s:match("x: 10"))
		return assert.is_true(s:match("y: 20"))
	end)
	it("should work with expressions", function()
		local s = "result: " .. tostring(1 + 2)
		return assert.is_true(s:match("result: 3"))
	end)
	it("should support multiline with variables", function()
		local config = "database:\n\thost: localhost\n\tport: 5432\n\tname: mydb"
		assert.is_true(config:match("database:"))
		return assert.is_true(config:match("host:"))
	end)
	it("should escape special characters", function()
		local s = "path: \"C:\\Program Files\\App\"\nnote: 'He said: \"" .. tostring(Hello) .. "!\"'"
		assert.is_true(s:match("path:"))
		return assert.is_true(s:match("note:"))
	end)
	it("should work in function", function()
		local fn
		fn = function()
			local str = "foo:\n\tbar: baz"
			return str
		end
		local result = fn()
		assert.is_true(result:match("foo:"))
		return assert.is_true(result:match("bar:"))
	end)
	it("should strip common leading whitespace", function()
		local fn
		fn = function()
			local s = "nested:\n\titem: value"
			return s
		end
		local result = fn()
		assert.is_true(result:match("nested:"))
		return assert.is_true(result:match("item:"))
	end)
	it("should support empty lines", function()
		local s = "line1\nline3"
		assert.is_true(s:match("line1"))
		return assert.is_true(s:match("line3"))
	end)
	it("should work with table access in interpolation", function()
		local t = {
			value = 100
		}
		local s = "value: " .. tostring(t.value)
		return assert.is_true(s:match("value: 100"))
	end)
	it("should support function calls in interpolation", function()
		local s = "result: " .. tostring((function()
			return 42
		end)())
		return assert.is_true(s:match("result: 42"))
	end)
	it("should handle quotes correctly", function()
		local s = "\"quoted\"\n'single quoted'"
		assert.is_true(s:match('"quoted"'))
		return assert.is_true(s:match("'single quoted'"))
	end)
	it("should work with multiple interpolations", function()
		local a, b, c = 1, 2, 3
		local s = "values: " .. tostring(a) .. ", " .. tostring(b) .. ", " .. tostring(c)
		return assert.is_true(s:match("values: 1, 2, 3"))
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
