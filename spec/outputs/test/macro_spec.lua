return describe("macro", function()
	it("should define and call basic macro", function()
		local result = (5 * 2)
		return assert.same(result, 10)
	end)
	it("should maintain hygiene in macros", function()
		local a = 8
		local result = 2
		return assert.same(result, 2)
	end)
	it("should validate AST types", function()
		local result = {
			123,
			'xyz'
		}
		return assert.same(result, {
			123,
			'xyz'
		})
	end)
	it("should support simple code generation", function()
		local result = (10 + 1)
		return assert.same(result, 11)
	end)
	it("should support nested macro calls", function()
		local result = 7
		return assert.same(result, 7)
	end)
	it("should respect macro scope in do blocks", function()
		do
			local result = 'inner'
			assert.same(result, "inner")
		end
		local result = 'outer'
		return assert.same(result, "outer")
	end)
	it("should provide $LINE macro", function()
		local line_num = 42
		return assert.is_true(line_num > 0)
	end)
	it("should inject Lua code", function()
		local x = 0
		do
local function f(a)
				return a + 1
			end
			x = x + f(3)
		end
		return assert.same(x, 4)
	end)
	it("should work in conditional compilation", function()
		local result = "debug mode"
		return assert.same(result, "debug mode")
	end)
	it("should work with class system", function()
		local Thing
		do
			local _class_0
			local _base_0 = {
				value = 100,
				get_value = function(self)
					return self.value
				end
			}
			if _base_0.__index == nil then
				_base_0.__index = _base_0
			end
			_class_0 = setmetatable({
				__init = function() end,
				__base = _base_0,
				__name = "Thing"
			}, {
				__index = _base_0,
				__call = function(cls, ...)
					local _self_0 = setmetatable({ }, _base_0)
					cls.__init(_self_0, ...)
					return _self_0
				end
			})
			_base_0.__class = _class_0
			Thing = _class_0
		end
		local instance = Thing()
		return assert.same(instance:get_value(), 100)
	end)
	it("should handle macro in switch expressions", function()
		local result
		do
			local _exp_0 = "test"
			if "test" == _exp_0 then
				result = "matched"
			else
				result = "no match"
			end
		end
		return assert.same(result, "matched")
	end)
	it("should support macro in expression context", function()
		local result = 5 + (2 * 3)
		return assert.same(result, 11)
	end)
	it("should handle $is_ast for type checking", function()
		local result = 42
		return assert.same(result, 42)
	end)
	it("should work with string interpolation", function()
		local result = {
			["test"] = 123
		}
		return assert.same(result, {
			test = 123
		})
	end)
	it("should support function call syntax", function()
		local result = (5 + 10)
		return assert.same(result, 15)
	end)
	it("should handle empty macro return", function()
		local a = 1
		a = 2
		return assert.same(a, 2)
	end)
	it("should work with table literals", function()
		local point = {
			x = 10,
			y = 20
		}
		assert.same(point.x, 10)
		return assert.same(point.y, 20)
	end)
	it("should support conditional expressions in macro", function()
		local result = (5 + 1)
		return assert.same(result, 6)
	end)
	it("should work with comprehension", function()
		local result
		do
			local _accum_0 = { }
			local _len_0 = 1
			local _list_0 = {
				1,
				2,
				3
			}
			for _index_0 = 1, #_list_0 do
				local _ = _list_0[_index_0]
				_accum_0[_len_0] = _ * 2
				_len_0 = _len_0 + 1
			end
			result = _accum_0
		end
		return assert.same(result, {
			2,
			4,
			6
		})
	end)
	it("should support complex expression macros", function()
		local result = (1 + 2 * 3)
		return assert.same(result, 7)
	end)
	return it("should work with string literals", function()
		local result = ('Hello, ' .. "World")
		return assert.same(result, "Hello, World")
	end)
end)
