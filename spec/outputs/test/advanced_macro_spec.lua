return describe("advanced macro", function()
	it("should evaluate macro at compile time", function()
		local area = 6.2831853071796 * 5
		return assert.is_true(area > 0)
	end)
	it("should support macro with arguments", function()
		local result = (5 + 10)
		return assert.same(result, 15)
	end)
	it("should handle string returning macro", function()
		local result = 'hello world'
		return assert.same(result, "hello world")
	end)
	it("should work with conditional compilation", function()
		debugMode = true
		assert.is_true(debugMode)
		return assert.is_true(debugMode)
	end)
	it("should support macro generating conditional code", function()
		debugMode = true
		local x = 10
		return assert.same(x, 10)
	end)
	it("should work with lua code insertion", function()
		local macro_test_var = 42
		do
local macro_test_var = 99
		end
		return assert.same(macro_test_var, 42)
	end)
	it("should support multi-line raw lua", function()
		local multiline_var = "test"
multiline_var = "test work"
			local multiline_var1 = "test1"
		assert.same(multiline_var, "test work")
		return assert.same(multiline_var1, "test1")
	end)
	it("should export macro from module", function()
		local result = (5 * 2)
		return assert.same(result, 10)
	end)
	it("should work with builtin FILE macro", function()
		local result = '=(macro file_test)'
		return assert.is_true(type(result) == "string")
	end)
	it("should work with builtin LINE macro", function()
		local result = 82
		return assert.is_true(type(result) == "number")
	end)
	it("should support argument validation", function()
		local result = 123
		return assert.same(result, 123)
	end)
	it("should handle string argument validation", function()
		local result = "hello"
		return assert.same(result, "hello")
	end)
	it("should work with is_ast check", function()
		local result = (10 + 20)
		return assert.same(result, 30)
	end)
	it("should support macro generating macro", function()
		local result = "Red"
		return assert.same(result, "Red")
	end)
	it("should handle complex macro logic", function()
		local my_print
		my_print = function(...)
			return ...
		end
		local a, b, c = my_print("hello", "world", 123)
		assert.same(a, "hello")
		assert.same(b, "world")
		return assert.same(c, 123)
	end)
	it("should work with table manipulation", function()
		local result = {
			"1",
			"2",
			"3"
		}
		return assert.same(result, {
			"1",
			"2",
			"3"
		})
	end)
	return it("should support string concatenation in macro", function()
		local result = ("hello" .. "world")
		return assert.same(result, "helloworld")
	end)
end)
