return describe("goto", function()
	it("should support basic goto and label", function()
		local a = 0
		::start::
		a = a + 1
		if a < 5 then
			goto start
		end
		return assert.same(a, 5)
	end)
	it("should support conditional goto", function()
		local a = 0
		::loop::
		a = a + 1
		if a == 3 then
			goto done
		end
		goto loop
		::done::
		return assert.same(a, 3)
	end)
	it("should support goto in nested loops", function()
		local count = 0
		for x = 1, 3 do
			for y = 1, 3 do
				count = count + 1
				if x == 2 and y == 2 then
					goto found
				end
			end
		end
		::found::
		return assert.same(count, 5)
	end)
	it("should support multiple labels", function()
		local a = 0
		::first::
		a = a + 1
		if a == 2 then
			goto second
		end
		goto first
		::second::
		return assert.same(a, 2)
	end)
	it("should work with for loops", function()
		local sum = 0
		for i = 1, 10 do
			sum = sum + i
			if i == 5 then
				goto done
			end
		end
		::done::
		return assert.same(sum, 15)
	end)
	it("should work with while loops", function()
		local count = 0
		while true do
			count = count + 1
			if count == 3 then
				goto endwhile
			end
		end
		::endwhile::
		return assert.same(count, 3)
	end)
	it("should skip rest of loop with goto", function()
		local values = { }
		for i = 1, 5 do
			if i % 2 == 0 then
				goto continue
			end
			table.insert(values, i)
			::continue::
		end
		return assert.same(values, {
			1,
			3,
			5
		})
	end)
	return it("should support goto with switch", function()
		local result = "default"
		local value = 2
		if 1 == value then
			goto case_one
		elseif 2 == value then
			goto case_two
		end
		goto default_label
		::case_one::
		result = "one"
		goto finish
		::case_two::
		result = "two"
		goto finish
		::default_label::
		result = "default"
		::finish::
		return assert.same(result, "two")
	end)
end)
