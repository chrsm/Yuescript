return describe("reverse index", function()
	it("should get last element", function()
		local data = {
			items = {
				1,
				2,
				3,
				4,
				5
			}
		}
		local last
		do
			local _item_0 = data.items
			last = _item_0[#_item_0]
		end
		return assert.same(last, 5)
	end)
	it("should get second last element", function()
		local data = {
			items = {
				1,
				2,
				3,
				4,
				5
			}
		}
		local second_last
		do
			local _item_0 = data.items
			second_last = _item_0[#_item_0 - 1]
		end
		return assert.same(second_last, 4)
	end)
	it("should get third last element", function()
		local data = {
			items = {
				1,
				2,
				3,
				4,
				5
			}
		}
		local third_last
		do
			local _item_0 = data.items
			third_last = _item_0[#_item_0 - 2]
		end
		return assert.same(third_last, 3)
	end)
	it("should set last element", function()
		local data = {
			items = {
				1,
				2,
				3,
				4,
				5
			}
		}
		local _obj_0 = data.items
		_obj_0[#_obj_0] = 10
		return assert.same(data.items[5], 10)
	end)
	it("should set second last element", function()
		local data = {
			items = {
				1,
				2,
				3,
				4,
				5
			}
		}
		local _obj_0 = data.items
		_obj_0[#_obj_0 - 1] = 20
		return assert.same(data.items[4], 20)
	end)
	it("should work with single element", function()
		local tab = {
			42
		}
		return assert.same(tab[#tab], 42)
	end)
	it("should work with empty table", function()
		local tab = { }
		return assert.same(tab[#tab], nil)
	end)
	it("should work in expressions", function()
		local tab = {
			1,
			2,
			3,
			4,
			5
		}
		local result = tab[#tab] + tab[#tab - 1]
		return assert.same(result, 9)
	end)
	it("should support chaining", function()
		local data = {
			items = {
				nested = {
					1,
					2,
					3
				}
			}
		}
		local last
		do
			local _item_0 = data.items.nested
			last = _item_0[#_item_0]
		end
		return assert.same(last, 3)
	end)
	it("should handle negative offsets", function()
		local tab = {
			1,
			2,
			3,
			4,
			5
		}
		assert.same(tab[#tab - 3], 2)
		return assert.same(tab[#tab - 4], 1)
	end)
	return it("should work in loops", function()
		local tab = {
			1,
			2,
			3,
			4,
			5
		}
		local results = { }
		for i = 0, 2 do
			table.insert(results, tab[#tab - i])
		end
		return assert.same(results, {
			5,
			4,
			3
		})
	end)
end)
