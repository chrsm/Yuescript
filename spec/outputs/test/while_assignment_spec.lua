return describe("while assignment", function()
	it("should loop while value is truthy", function()
		local counter = 0
		local get_next
		get_next = function()
			if counter < 3 then
				counter = counter + 1
				return counter
			else
				return nil
			end
		end
		local results = { }
		repeat
			local val = get_next()
			if val then
				table.insert(results, val)
			else
				break
			end
		until false
		return assert.same(results, {
			1,
			2,
			3
		})
	end)
	it("should work with function results", function()
		local counter = 0
		local fn
		fn = function()
			counter = counter + 1
			if counter <= 3 then
				return counter * 10
			else
				return nil
			end
		end
		local sum = 0
		repeat
			local val = fn()
			if val then
				sum = sum + val
			else
				break
			end
		until false
		return assert.same(sum, 60)
	end)
	it("should exit immediately on nil", function()
		local get_val
		get_val = function()
			return nil
		end
		local counter = 0
		repeat
			local val = get_val()
			if val then
				counter = counter + 1
			else
				break
			end
		until false
		return assert.same(counter, 0)
	end)
	return it("should support break in loop", function()
		local items = {
			1,
			2,
			3,
			4,
			5
		}
		local sum = 0
		for _index_0 = 1, #items do
			local item = items[_index_0]
			sum = sum + item
			if sum > 6 then
				break
			end
		end
		return assert.same(sum, 10)
	end)
end)
