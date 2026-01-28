local _anon_func_0 = function(assert, select, _arg_0, ...)
	local ok = _arg_0
	local count = select('#', ...)
	assert.same(count, 5)
	return assert.same(ok, true)
end
local _anon_func_1 = function(assert, select, ...)
	local first = select(1, ...)
	local second = select(2, ...)
	local third = select(3, ...)
	assert.same(first, 10)
	assert.same(second, 20)
	return assert.same(third, 30)
end
local _anon_func_2 = function(assert, select, _arg_0, ...)
	local success = _arg_0
	assert.is_true(success)
	return assert.same(select('#', ...), 3)
end
local _anon_func_3 = function(assert, select, ...)
	local count = select('#', ...)
	return assert.same(count, 0)
end
local _anon_func_4 = function(assert, select, _arg_0, ...)
	local a = _arg_0
	assert.same(a, "first")
	return assert.same(select('#', ...), 3)
end
local _anon_func_5 = function(assert, select, ...)
	local count = select('#', ...)
	assert.same(count, 5)
	assert.same(select(1, ...), 1)
	assert.same(select(2, ...), nil)
	return assert.same(select(3, ...), 2)
end
local _anon_func_6 = function(assert, select, ...)
	local count = select('#', ...)
	return assert.same(count, 3)
end
local _anon_func_7 = function(a, assert, select, _arg_1, ...)
	local b = _arg_1
	assert.same(a, 1)
	assert.same(b, 4)
	return assert.same(select('#', ...), 2)
end
local _anon_func_8 = function(assert, sum, ...)
	local result = sum(...)
	return assert.same(result, 15)
end
local _anon_func_9 = function(assert, string, ...)
	local result = string.format("str: %s, num: %d, bool: %s", ...)
	return assert.same(result, "str: hello, num: 123, bool: true")
end
local _anon_func_10 = function(assert, select, ...)
	local count = select('#', ...)
	assert.same(count, 1)
	return assert.same(select(1, ...), 42)
end
local _anon_func_11 = function(assert, inner, _arg_0, _arg_1, ...)
	local a, b = _arg_0, _arg_1
	local c, d = inner()
	assert.same(a, 1)
	assert.same(b, 2)
	assert.same(c, 4)
	return assert.same(d, 5)
end
return describe("varargs assignment", function()
	it("should assign varargs from function", function()
		local list = {
			1,
			2,
			3,
			4,
			5
		}
		local fn
		fn = function(ok)
			return ok, table.unpack(list)
		end
		return _anon_func_0(assert, select, fn(true))
	end)
	it("should access varargs elements", function()
		local list = {
			10,
			20,
			30
		}
		local fn
		fn = function()
			return table.unpack(list)
		end
		return _anon_func_1(assert, select, fn())
	end)
	it("should work with pcall", function()
		local fn
		fn = function()
			return 1, 2, 3
		end
		return _anon_func_2(assert, select, pcall(fn))
	end)
	it("should handle empty varargs", function()
		local fn
		fn = function() end
		return _anon_func_3(assert, select, fn())
	end)
	it("should work with mixed return values", function()
		local fn
		fn = function()
			return "first", nil, "third", false
		end
		return _anon_func_4(assert, select, fn())
	end)
	it("should preserve nil values in varargs", function()
		local fn
		fn = function()
			return 1, nil, 2, nil, 3
		end
		return _anon_func_5(assert, select, fn())
	end)
	it("should work with table.unpack", function()
		local tb = {
			1,
			2,
			3
		}
		local fn
		fn = function()
			return table.unpack(tb)
		end
		return _anon_func_6(assert, select, fn())
	end)
	it("should chain varargs assignment", function()
		local fn1
		fn1 = function()
			return 1, 2, 3
		end
		local fn2
		fn2 = function()
			return table.unpack({
				4,
				5,
				6
			})
		end
		return (function(_arg_0, ...)
			local a = _arg_0
			return _anon_func_7(a, assert, select, fn2())
		end)(fn1())
	end)
	it("should work in expressions", function()
		local sum
		sum = function(...)
			local total = 0
			for i = 1, select('#', ...) do
				if type(select(i, ...)) == "number" then
					total = total + select(i, ...)
				end
			end
			return total
		end
		local fn
		fn = function()
			return 1, 2, 3, 4, 5
		end
		return _anon_func_8(assert, sum, fn())
	end)
	it("should work with string.format", function()
		return _anon_func_9(assert, string, "hello", 123, true)
	end)
	it("should handle single return value", function()
		local fn
		fn = function()
			return 42
		end
		return _anon_func_10(assert, select, fn())
	end)
	return it("should work with nested functions", function()
		local outer
		outer = function()
			return 1, 2, 3
		end
		local inner
		inner = function()
			return 4, 5
		end
		return _anon_func_11(assert, inner, outer())
	end)
end)
