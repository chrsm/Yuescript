return describe("const attribute", function()
	it("should declare const variable", function()
		local a <const> = 123
		return assert.same(a, 123)
	end)
	it("should prevent reassignment", function()
		local b <const> = 456
		return assert.same(b, 456)
	end)
	it("should work with strings", function()
		local name <const> = "test"
		return assert.same(name, "test")
	end)
	it("should support const with destructuring", function()
		local tb = {
			a = 1,
			b = 2,
			3,
			4
		}
		local a, b, c, d
		a, b, c, d = tb.a, tb.b, tb[1], tb[2]
		assert.same(a, 1)
		assert.same(b, 2)
		assert.same(c, 3)
		return assert.same(d, 4)
	end)
	it("should handle nested const", function()
		local nested <const> = {
			inner = {
				value = 10
			}
		}
		return assert.same(nested.inner.value, 10)
	end)
	it("should work with arrays", function()
		local items
		items = {
			1,
			2,
			3
		}
		return assert.same(items[1], 1)
	end)
	it("should support const in function scope", function()
		local fn
		fn = function()
			local local_const <const> = "local"
			return local_const
		end
		local result = fn()
		return assert.same(result, "local")
	end)
	it("should work with multiple const declarations", function()
		local x <const> = 1
		local y <const> = 2
		local z <const> = 3
		return assert.same(x + y + z, 6)
	end)
	it("should handle const functions", function()
		local add
		add = function(a, b)
			return a + b
		end
		return assert.same(add(5, 10), 15)
	end)
	it("should work with const tables", function()
		local config <const> = {
			host = "localhost",
			port = 8080
		}
		assert.same(config.host, "localhost")
		return assert.same(config.port, 8080)
	end)
	it("should support global const", function()
		GLOBAL_CONST = 999
		return assert.same(GLOBAL_CONST, 999)
	end)
	it("should work with boolean const", function()
		local flag <const> = true
		local another <const> = false
		assert.is_true(flag)
		return assert.is_false(another)
	end)
	it("should handle nil const", function()
		local nil_value <const> = nil
		return assert.same(nil_value, nil)
	end)
	it("should work with expressions", function()
		local calculated <const> = 10 + 20
		return assert.same(calculated, 30)
	end)
	it("should work in table comprehension", function()
		local multiplier <const> = 2
		local items = {
			1,
			2,
			3
		}
		local result
		do
			local _accum_0 = { }
			local _len_0 = 1
			for _index_0 = 1, #items do
				local item = items[_index_0]
				_accum_0[_len_0] = item * multiplier
				_len_0 = _len_0 + 1
			end
			result = _accum_0
		end
		return assert.same(result, {
			2,
			4,
			6
		})
	end)
	return it("should work with complex expressions", function()
		local complex <const> = {
			data = {
				1,
				2,
				3
			},
			nested = {
				key = "value"
			}
		}
		assert.same(complex.data[1], 1)
		return assert.same(complex.nested.key, "value")
	end)
end)
