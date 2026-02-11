return describe("with statement", function()
	it("should access properties with dot", function()
		local obj = {
			x = 10,
			y = 20
		}
		local result = nil
		do
			result = obj.x + obj.y
		end
		return assert.same(result, 30)
	end)
	it("should chain property access", function()
		local obj = {
			nested = {
				value = 42
			}
		}
		local result = nil
		do
			result = obj.nested.value
		end
		return assert.same(result, 42)
	end)
	it("should work with method calls", function()
		local obj = {
			value = 10,
			double = function(self)
				return self.value * 2
			end
		}
		local result = nil
		do
			result = obj:double()
		end
		return assert.same(result, 20)
	end)
	it("should handle nested with statements", function()
		local obj = {
			x = 1
		}
		obj.x = 10
		local _with_0 = {
			y = 2
		}
		obj.nested = _with_0
		_with_0.y = 20
		assert.same(obj.x, 10)
		return assert.same(obj.nested.y, 20)
	end)
	it("should work in expressions", function()
		local obj = {
			value = 5
		}
		local result
		repeat
			result = obj.value * 2
			break
		until true
		return assert.same(result, 10)
	end)
	it("should support multiple statements", function()
		local obj = {
			a = 1,
			b = 2
		}
		local sum = nil
		local product = nil
		do
			sum = obj.a + obj.b
			product = obj.a * obj.b
		end
		assert.same(sum, 3)
		return assert.same(product, 2)
	end)
	it("should work with table manipulation", function()
		local obj = {
			items = {
				1,
				2,
				3
			}
		}
		table.insert(obj.items, 4)
		return assert.same(#obj.items, 4)
	end)
	it("should handle conditional inside with", function()
		local obj = {
			value = 10
		}
		local result = nil
		if obj.value > 5 then
			result = "large"
		else
			result = "small"
		end
		return assert.same(result, "large")
	end)
	it("should work with loops", function()
		local obj = {
			items = {
				1,
				2,
				3
			}
		}
		local sum = nil
		do
			sum = 0
			local _list_0 = obj.items
			for _index_0 = 1, #_list_0 do
				local item = _list_0[_index_0]
				sum = sum + item
			end
		end
		return assert.same(sum, 6)
	end)
	it("should support with in assignment", function()
		local obj = {
			x = 5,
			y = 10
		}
		local result
		repeat
			result = obj.x + obj.y
			break
		until true
		return assert.same(result, 15)
	end)
	it("should work with string methods", function()
		local s = "hello"
		local result
		repeat
			result = s:upper()
			break
		until true
		return assert.same(result, "HELLO")
	end)
	it("should handle metatable access", function()
		local obj = setmetatable({
			value = 10
		}, {
			__index = {
				extra = 5
			}
		})
		local sum = nil
		do
			sum = obj.value + getmetatable(obj).__index.extra
		end
		return assert.same(sum, 15)
	end)
	it("should work in function", function()
		local fn
		fn = function()
			local obj = {
				x = 10
			}
			local _val_0
			repeat
				_val_0 = obj.x * 2
				break
			until true
			return _val_0
		end
		local result = fn()
		return assert.same(result, 20)
	end)
	it("should support with in return", function()
		local get_value
		get_value = function()
			local obj = {
				value = 42
			}
			local _val_0
			repeat
				_val_0 = obj.value
				break
			until true
			return _val_0
		end
		return assert.same(get_value(), 42)
	end)
	it("should work with existential operator", function()
		local obj = {
			value = 10
		}
		local result
		repeat
			local _exp_0 = obj.value
			if _exp_0 ~= nil then
				result = _exp_0
			else
				result = 0
			end
			break
		until true
		return assert.same(result, 10)
	end)
	it("should handle nil object safely", function()
		local result
		do
			local _with_0 = nil
			repeat
				if _with_0 ~= nil then
					result = _with_0.value
					break
				end
			until true
		end
		return assert.same(result, nil)
	end)
	it("should work with method chaining", function()
		local obj = {
			value = 5,
			add = function(self, n)
				self.value = self.value + n
			end,
			get = function(self)
				return self.value
			end
		}
		local result
		repeat
			obj:add(10)
			obj:add(5)
			result = obj:get()
			break
		until true
		return assert.same(result, 20)
	end)
	return it("should support nested property access", function()
		local obj = {
			level1 = {
				level2 = {
					level3 = "deep"
				}
			}
		}
		local result
		repeat
			result = obj.level1.level2.level3
			break
		until true
		return assert.same(result, "deep")
	end)
end)
