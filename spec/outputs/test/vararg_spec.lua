return describe("vararg", function()
	it("should pass varargs to function", function()
		local sum
		sum = function(...)
			local total = 0
			for i = 1, select("#", ...) do
				if type(select(i, ...)) == "number" then
					total = total + select(i, ...)
				end
			end
			return total
		end
		local result = sum(1, 2, 3, 4, 5)
		return assert.same(result, 15)
	end)
	it("should handle empty varargs", function()
		local fn
		fn = function(...)
			return select("#", ...)
		end
		local result = fn()
		return assert.same(result, 0)
	end)
	it("should spread varargs in function call", function()
		local receiver
		receiver = function(a, b, c)
			return {
				a,
				b,
				c
			}
		end
		local source
		source = function()
			return 1, 2, 3
		end
		local result = receiver(source())
		return assert.same(result, {
			1,
			2,
			3
		})
	end)
	it("should use varargs in table", function()
		local fn
		fn = function(...)
			return {
				...
			}
		end
		local result = fn(1, 2, 3)
		return assert.same(result, {
			1,
			2,
			3
		})
	end)
	it("should forward varargs", function()
		local middle
		middle = function(fn, ...)
			return fn(...)
		end
		local inner
		inner = function(a, b, c)
			return a + b + c
		end
		local result = middle(inner, 1, 2, 3)
		return assert.same(result, 6)
	end)
	it("should count varargs with select", function()
		local fn
		fn = function(...)
			return select("#", ...)
		end
		assert.same(fn(1, 2, 3), 3)
		assert.same(fn("a", "b"), 2)
		return assert.same(fn(), 0)
	end)
	it("should select from varargs", function()
		local fn
		fn = function(...)
			return select(2, ...)
		end
		local result = fn(1, 2, 3)
		return assert.same(result, 2)
	end)
	it("should work with named parameters and varargs", function()
		local fn
		fn = function(first, ...)
			return {
				first,
				select("#", ...)
			}
		end
		local result = fn("first", "second", "third")
		return assert.same(result, {
			"first",
			2
		})
	end)
	it("should handle nil in varargs", function()
		local fn
		fn = function(...)
			local count = select("#", ...)
			local has_nil = false
			for i = 1, count do
				if select(i, ...) == nil then
					has_nil = true
				end
			end
			return {
				count,
				has_nil
			}
		end
		local result = fn(1, nil, 3)
		return assert.same(result, {
			3,
			true
		})
	end)
	it("should work with table unpack", function()
		local fn
		fn = function(...)
			return {
				...
			}
		end
		local result = fn(table.unpack({
			1,
			2,
			3
		}))
		return assert.same(result, {
			1,
			2,
			3
		})
	end)
	return it("should work with varargs in comprehension", function()
		local fn
		fn = function(...)
			local _accum_0 = { }
			local _len_0 = 1
			local _list_0 = {
				...
			}
			for _index_0 = 1, #_list_0 do
				local x = _list_0[_index_0]
				_accum_0[_len_0] = x * 2
				_len_0 = _len_0 + 1
			end
			return _accum_0
		end
		local result = fn(1, 2, 3, 4, 5)
		return assert.same(result, {
			2,
			4,
			6,
			8,
			10
		})
	end)
end)
