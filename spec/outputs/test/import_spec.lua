return describe("import", function()
	it("should import from table expression", function()
		local source = {
			hello = "world",
			foo = "bar"
		}
		local hello, foo = source.hello, source.foo
		assert.same(hello, "world")
		return assert.same(foo, "bar")
	end)
	it("should import with backslash escaping", function()
		local source = {
			x = 1,
			y = function(self) end,
			z = 3
		}
		local x, y, z = source.x, (function()
			local _base_0 = source
			local _fn_0 = _base_0.y
			return _fn_0 and function(...)
				return _fn_0(_base_0, ...)
			end
		end)(), source.z
		assert.same(x, 1)
		assert.same("function", type(y))
		return assert.same(z, 3)
	end)
	it("should import from string module", function()
		local format
		do
			local _obj_0 = require("string")
			format = _obj_0.format
		end
		return assert.is_true(type(format) == "function")
	end)
	it("should import from table with dot path", function()
		local sub
		do
			local _obj_0 = require("string")
			sub = _obj_0.sub
		end
		local result = sub("hello", 1, 2)
		return assert.same(result, "he")
	end)
	it("should import multiple values with table destructuring", function()
		local source = {
			a = 1,
			b = 2,
			c = 3
		}
		local a, b, c = source.a, source.b, source.c
		assert.same(a, 1)
		assert.same(b, 2)
		return assert.same(c, 3)
	end)
	it("should import with multi-line format", function()
		local source = {
			x = 1,
			y = 2,
			z = 3
		}
		local x, y, z = source.x, source.y, source.z
		assert.same(x, 1)
		assert.same(y, 2)
		return assert.same(z, 3)
	end)
	it("should import using from syntax", function()
		local source = {
			foo = "bar",
			baz = "qux"
		}
		local foo, baz = source.foo, source.baz
		assert.same(foo, "bar")
		return assert.same(baz, "qux")
	end)
	it("should handle import with computed expressions", function()
		local source = {
			first = 1,
			second = 2
		}
		local target = source
		local first, second = target.first, target.second
		assert.same(first, 1)
		return assert.same(second, 2)
	end)
	it("should import from nested table paths", function()
		local deep = {
			outer = {
				inner = "value"
			}
		}
		local outer = deep.outer
		return assert.same(outer.inner, "value")
	end)
	it("should support importing Lua standard library functions", function()
		local print, type
		do
			local _obj_0 = require("_G")
			print, type = _obj_0.print, _obj_0.type
		end
		assert.is_true(type(print) == "function")
		return assert.is_true(type(type) == "function")
	end)
	it("should handle empty import gracefully", function()
		local source = { }
		local dummy = source.dummy
		return assert.same(dummy, nil)
	end)
	it("should work with table index expressions", function()
		local source = {
			normal = "ok"
		}
		local normal = source.normal
		return assert.same(normal, "ok")
	end)
	it("should support chaining imports from same source", function()
		local source = {
			a = 1,
			b = 2,
			c = 3
		}
		local a, b = source.a, source.b
		local c = source.c
		assert.same(a, 1)
		assert.same(b, 2)
		return assert.same(c, 3)
	end)
	it("should handle importing from table returned by function", function()
		local get_table
		get_table = function()
			return {
				x = 100,
				y = 200
			}
		end
		local x, y
		do
			local _obj_0 = get_table()
			x, y = _obj_0.x, _obj_0.y
		end
		assert.same(x, 100)
		return assert.same(y, 200)
	end)
	it("should support from with multi-line import", function()
		local source = {
			item1 = 1,
			item2 = 2,
			item3 = 3
		}
		local item1, item2, item3 = source.item1, source.item2, source.item3
		assert.same(item1, 1)
		assert.same(item2, 2)
		return assert.same(item3, 3)
	end)
	it("should work with import from string literal", function()
		local char
		do
			local _obj_0 = require("string")
			char = _obj_0.char
		end
		return assert.same(char(65), "A")
	end)
	it("should support import with table literal keys", function()
		local source = {
			normal_key = "value2"
		}
		local normal_key = source.normal_key
		return assert.same(normal_key, "value2")
	end)
	it("should handle consecutive imports", function()
		local source1 = {
			a = 1
		}
		local source2 = {
			b = 2
		}
		local a = source1.a
		local b = source2.b
		assert.same(a, 1)
		return assert.same(b, 2)
	end)
	return it("should support importing from complex expressions", function()
		local get_source
		get_source = function()
			return {
				result = 42
			}
		end
		local result
		do
			local _obj_0 = get_source()
			result = _obj_0.result
		end
		return assert.same(result, 42)
	end)
end)
