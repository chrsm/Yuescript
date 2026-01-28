return describe("table comprehension", function()
	it("should create simple table copy", function()
		local thing = {
			color = "red",
			name = "fast",
			width = 123
		}
		local thing_copy
		do
			local _tbl_0 = { }
			for k, v in pairs(thing) do
				_tbl_0[k] = v
			end
			thing_copy = _tbl_0
		end
		assert.same(thing_copy.color, thing.color)
		assert.same(thing_copy.name, thing.name)
		return assert.same(thing_copy.width, thing.width)
	end)
	it("should filter with when clause", function()
		local thing = {
			color = "red",
			name = "fast",
			width = 123
		}
		local no_color
		do
			local _tbl_0 = { }
			for k, v in pairs(thing) do
				if k ~= "color" then
					_tbl_0[k] = v
				end
			end
			no_color = _tbl_0
		end
		assert.same(no_color.color, nil)
		assert.same(no_color.name, "fast")
		return assert.same(no_color.width, 123)
	end)
	it("should transform values", function()
		local numbers = {
			a = 1,
			b = 2,
			c = 3
		}
		local doubled
		do
			local _tbl_0 = { }
			for k, v in pairs(numbers) do
				_tbl_0[k] = v * 2
			end
			doubled = _tbl_0
		end
		assert.same(doubled.a, 2)
		assert.same(doubled.b, 4)
		return assert.same(doubled.c, 6)
	end)
	it("should transform keys", function()
		local data = {
			a = 1,
			b = 2
		}
		local upper_keys
		do
			local _tbl_0 = { }
			for k, v in pairs(data) do
				_tbl_0[k:upper()] = v
			end
			upper_keys = _tbl_0
		end
		assert.same(upper_keys.A, 1)
		return assert.same(upper_keys.B, 2)
	end)
	it("should work with ipairs", function()
		local items = {
			"a",
			"b",
			"c"
		}
		local reversed
		do
			local _tbl_0 = { }
			for i, v in ipairs(items) do
				_tbl_0[i] = v
			end
			reversed = _tbl_0
		end
		assert.same(reversed[1], "a")
		assert.same(reversed[2], "b")
		return assert.same(reversed[3], "c")
	end)
	it("should filter array items", function()
		local items = {
			1,
			2,
			3,
			4,
			5
		}
		local evens
		do
			local _tbl_0 = { }
			for i, v in ipairs(items) do
				if v % 2 == 0 then
					_tbl_0[i] = v
				end
			end
			evens = _tbl_0
		end
		assert.same(evens[2], 2)
		assert.same(evens[4], 4)
		return assert.same(evens[1], nil)
	end)
	it("should work with numeric for loop", function()
		local squares
		do
			local _tbl_0 = { }
			for i = 1, 5 do
				_tbl_0[i] = i * i
			end
			squares = _tbl_0
		end
		assert.same(squares[1], 1)
		assert.same(squares[2], 4)
		assert.same(squares[3], 9)
		assert.same(squares[4], 16)
		return assert.same(squares[5], 25)
	end)
	it("should support nested comprehensions", function()
		local matrix = {
			{
				1,
				2
			},
			{
				3,
				4
			},
			{
				5,
				6
			}
		}
		local flat = { }
		for _index_0 = 1, #matrix do
			local row = matrix[_index_0]
			for i, v in ipairs(row) do
				flat[#flat + 1] = v
			end
		end
		return assert.same(flat, {
			1,
			2,
			3,
			4,
			5,
			6
		})
	end)
	it("should combine pairs and when", function()
		local data = {
			a = 1,
			b = 2,
			c = 3,
			d = 4
		}
		local greater_than_two
		do
			local _tbl_0 = { }
			for k, v in pairs(data) do
				if v > 2 then
					_tbl_0[k] = v
				end
			end
			greater_than_two = _tbl_0
		end
		assert.same(greater_than_two.a, nil)
		assert.same(greater_than_two.b, nil)
		assert.same(greater_than_two.c, 3)
		return assert.same(greater_than_two.d, 4)
	end)
	it("should work with string keys", function()
		local obj = {
			["key-with-dash"] = "value1",
			["key_with_underscore"] = "value2"
		}
		local result
		do
			local _tbl_0 = { }
			for k, v in pairs(obj) do
				_tbl_0[k] = v
			end
			result = _tbl_0
		end
		assert.same(result["key-with-dash"], "value1")
		return assert.same(result["key_with_underscore"], "value2")
	end)
	it("should handle empty source", function()
		local empty = { }
		local result
		do
			local _tbl_0 = { }
			for k, v in pairs(empty) do
				_tbl_0[k] = v
			end
			result = _tbl_0
		end
		return assert.same(#result, 0)
	end)
	it("should work with computed keys", function()
		local base = {
			a = 1,
			b = 2
		}
		local result
		do
			local _tbl_0 = { }
			for k, v in pairs(base) do
				_tbl_0[k .. "_suffix"] = v * 10
			end
			result = _tbl_0
		end
		assert.same(result.a_suffix, 10)
		return assert.same(result.b_suffix, 20)
	end)
	it("should support nested table transformation", function()
		local data = {
			first = {
				x = 1,
				y = 2
			},
			second = {
				x = 3,
				y = 4
			}
		}
		local transformed
		do
			local _tbl_0 = { }
			for k, v in pairs(data) do
				_tbl_0[k] = v.x + v.y
			end
			transformed = _tbl_0
		end
		assert.same(transformed.first, 3)
		return assert.same(transformed.second, 7)
	end)
	it("should filter with multiple conditions", function()
		local numbers = {
			a = 1,
			b = 2,
			c = 3,
			d = 4,
			e = 5
		}
		local result
		do
			local _tbl_0 = { }
			for k, v in pairs(numbers) do
				if v > 1 and v < 5 then
					_tbl_0[k] = v
				end
			end
			result = _tbl_0
		end
		assert.same(result.a, nil)
		assert.same(result.b, 2)
		assert.same(result.c, 3)
		assert.same(result.d, 4)
		return assert.same(result.e, nil)
	end)
	return it("should work with custom iterator", function()
		local custom_iter
		custom_iter = function()
			local state = 0
			return function()
				state = state + 1
				if state <= 3 then
					return state, state * 10
				else
					return nil
				end
			end
		end
		local result
		do
			local _tbl_0 = { }
			for k, v in custom_iter() do
				_tbl_0[k] = v
			end
			result = _tbl_0
		end
		assert.same(result[1], 10)
		assert.same(result[2], 20)
		return assert.same(result[3], 30)
	end)
end)
