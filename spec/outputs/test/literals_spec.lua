return describe("literals", function()
	it("should support integer literals", function()
		return assert.same(123, 123)
	end)
	it("should support float literals", function()
		return assert.same(1.5, 1.5)
	end)
	it("should support scientific notation", function()
		return assert.same(1.5e2, 150)
	end)
	it("should support negative numbers", function()
		return assert.same(-42, -42)
	end)
	it("should support hexadecimal literals", function()
		return assert.same(0xff, 255)
	end)
	it("should support hexadecimal with uppercase", function()
		return assert.same(0XFF, 255)
	end)
	it("should support binary literals", function()
		return assert.same(5, 5)
	end)
	it("should support binary with uppercase", function()
		return assert.same(5, 5)
	end)
	it("should support number with underscores", function()
		return assert.same(1000000, 1000000)
	end)
	it("should support hex with underscores", function()
		return assert.same(0xDEADBEEF, 0xDEADBEEF)
	end)
	it("should support double quote strings", function()
		return assert.same("hello", "hello")
	end)
	it("should support single quote strings", function()
		return assert.same('world', 'world')
	end)
	it("should support multi-line strings with [[", function()
		local s = [[			hello
			world
		]]
		return assert.is_true((s:match("hello") ~= nil))
	end)
	it("should support multi-line strings with [=[", function()
		local s = [==[			test
		]==]
		return assert.is_true((s:match("test") ~= nil))
	end)
	it("should support boolean true", function()
		return assert.same(true, true)
	end)
	it("should support boolean false", function()
		return assert.same(false, false)
	end)
	it("should support nil", function()
		return assert.same(nil, nil)
	end)
	it("should support empty table", function()
		local t = { }
		return assert.same(#t, 0)
	end)
	it("should support table with keys", function()
		local t = {
			a = 1,
			b = 2
		}
		assert.same(t.a, 1)
		return assert.same(t.b, 2)
	end)
	it("should support array literal", function()
		local t = {
			1,
			2,
			3
		}
		assert.same(t[1], 1)
		assert.same(t[2], 2)
		return assert.same(t[3], 3)
	end)
	return it("should support mixed table", function()
		local t = {
			1,
			2,
			3,
			key = "value"
		}
		assert.same(t[1], 1)
		return assert.same(t.key, "value")
	end)
end)
