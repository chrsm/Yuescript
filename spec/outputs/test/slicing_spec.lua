return describe("slicing", function()
	it("should slice array with basic syntax", function()
		local items = {
			1,
			2,
			3,
			4,
			5
		}
		local result
		do
			local _accum_0 = { }
			local _len_0 = 1
			for _index_0 = 1, 3 do
				local _item_0 = items[_index_0]
				_accum_0[_len_0] = _item_0
				_len_0 = _len_0 + 1
			end
			result = _accum_0
		end
		return assert.same(result, {
			1,
			2,
			3
		})
	end)
	it("should slice from beginning", function()
		local items = {
			1,
			2,
			3,
			4,
			5
		}
		local result
		do
			local _accum_0 = { }
			local _len_0 = 1
			local _max_0 = #items
			_max_0 = _max_0 < 0 and #items + _max_0 + 1 or _max_0
			for _index_0 = 1, _max_0 do
				local _item_0 = items[_index_0]
				_accum_0[_len_0] = _item_0
				_len_0 = _len_0 + 1
			end
			result = _accum_0
		end
		return assert.same(result, {
			1,
			2,
			3,
			4,
			5
		})
	end)
	it("should slice to end", function()
		local items = {
			1,
			2,
			3,
			4,
			5
		}
		local result
		do
			local _accum_0 = { }
			local _len_0 = 1
			for _index_0 = 3, 5 do
				local _item_0 = items[_index_0]
				_accum_0[_len_0] = _item_0
				_len_0 = _len_0 + 1
			end
			result = _accum_0
		end
		return assert.same(result, {
			3,
			4,
			5
		})
	end)
	it("should handle negative indices", function()
		local items = {
			1,
			2,
			3,
			4,
			5
		}
		local result
		do
			local _accum_0 = { }
			local _len_0 = 1
			local _min_0 = #items + -3 + 1
			local _max_0 = #items + -1 + 1
			for _index_0 = _min_0, _max_0 do
				local _item_0 = items[_index_0]
				_accum_0[_len_0] = _item_0
				_len_0 = _len_0 + 1
			end
			result = _accum_0
		end
		return assert.same(result, {
			3,
			4,
			5
		})
	end)
	it("should slice single element", function()
		local items = {
			1,
			2,
			3,
			4,
			5
		}
		local result
		do
			local _accum_0 = { }
			local _len_0 = 1
			for _index_0 = 2, 2 do
				local _item_0 = items[_index_0]
				_accum_0[_len_0] = _item_0
				_len_0 = _len_0 + 1
			end
			result = _accum_0
		end
		return assert.same(result, {
			2
		})
	end)
	it("should work with strings", function()
		local s = "hello"
		local result = s:sub(1, 3)
		return assert.same(result, "hel")
	end)
	it("should handle out of bounds", function()
		local items = {
			1,
			2,
			3
		}
		local result
		do
			local _accum_0 = { }
			local _len_0 = 1
			for _index_0 = 1, 10 do
				local _item_0 = items[_index_0]
				_accum_0[_len_0] = _item_0
				_len_0 = _len_0 + 1
			end
			result = _accum_0
		end
		return assert.same(result, {
			1,
			2,
			3
		})
	end)
	it("should create new table", function()
		local original = {
			1,
			2,
			3,
			4,
			5
		}
		local sliced
		do
			local _accum_0 = { }
			local _len_0 = 1
			for _index_0 = 2, 4 do
				local _item_0 = original[_index_0]
				_accum_0[_len_0] = _item_0
				_len_0 = _len_0 + 1
			end
			sliced = _accum_0
		end
		sliced[1] = 99
		return assert.same(original[2], 2)
	end)
	it("should work with nested arrays", function()
		local nested = {
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
		local result
		do
			local _accum_0 = { }
			local _len_0 = 1
			for _index_0 = 1, 2 do
				local _item_0 = nested[_index_0]
				_accum_0[_len_0] = _item_0
				_len_0 = _len_0 + 1
			end
			result = _accum_0
		end
		return assert.same(result, {
			{
				1,
				2
			},
			{
				3,
				4
			}
		})
	end)
	it("should slice with step simulation", function()
		local items = {
			1,
			2,
			3,
			4,
			5
		}
		local result
		do
			local _accum_0 = { }
			local _len_0 = 1
			for i = 1, #items, 2 do
				_accum_0[_len_0] = items[i]
				_len_0 = _len_0 + 1
			end
			result = _accum_0
		end
		return assert.same(result, {
			1,
			3,
			5
		})
	end)
	it("should handle empty slice range", function()
		local items = {
			1,
			2,
			3,
			4,
			5
		}
		local result
		do
			local _accum_0 = { }
			local _len_0 = 1
			for _index_0 = 6, 10 do
				local _item_0 = items[_index_0]
				_accum_0[_len_0] = _item_0
				_len_0 = _len_0 + 1
			end
			result = _accum_0
		end
		return assert.same(result, { })
	end)
	it("should work with reverse indexing", function()
		local items = {
			1,
			2,
			3,
			4,
			5
		}
		local last = items[#items]
		local second_last = items[#items - 1]
		assert.same(last, 5)
		return assert.same(second_last, 4)
	end)
	it("should support slice in assignment", function()
		local items = {
			1,
			2,
			3,
			4,
			5
		}
		local a, b, c
		do
			local _accum_0 = { }
			local _len_0 = 1
			local _list_0 = {
				1,
				2,
				3
			}
			for _index_0 = 1, #_list_0 do
				local i = _list_0[_index_0]
				_accum_0[_len_0] = items[i]
				_len_0 = _len_0 + 1
			end
			a, b, c = _accum_0[1], _accum_0[2], _accum_0[3]
		end
		assert.same(a, 1)
		assert.same(b, 2)
		return assert.same(c, 3)
	end)
	return it("should work with table comprehensions", function()
		local items = {
			1,
			2,
			3,
			4,
			5
		}
		local result
		do
			local _tbl_0 = { }
			for i = 2, 4 do
				_tbl_0[i] = items[i]
			end
			result = _tbl_0
		end
		assert.same(result[2], 2)
		assert.same(result[3], 3)
		return assert.same(result[4], 4)
	end)
end)
