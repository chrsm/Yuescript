return describe("export import interactions", function()
	return it("should import with alias and destructuring", function()
		local source = {
			origin = {
				x = 10,
				y = 20
			},
			target = "result",
			point = {
				x = 5,
				y = 15
			}
		}
		local x, y
		do
			local _obj_0 = source.origin
			x, y = _obj_0.x, _obj_0.y
		end
		local target = source.target
		local px, py
		do
			local x, y
			do
				local _obj_0 = source.point
				x, y = _obj_0.x, _obj_0.y
			end
			px, py = x, y
		end
		assert.same(x, 10)
		assert.same(y, 20)
		assert.same(target, "result")
		assert.same(px, 5)
		return assert.same(py, 15)
	end)
end)
