return describe("backcall", function()
	it("should support basic backcall with <-", function()
		local results = { }
		local mock_map
		mock_map = function(list, fn)
			for _index_0 = 1, #list do
				local item = list[_index_0]
				table.insert(results, fn(item))
			end
		end
		do
			mock_map({
				1,
				2,
				3
			}, function(x)
				return x * 2
			end)
		end
		return assert.same(results, {
			2,
			4,
			6
		})
	end)
	it("should support nested backcalls", function()
		local results = { }
		local mock_map
		mock_map = function(list, fn)
			for _index_0 = 1, #list do
				local item = list[_index_0]
				fn(item)
			end
		end
		mock_map({
			1,
			2,
			3,
			4
		}, function(x)
			if x > 2 then
				return table.insert(results, x)
			end
		end)
		return assert.same(results, {
			3,
			4
		})
	end)
	return it("should work with method call backcall", function()
		local results = { }
		local obj = {
			process = function(self, fn)
				return fn(42)
			end
		}
		return obj:process(function(value)
			table.insert(results, value)
			return assert.same(results, {
				42
			})
		end)
	end)
end)
