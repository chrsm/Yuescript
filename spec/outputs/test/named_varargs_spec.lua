return describe("named varargs", function()
	it("should store varargs in named table", function()
		local f
		f = function(...)
			local t = {
				n = select("#", ...),
				...
			}
			assert.same(t.n, 3)
			assert.same(t[1], 1)
			assert.same(t[2], 2)
			return assert.same(t[3], 3)
		end
		return f(1, 2, 3)
	end)
	it("should handle string arguments", function()
		local f
		f = function(...)
			local args = {
				n = select("#", ...),
				...
			}
			assert.same(args.n, 3)
			assert.same(args[1], "a")
			assert.same(args[2], "b")
			return assert.same(args[3], "c")
		end
		return f("a", "b", "c")
	end)
	it("should handle empty varargs", function()
		local f
		f = function(...)
			local t = {
				n = select("#", ...),
				...
			}
			assert.same(t.n, 0)
			return assert.same(#t, 0)
		end
		return f()
	end)
	it("should preserve nil values", function()
		local f
		f = function(...)
			local args = {
				n = select("#", ...),
				...
			}
			assert.same(args.n, 5)
			assert.same(args[1], 1)
			assert.same(args[2], nil)
			assert.same(args[3], 3)
			assert.same(args[4], nil)
			return assert.same(args[5], 5)
		end
		return f(1, nil, 3, nil, 5)
	end)
	it("should work with loop", function()
		local f
		f = function(...)
			local t = {
				n = select("#", ...),
				...
			}
			local sum = 0
			for i = 1, t.n do
				if type(t[i]) == "number" then
					sum = sum + t[i]
				end
			end
			return sum
		end
		local result = f(1, 2, 3, 4, 5)
		return assert.same(result, 15)
	end)
	it("should handle mixed types", function()
		local f
		f = function(...)
			local args = {
				n = select("#", ...),
				...
			}
			local types
			do
				local _accum_0 = { }
				local _len_0 = 1
				for i = 1, args.n do
					_accum_0[_len_0] = type(args[i])
					_len_0 = _len_0 + 1
				end
				types = _accum_0
			end
			return types
		end
		local result = f("string", 123, true, nil, { })
		return assert.same(result, {
			"string",
			"number",
			"boolean",
			"nil",
			"table"
		})
	end)
	it("should work with table access", function()
		local f
		f = function(...)
			local t = {
				n = select("#", ...),
				...
			}
			local first = t[1]
			local last = t[t.n]
			return {
				first,
				last
			}
		end
		local result = f(1, 2, 3, 4, 5)
		return assert.same(result, {
			1,
			5
		})
	end)
	it("should support select with named args", function()
		local f
		f = function(...)
			local args = {
				n = select("#", ...),
				...
			}
			local second = select(2, table.unpack(args))
			return second
		end
		local result = f("a", "b", "c")
		return assert.same(result, "b")
	end)
	it("should work with pcall", function()
		local f
		f = function(...)
			local t = {
				n = select("#", ...),
				...
			}
			local success = true
			for i = 1, t.n do
				if t[i] == nil then
					success = false
				end
			end
			return success
		end
		local result = f(1, nil, 3)
		return assert.is_false(result)
	end)
	it("should handle function results", function()
		local g
		g = function()
			return 1, 2, 3
		end
		local f
		f = function(...)
			local t = {
				n = select("#", ...),
				...
			}
			return t.n
		end
		local result = f(g())
		return assert.same(result, 3)
	end)
	it("should work with unpacking", function()
		local f
		f = function(...)
			local args = {
				n = select("#", ...),
				...
			}
			return {
				table.unpack(args)
			}
		end
		local result = f("a", "b", "c")
		return assert.same(result, {
			"a",
			"b",
			"c"
		})
	end)
	it("should support passing named varargs to another function", function()
		local outer
		outer = function(...)
			local t = {
				n = select("#", ...),
				...
			}
			return inner((table.unpack(t)))
		end
		local inner
		inner = function(a, b, c)
			return {
				a,
				b,
				c
			}
		end
		local result = outer(1, 2, 3)
		return assert.same(result, {
			1,
			2,
			3
		})
	end)
	it("should work with default parameter", function()
		local f
		f = function(x, ...)
			if x == nil then
				x = 10
			end
			local t = {
				n = select("#", ...),
				...
			}
			return x + t[1] or 0
		end
		local result = f(5, 15)
		return assert.same(result, 20)
	end)
	return it("should handle single argument", function()
		local f
		f = function(...)
			local t = {
				n = select("#", ...),
				...
			}
			return {
				t.n,
				t[1]
			}
		end
		local result = f(42)
		return assert.same(result, {
			1,
			42
		})
	end)
end)
