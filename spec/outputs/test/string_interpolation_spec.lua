return describe("string interpolation", function()
	it("should interpolate in double quotes", function()
		local name = "World"
		local result = "Hello " .. tostring(name) .. "!"
		return assert.same(result, "Hello World!")
	end)
	it("should interpolate numbers", function()
		local a, b = 10, 20
		local result = tostring(a) .. " + " .. tostring(b) .. " = " .. tostring(a + b)
		return assert.same(result, "10 + 20 = 30")
	end)
	it("should interpolate expressions", function()
		local x = 5
		local result = "x * 2 = " .. tostring(x * 2)
		return assert.same(result, "x * 2 = 10")
	end)
	it("should interpolate function calls", function()
		local result = "result: " .. tostring(math.floor(5.5))
		return assert.same(result, "result: 5")
	end)
	it("should interpolate in string literals", function()
		local x = 100
		local result = "Value: " .. tostring(x)
		return assert.same(result, "Value: 100")
	end)
	it("should work with nested interpolation", function()
		local inner = "inner"
		local result = "Outer: " .. tostring(inner)
		return assert.same(result, "Outer: inner")
	end)
	return it("should not interpolate in single quotes", function()
		local name = "World"
		local result = 'Hello #{name}!'
		return assert.same(result, 'Hello #{name}!')
	end)
end)
