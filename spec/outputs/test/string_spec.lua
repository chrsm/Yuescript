return describe("string", function()
	it("should support single quote strings", function()
		local s = 'hello'
		return assert.same(s, "hello")
	end)
	it("should support double quote strings", function()
		local s = "world"
		return assert.same(s, "world")
	end)
	it("should support escape sequences", function()
		local s = "hello\nworld"
		return assert.is_true(s:match("\n") ~= nil)
	end)
	it("should support escaped quotes", function()
		local s = "he said \"hello\""
		return assert.same(s, 'he said "hello"')
	end)
	it("should support backslash escape", function()
		local s = "\\"
		return assert.same(s, "\\")
	end)
	it("should support multi-line strings with [[ ]]", function()
		local s = [[			hello
			world
		]]
		assert.is_true(s:match("hello") ~= nil)
		return assert.is_true(s:match("world") ~= nil)
	end)
	it("should support multi-line strings with [=[ ]=]", function()
		local s = [==[			hello
			world
		]==]
		assert.is_true(s:match("hello") ~= nil)
		return assert.is_true(s:match("world") ~= nil)
	end)
	it("should support string interpolation with double quotes", function()
		local name = "world"
		local s = "hello " .. tostring(name)
		return assert.same(s, "hello world")
	end)
	it("should support expression interpolation", function()
		local a, b = 1, 2
		local s = tostring(a) .. " + " .. tostring(b) .. " = " .. tostring(a + b)
		return assert.same(s, "1 + 2 = 3")
	end)
	it("should not interpolate in single quotes", function()
		local name = "world"
		local s = 'hello #{name}'
		return assert.same(s, "hello #{name}")
	end)
	it("should escape interpolation with \\#", function()
		local name = "world"
		local s = "hello #{name}"
		return assert.same(s, 'hello #{name}')
	end)
	it("should support method calls on string literals", function()
		local result = ("hello"):upper()
		return assert.same(result, "HELLO")
	end)
	it("should support chained method calls", function()
		local result = ("hello world"):upper():match("HELLO")
		return assert.same(result, "HELLO")
	end)
	it("should support YAML style strings", function()
		local s = "hello\nworld"
		assert.is_true(s:match("hello") ~= nil)
		return assert.is_true(s:match("world") ~= nil)
	end)
	it("should support YAML style with interpolation", function()
		local name = "test"
		local s = "hello " .. tostring(name)
		return assert.same(s, "hello test")
	end)
	it("should support string concatenation", function()
		local s = "hello" .. " " .. "world"
		return assert.same(s, "hello world")
	end)
	it("should handle empty strings", function()
		local s = ""
		return assert.same(s, "")
	end)
	it("should support Unicode characters", function()
		local s = "hello 世界"
		return assert.is_true(s:match("世界") ~= nil)
	end)
	it("should support string length", function()
		local s = "hello"
		return assert.same(#s, 5)
	end)
	it("should support multi-line YAML with complex content", function()
		local config = "key1: value1\nkey2: value2\nkey3: value3"
		return assert.is_true(config:match("key1") ~= nil)
	end)
	it("should support interpolation in YAML strings", function()
		local x, y = 10, 20
		local s = "point:\n\tx: " .. tostring(x) .. "\n\ty: " .. tostring(y)
		assert.is_true(s:match("x: 10") ~= nil)
		return assert.is_true(s:match("y: 20") ~= nil)
	end)
	it("should support function call in interpolation", function()
		local s = "result: " .. tostring((function()
			return 42
		end)())
		return assert.same(s, "result: 42")
	end)
	it("should support table indexing in interpolation", function()
		local t = {
			value = 100
		}
		local s = "value: " .. tostring(t.value)
		return assert.same(s, "value: 100")
	end)
	it("should handle escaped characters correctly", function()
		local s = "tab:\t, newline:\n, return:\r"
		assert.is_true(s:match("\t") ~= nil)
		return assert.is_true(s:match("\n") ~= nil)
	end)
	it("should support string methods with colon syntax", function()
		local s = "hello"
		return assert.same(s:sub(1, 2), "he")
	end)
	it("should work in expressions", function()
		local result = "hello" .. " world"
		return assert.same(result, "hello world")
	end)
	it("should support octal escape", function()
		local s = "\65"
		return assert.same(s, "A")
	end)
	it("should support hex escape", function()
		local s = "\x41"
		return assert.same(s, "A")
	end)
	return it("should support unicode escape", function()
		local s = "\u{4e16}"
		return assert.same(s, "世")
	end)
end)
