return describe("pipe", function()
	return it("pipes through functions", function()
		local f
		f = function(x)
			return x + 1
		end
		local g
		g = function(x)
			return x * 2
		end
		return assert.same((g(f(3))), 8)
	end)
end)
