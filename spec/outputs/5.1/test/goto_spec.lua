return describe("goto", function() -- 1
	it("should support basic goto and label", function() -- 2
		local a = 0 -- 3
		::start:: -- 4
		a = a + 1 -- 5
		if a < 5 then -- 6
			goto start -- 7
		end -- 6
		return assert.same(a, 5) -- 8
	end) -- 2
	it("should support conditional goto", function() -- 10
		local a = 0 -- 11
		::loop:: -- 12
		a = a + 1 -- 13
		if a == 3 then -- 14
			goto done -- 14
		end -- 14
		goto loop -- 15
		::done:: -- 16
		return assert.same(a, 3) -- 17
	end) -- 10
	it("should support goto in nested loops", function() -- 19
		local count = 0 -- 20
		for x = 1, 3 do -- 21
			for y = 1, 3 do -- 22
				count = count + 1 -- 23
				if x == 2 and y == 2 then -- 24
					goto found -- 25
				end -- 24
			end -- 22
		end -- 21
		::found:: -- 26
		return assert.same(count, 4) -- 27
	end) -- 19
	it("should support multiple labels", function() -- 29
		local a = 0 -- 30
		::first:: -- 31
		a = a + 1 -- 32
		if a == 2 then -- 33
			goto second -- 33
		end -- 33
		goto first -- 34
		::second:: -- 35
		return assert.same(a, 2) -- 36
	end) -- 29
	it("should work with for loops", function() -- 38
		local sum = 0 -- 39
		for i = 1, 10 do -- 40
			sum = sum + i -- 41
			if i == 5 then -- 42
				goto done -- 42
			end -- 42
		end -- 40
		::done:: -- 43
		return assert.same(sum, 15) -- 44
	end) -- 38
	it("should work with while loops", function() -- 46
		local count = 0 -- 47
		while true do -- 48
			count = count + 1 -- 49
			if count == 3 then -- 50
				goto endwhile -- 50
			end -- 50
		end -- 48
		::endwhile:: -- 51
		return assert.same(count, 3) -- 52
	end) -- 46
	it("should skip rest of loop with goto", function() -- 54
		local values = { } -- 55
		for i = 1, 5 do -- 56
			if i % 2 == 0 then -- 57
				goto continue -- 57
			end -- 57
			table.insert(values, i) -- 58
			::continue:: -- 59
		end -- 56
		return assert.same(values, { -- 60
			1, -- 60
			3, -- 60
			5 -- 60
		}) -- 60
	end) -- 54
	return it("should support goto with switch", function() -- 62
		local result = "default" -- 63
		local value = 2 -- 64
		if 1 == value then -- 66
			goto case_one -- 67
		elseif 2 == value then -- 68
			goto case_two -- 69
		end -- 65
		goto default_label -- 70
		::case_one:: -- 71
		result = "one" -- 72
		goto finish -- 73
		::case_two:: -- 74
		result = "two" -- 75
		goto finish -- 76
		::default_label:: -- 77
		result = "default" -- 78
		::finish:: -- 79
		return assert.same(result, "two") -- 80
	end) -- 62
end) -- 1
