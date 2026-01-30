return describe("continue statement", function()
	it("should skip odd numbers in for loop", function()
		local numbers = {
			1,
			2,
			3,
			4,
			5,
			6,
			7,
			8,
			9,
			10
		}
		local even
		do
			local _accum_0 = { }
			local _len_0 = 1
			for _index_0 = 1, #numbers do
				local n = numbers[_index_0]
				if n % 2 == 1 then
					goto _continue_0
				end
				_accum_0[_len_0] = n
				_len_0 = _len_0 + 1
				::_continue_0::
			end
			even = _accum_0
		end
		return assert.same(even, {
			2,
			4,
			6,
			8,
			10
		})
	end)
	it("should filter values in while loop", function()
		local i = 0
		local result = { }
		while i < 10 do
			i = i + 1
			if i % 3 == 0 then
				goto _continue_0
			end
			table.insert(result, i)
			::_continue_0::
		end
		return assert.same(result, {
			1,
			2,
			4,
			5,
			7,
			8,
			10
		})
	end)
	it("should skip with condition in loop expression", function()
		local items = {
			1,
			2,
			3,
			4,
			5
		}
		local odds
		do
			local _accum_0 = { }
			local _len_0 = 1
			for _index_0 = 1, #items do
				local item = items[_index_0]
				if item % 2 == 0 then
					goto _continue_0
				end
				_accum_0[_len_0] = item
				_len_0 = _len_0 + 1
				::_continue_0::
			end
			odds = _accum_0
		end
		return assert.same(odds, {
			1,
			3,
			5
		})
	end)
	return it("should work with nested loops", function()
		local result = { }
		for i = 1, 5 do
			for j = 1, 5 do
				if i == j then
					goto _continue_0
				end
				table.insert(result, {
					i,
					j
				})
				::_continue_0::
			end
		end
		return assert.same(#result, 20)
	end)
end)
