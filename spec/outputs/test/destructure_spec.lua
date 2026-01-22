return describe("destructure", function()
	return it("defaults and nested", function()
		local t = {
			a = 1,
			b = {
				c = 3
			},
			d = nil
		}
		local a, c, d, e = t.a, t.b.c, t.b.d, t.e
		if d == nil then
			d = 4
		end
		if e == nil then
			e = 5
		end
		return assert.same({
			a,
			c,
			d,
			e
		}, {
			1,
			3,
			4,
			5
		})
	end)
end)
