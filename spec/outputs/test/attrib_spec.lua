return describe("attrib", function()
	it("should support const attribute", function()
		do
			local x <const> = 10
			return assert.same(x, 10)
		end
	end)
	it("should support const with multiple variables", function()
		do
			local a <const>, b <const>, c <const> = 1, 2, 3
			assert.same(a, 1)
			assert.same(b, 2)
			return assert.same(c, 3)
		end
	end)
	it("should support close attribute", function()
		do
			local x <close> = setmetatable({ }, {
				__close = function() end
			})
			return assert.same("table", type(x))
		end
	end)
	it("should work with destructuring", function()
		do
			local a, b
			do
				local _obj_0 = {
					a = 1,
					b = 2
				}
				a, b = _obj_0.a, _obj_0.b
			end
			assert.same(a, 1)
			return assert.same(b, 2)
		end
	end)
	it("should work in conditional", function()
		do
			local flag = true
			local x
			if flag then
				x = 5
			end
			return assert.same(x, 5)
		end
	end)
	it("should work with switch", function()
		do
			local y
			do
				local _exp_0 = 2
				if 2 == _exp_0 then
					y = 100
				else
					y = 0
				end
			end
			return assert.same(y, 100)
		end
	end)
	it("should work with table literals", function()
		do
			local a, b
			do
				local _obj_0 = {
					1,
					2
				}
				a, b = _obj_0[1], _obj_0[2]
			end
			assert.same(a, 1)
			return assert.same(b, 2)
		end
	end)
	return it("should support close in expressions", function()
		do
			local result
			if true then
				result = setmetatable({
					value = 42,
				}, {
					__close = function() end
				})
			else
				result = setmetatable({
					value = 0,
				}, {
					__close = function() end
				})
			end
			local _close_0 <close> = result
			return assert.same(result.value, 42)
		end
	end)
end)
