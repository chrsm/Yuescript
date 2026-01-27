return describe("table append", function()
	it("should append single value", function()
		local tab = { }
		tab[#tab + 1] = "Value"
		assert.same(tab[1], "Value")
		return assert.same(#tab, 1)
	end)
	it("should append multiple values", function()
		local tab = { }
		tab[#tab + 1] = 1
		tab[#tab + 1] = 2
		tab[#tab + 1] = 3
		return assert.same(tab, {
			1,
			2,
			3
		})
	end)
	it("should append with spread operator", function()
		local tbA = {
			1,
			2,
			3
		}
		local tbB = {
			4,
			5,
			6
		}
		local _len_0 = #tbA + 1
		for _index_0 = 1, #tbB do
			local _elm_0 = tbB[_index_0]
			tbA[_len_0], _len_0 = _elm_0, _len_0 + 1
		end
		return assert.same(tbA, {
			1,
			2,
			3,
			4,
			5,
			6
		})
	end)
	it("should append table with single element", function()
		local tab = {
			1,
			2
		}
		local tb2 = {
			3
		}
		tab[#tab + 1] = table.unpack(tb2)
		return assert.same(tab, {
			1,
			2,
			3
		})
	end)
	it("should append empty table", function()
		local tab = {
			1,
			2
		}
		local tb2 = { }
		local _len_0 = #tab + 1
		for _index_0 = 1, #tb2 do
			local _elm_0 = tb2[_index_0]
			tab[_len_0], _len_0 = _elm_0, _len_0 + 1
		end
		return assert.same(tab, {
			1,
			2
		})
	end)
	it("should append nil values", function()
		local tab = { }
		tab[#tab + 1] = nil
		tab[#tab + 1] = "value"
		assert.same(tab[1], nil)
		return assert.same(tab[2], "value")
	end)
	it("should work in loop", function()
		local tab = { }
		for i = 1, 3 do
			tab[#tab + 1] = i * 2
		end
		return assert.same(tab, {
			2,
			4,
			6
		})
	end)
	it("should append with expressions", function()
		local tab = { }
		local x = 10
		tab[#tab + 1] = x + 5
		return assert.same(tab[1], 15)
	end)
	it("should append mixed types", function()
		local tab = { }
		tab[#tab + 1] = "string"
		tab[#tab + 1] = 123
		tab[#tab + 1] = true
		tab[#tab + 1] = nil
		return assert.same(tab, {
			"string",
			123,
			true,
			nil
		})
	end)
	it("should append to table with existing elements", function()
		local tab = {
			1,
			2,
			3
		}
		tab[#tab + 1] = 4
		tab[#tab + 1] = 5
		return assert.same(tab, {
			1,
			2,
			3,
			4,
			5
		})
	end)
	it("should work with nested tables", function()
		local tab = { }
		tab[#tab + 1] = {
			a = 1,
			b = 2
		}
		tab[#tab + 1] = {
			3,
			4
		}
		assert.same(tab[1], {
			a = 1,
			b = 2
		})
		return assert.same(tab[2], {
			3,
			4
		})
	end)
	return it("should append function results", function()
		local fn
		fn = function()
			return 1, 2, 3
		end
		local tab = { }
		tab[#tab + 1] = fn()
		return assert.same(tab, {
			1,
			2,
			3
		})
	end)
end)
