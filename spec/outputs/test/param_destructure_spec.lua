local _anon_func_0 = function(_arg_0)
	local _accum_0 = { }
	local _len_0 = 1
	local _max_0 = #_arg_0
	for _index_0 = 2, _max_0 do
		local _item_0 = _arg_0[_index_0]
		_accum_0[_len_0] = _item_0
		_len_0 = _len_0 + 1
	end
	return _accum_0
end
local _anon_func_1 = function(_arg_0)
	local _accum_0 = { }
	local _len_0 = 1
	local _max_0 = #_arg_0
	for _index_0 = 1, _max_0 do
		local _item_0 = _arg_0[_index_0]
		_accum_0[_len_0] = _item_0
		_len_0 = _len_0 + 1
	end
	return _accum_0
end
return describe("parameter destructuring", function()
	it("should destructure simple object", function()
		local f
		f = function(_arg_0)
			local a, b, c
			a, b, c = _arg_0.a, _arg_0.b, _arg_0.c
			return {
				a,
				b,
				c
			}
		end
		local result = f({
			a = 1,
			b = "2",
			c = { }
		})
		return assert.same(result, {
			1,
			"2",
			{ }
		})
	end)
	it("should work with default values", function()
		local f
		f = function(_arg_0, c)
			local a1, b
			a1, b = _arg_0.a, _arg_0.b
			if a1 == nil then
				a1 = 123
			end
			if b == nil then
				b = 'abc'
			end
			if c == nil then
				c = { }
			end
			return {
				a1,
				b,
				c
			}
		end
		local result1 = f({
			a = 0
		}, "test")
		assert.same(result1, {
			0,
			'abc',
			'test'
		})
		local result2 = f({ })
		return assert.same(result2, {
			123,
			'abc',
			{ }
		})
	end)
	it("should destructure with mixed syntax", function()
		local f
		f = function(_arg_0)
			local a, b1, c
			a, b1, c = _arg_0.a, _arg_0.b, _arg_0.c
			return {
				a,
				b1,
				c
			}
		end
		local result = f({
			a = 1,
			b = 2,
			c = 3
		})
		return assert.same(result, {
			1,
			2,
			3
		})
	end)
	it("should work with nested destructuring", function()
		local f
		f = function(_arg_0)
			local x, y
			x, y = _arg_0.nested.x, _arg_0.nested.y
			return {
				x,
				y
			}
		end
		local result = f({
			nested = {
				x = 10,
				y = 20
			}
		})
		return assert.same(result, {
			10,
			20
		})
	end)
	it("should handle array parameters", function()
		local f
		f = function(_arg_0)
			local a, b, c
			a, b, c = _arg_0[1], _arg_0[2], _arg_0[3]
			return {
				a,
				b,
				c
			}
		end
		local result = f({
			1,
			2,
			3
		})
		return assert.same(result, {
			1,
			2,
			3
		})
	end)
	it("should support mixed array and object", function()
		local f
		f = function(_arg_0, _arg_1)
			local first
			first = _arg_0[1]
			local value
			value = _arg_1.key.value
			return {
				first,
				value
			}
		end
		local result = f({
			1
		}, {
			key = {
				value = "test"
			}
		})
		return assert.same(result, {
			1,
			"test"
		})
	end)
	it("should work with fat arrow", function()
		local obj = {
			value = 100,
			f = function(self, _arg_0)
				local x, y
				x, y = _arg_0.x, _arg_0.y
				return self.value + x + y
			end
		}
		local result = obj:f({
			x = 10,
			y = 20
		})
		return assert.same(result, 130)
	end)
	it("should handle missing keys", function()
		local f
		f = function(_arg_0)
			local a, b, c
			a, b, c = _arg_0.a, _arg_0.b, _arg_0.c
			if b == nil then
				b = "default"
			end
			if c == nil then
				c = "missing"
			end
			return {
				a,
				b,
				c
			}
		end
		local result = f({
			a = 1
		})
		return assert.same(result, {
			1,
			'default',
			'missing'
		})
	end)
	it("should work with complex defaults", function()
		local f
		f = function(_arg_0)
			local a1, b1
			a1, b1 = _arg_0.a, _arg_0.b
			if a1 == nil then
				a1 = 100
			end
			if b1 == nil then
				b1 = a1 + 1000
			end
			return a1 + b1
		end
		local result = f({ })
		return assert.same(result, 1200)
	end)
	it("should support deep nesting", function()
		local f
		f = function(_arg_0)
			local value
			value = _arg_0.data.nested.value
			return value
		end
		local result = f({
			data = {
				nested = {
					value = 42
				}
			}
		})
		return assert.same(result, 42)
	end)
	it("should work with multiple parameters", function()
		local f
		f = function(_arg_0, extra)
			local x, y, z
			x, y, z = _arg_0.x, _arg_0.y, _arg_0.z
			if extra == nil then
				extra = "default"
			end
			return {
				x,
				y,
				z,
				extra
			}
		end
		local result = f({
			x = 1,
			y = 2,
			z = 3
		})
		return assert.same(result, {
			1,
			2,
			3,
			'default'
		})
	end)
	it("should handle array destructuring in parameters", function()
		local f
		f = function(_arg_0)
			local first, rest
			first, rest = _arg_0[1], _anon_func_0(_arg_0)
			return {
				first,
				rest
			}
		end
		local result = f({
			1,
			2,
			3,
			4
		})
		return assert.same(result, {
			1,
			{
				2,
				3,
				4
			}
		})
	end)
	it("should support spreading", function()
		local f
		f = function(_arg_0)
			local rest, last
			rest, last = _anon_func_1(_arg_0), _arg_0.last
			return {
				rest,
				last
			}
		end
		local result = f({
			1,
			2,
			3,
			last = "final"
		})
		return assert.same(result, {
			{
				1,
				2,
				3
			},
			'final'
		})
	end)
	it("should work with table comprehensions", function()
		local f
		f = function(_arg_0)
			local items
			items = _arg_0.items
			local _accum_0 = { }
			local _len_0 = 1
			for _index_0 = 1, #items do
				local item = items[_index_0]
				_accum_0[_len_0] = item * 2
				_len_0 = _len_0 + 1
			end
			return _accum_0
		end
		local result = f({
			items = {
				1,
				2,
				3
			}
		})
		return assert.same(result, {
			2,
			4,
			6
		})
	end)
	return it("should handle nil arguments", function()
		local f
		f = function(_arg_0)
			local a, b
			a, b = _arg_0.a, _arg_0.b
			if a == nil then
				a = "nil_a"
			end
			if b == nil then
				b = "nil_b"
			end
			return {
				a,
				b
			}
		end
		local result = f({ })
		return assert.same(result, {
			"nil_a",
			"nil_b"
		})
	end)
end)
