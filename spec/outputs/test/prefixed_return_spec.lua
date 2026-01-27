return describe("prefixed return", function()
	it("should return prefixed value with no explicit return", function()
		local findFirstEven
		findFirstEven = function(list)
			for _index_0 = 1, #list do
				local item = list[_index_0]
				if type(item) == "table" then
					for _index_1 = 1, #item do
						local sub = item[_index_1]
						if sub % 2 == 0 then
							return sub
						end
					end
				end
			end
			return nil
		end
		local result = findFirstEven({
			1,
			3,
			{
				4,
				6
			},
			5
		})
		return assert.same(result, 4)
	end)
	it("should return prefixed nil when not found", function()
		local findValue
		findValue = function(list)
			for _index_0 = 1, #list do
				local item = list[_index_0]
				if item == 999 then
					return item
				end
			end
			return nil
		end
		local result = findValue({
			1,
			2,
			3
		})
		return assert.same(result, nil)
	end)
	it("should return prefixed string", function()
		local findName
		findName = function(items)
			for _index_0 = 1, #items do
				local item = items[_index_0]
				if item.name == "target" then
					return item.name
				end
			end
			return "not found"
		end
		local result = findName({
			{
				name = "a"
			},
			{
				name = "b"
			}
		})
		return assert.same(result, "not found")
	end)
	it("should return prefixed number", function()
		local calculateSum
		calculateSum = function()
			local total = 0
			return 0
		end
		local result = calculateSum()
		return assert.same(result, 0)
	end)
	return it("should work with nested logic", function()
		local findNested
		findNested = function(data)
			for _index_0 = 1, #data do
				local category = data[_index_0]
				if type(category) == "table" then
					for _index_1 = 1, #category do
						local item = category[_index_1]
						if item == "target" then
							return "found"
						end
					end
				end
			end
			return "missing"
		end
		local result = findNested({
			{
				1,
				2
			},
			{
				"target",
				3
			}
		})
		return assert.same(result, "found")
	end)
end)
