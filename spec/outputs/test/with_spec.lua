return describe("with", function()
	it("should access property with . syntax", function()
		local obj = {
			value = 42
		}
		local result = obj.value
		assert.same(result, 42)
		return obj
	end)
	it("should call method with : syntax", function()
		local obj = {
			func = function()
				return "result"
			end
		}
		local result = obj:func()
		assert.same(result, "result")
		return obj
	end)
	it("should work as statement", function()
		local obj = {
			x = 10,
			y = 20
		}
		obj.sum = obj.x + obj.y
		return assert.same(obj.sum, 30)
	end)
	it("should support nested with", function()
		local outer = {
			inner = {
				value = 100
			}
		}
		local _with_0 = outer.inner
		local result = _with_0.value
		assert.same(result, 100)
		return _with_0
	end)
	it("should work with? safely", function()
		local obj = {
			x = 5
		}
		local result = obj.x
		assert.same(result, 5)
		return obj
	end)
	it("should work with if inside with", function()
		local obj = {
			x = 10,
			y = 20
		}
		if obj.x > 5 then
			local result = obj.x + obj.y
			assert.same(result, 30)
		end
		return obj
	end)
	it("should work with switch inside with", function()
		local obj = {
			type = "add",
			a = 5,
			b = 3
		}
		local result
		do
			local _exp_0 = obj.type
			if "add" == _exp_0 then
				result = obj.a + obj.b
			else
				result = 0
			end
		end
		assert.same(result, 8)
		return obj
	end)
	it("should work with loop inside with", function()
		local obj = {
			items = {
				1,
				2,
				3
			}
		}
		local sum = 0
		local _list_0 = obj.items
		for _index_0 = 1, #_list_0 do
			local item = _list_0[_index_0]
			sum = sum + item
		end
		return assert.same(sum, 6)
	end)
	it("should work with destructure", function()
		local obj = {
			x = 1,
			y = 2,
			z = 3
		}
		local x, y, z = obj.x, obj.y, obj.z
		assert.same(x, 1)
		assert.same(y, 2)
		assert.same(z, 3)
		return obj
	end)
	it("should handle simple with body", function()
		local obj = {
			value = 42
		}
		obj.value2 = 100
		return assert.same(obj.value2, 100)
	end)
	it("should work with return inside", function()
		local obj = {
			value = 100
		}
		local fn
		fn = function()
			return obj.value
		end
		return assert.same(fn(), 100)
	end)
	it("should work with break inside", function()
		local sum = 0
		for i = 1, 5 do
			local obj = {
				value = i
			}
			if obj.value == 3 then
				break
			end
			sum = sum + obj.value
		end
		return assert.same(sum, 3)
	end)
	it("should chain property access", function()
		local obj = {
			a = {
				b = {
					c = 42
				}
			}
		}
		local _with_0 = obj.a.b
		local result = _with_0.c
		assert.same(result, 42)
		return _with_0
	end)
	it("should work with multiple statements", function()
		local obj = {
			x = 1,
			y = 2
		}
		local sum = 0
		do
			sum = sum + obj.x
			sum = sum + obj.y
		end
		return assert.same(sum, 3)
	end)
	return it("should preserve object reference", function()
		local obj = {
			value = 42
		}
		obj.value = 100
		return assert.same(obj.value, 100)
	end)
end)
