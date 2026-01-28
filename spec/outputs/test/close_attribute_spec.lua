return describe("close attribute", function()
	it("should declare close variable", function()
		local closed = false
		do
			local _ <close> = setmetatable({ }, {
				__close = function()
					closed = true
				end
			})
		end
		return assert.is_true(closed)
	end)
	it("should work with metatable syntax", function()
		local called = false
		do
			local _ <close> = setmetatable({ }, {
				__close = function()
					called = true
				end
			})
		end
		return assert.is_true(called)
	end)
	it("should handle multiple close scopes", function()
		local order = { }
		do
			local first <close> = setmetatable({ }, {
				__close = function()
					return table.insert(order, "first")
				end
			})
			local second <close> = setmetatable({ }, {
				__close = function()
					return table.insert(order, "second")
				end
			})
		end
		return assert.same(order, {
			"second",
			"first"
		})
	end)
	it("should work with resources", function()
		local resource_opened = false
		local resource_closed = false
		do
			resource_opened = true
			local _ <close> = setmetatable({ }, {
				__close = function()
					resource_closed = true
				end
			})
		end
		assert.is_true(resource_opened)
		return assert.is_true(resource_closed)
	end)
	it("should support close in function", function()
		local closed = false
		local fn
		fn = function()
			local _ <close> = setmetatable({ }, {
				__close = function()
					closed = true
				end
			})
			return "result"
		end
		local result = fn()
		assert.same(result, "result")
		return assert.is_true(closed)
	end)
	it("should work with fat arrow", function()
		local closed = false
		local obj = setmetatable({
			value = 10,
		}, {
			__close = function(self)
				closed = true
			end
		})
		do
			local _ <close> = obj
		end
		return assert.is_true(closed)
	end)
	it("should handle nested close scopes", function()
		local outer_closed = false
		local inner_closed = false
		do
			local outer <close> = setmetatable({ }, {
				__close = function()
					outer_closed = true
				end
			})
			do
				local inner <close> = setmetatable({ }, {
					__close = function()
						inner_closed = true
					end
				})
			end
		end
		assert.is_true(inner_closed)
		return assert.is_true(outer_closed)
	end)
	it("should work with conditional close", function()
		local closed = false
		local should_close = true
		if should_close then
			local _ <close> = setmetatable({ }, {
				__close = function()
					closed = true
				end
			})
		end
		return assert.is_true(closed)
	end)
	it("should support close in loop", function()
		local closed_count = 0
		for i = 1, 3 do
			do
				local _ <close> = setmetatable({ }, {
					__close = function()
						closed_count = closed_count + 1
					end
				})
			end
		end
		return assert.same(closed_count, 3)
	end)
	it("should work with table destructuring", function()
		local closed = false
		do
			local tb <close> = setmetatable({ }, {
				__close = function()
					closed = true
				end
			})
		end
		return assert.is_true(closed)
	end)
	it("should handle close with return value", function()
		local closed = false
		local fn
		fn = function()
			local _ <close> = setmetatable({ }, {
				__close = function()
					closed = true
				end
			})
			return 42
		end
		local result = fn()
		assert.same(result, 42)
		return assert.is_true(closed)
	end)
	it("should work with error handling", function()
		local closed = false
		local error_thrown = false
		do
			local _ <close> = setmetatable({ }, {
				__close = function()
					closed = true
				end
			})
			error_thrown = true
		end
		assert.is_true(closed)
		return assert.is_true(error_thrown)
	end)
	it("should support close in varargs function", function()
		local closed = false
		local fn
		fn = function(...)
			local _ <close> = setmetatable({ }, {
				__close = function()
					closed = true
				end
			})
			return {
				...
			}
		end
		local result = fn(1, 2, 3)
		assert.same(result, {
			1,
			2,
			3
		})
		return assert.is_true(closed)
	end)
	it("should work with multiple variables", function()
		local first_closed = false
		local second_closed = false
		do
			local first <close> = setmetatable({ }, {
				__close = function()
					first_closed = true
				end
			})
			local second <close> = setmetatable({ }, {
				__close = function()
					second_closed = true
				end
			})
		end
		assert.is_true(first_closed)
		return assert.is_true(second_closed)
	end)
	return it("should handle close in try block", function()
		local closed = false
		local success = false
		success = xpcall(function()
			local _ <close> = setmetatable({ }, {
				__close = function()
					closed = true
				end
			})
			return true
		end, function(err)
			return false
		end)
		assert.is_true(success)
		return assert.is_true(closed)
	end)
end)
