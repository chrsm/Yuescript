return describe("import", function() -- 1
	it("should import from table expression", function() -- 2
		local source = { -- 3
			hello = "world", -- 3
			foo = "bar" -- 3
		} -- 3
		local hello, foo = source.hello, source.foo -- 4
		assert.same(hello, "world") -- 5
		return assert.same(foo, "bar") -- 6
	end) -- 2
	it("should import with backslash escaping", function() -- 8
		local source = { -- 9
			x = 1, -- 9
			y = 2, -- 9
			z = 3 -- 9
		} -- 9
		local x, y, z = source.x, (function() -- 10
			local _base_0 = source -- 10
			local _fn_0 = _base_0.y -- 10
			return _fn_0 and function(...) -- 10
				return _fn_0(_base_0, ...) -- 10
			end -- 10
		end)(), source.z -- 10
		assert.same(x, 1) -- 11
		assert.same(y, 2) -- 12
		return assert.same(z, 3) -- 13
	end) -- 8
	it("should import from string module", function() -- 15
		local format -- 17
		do -- 17
			local _obj_0 = require("string") -- 17
			format = _obj_0.format -- 17
		end -- 17
		return assert.is_true(type(format) == "function") -- 18
	end) -- 15
	it("should import from table with dot path", function() -- 20
		local sub -- 22
		do -- 22
			local _obj_0 = require("string") -- 22
			sub = _obj_0.sub -- 22
		end -- 22
		local result = sub("hello", 1, 2) -- 23
		return assert.same(result, "he") -- 24
	end) -- 20
	it("should import multiple values with table destructuring", function() -- 26
		local source = { -- 27
			a = 1, -- 27
			b = 2, -- 27
			c = 3 -- 27
		} -- 27
		local a, b, c = source.a, source.b, source.c -- 28
		assert.same(a, 1) -- 29
		assert.same(b, 2) -- 30
		return assert.same(c, 3) -- 31
	end) -- 26
	it("should import with multi-line format", function() -- 33
		local source = { -- 34
			x = 1, -- 34
			y = 2, -- 34
			z = 3 -- 34
		} -- 34
		local x, y, z = source.x, source.y, source.z -- 35
		assert.same(x, 1) -- 36
		assert.same(y, 2) -- 37
		return assert.same(z, 3) -- 38
	end) -- 33
	it("should import using from syntax", function() -- 40
		local source = { -- 41
			foo = "bar", -- 41
			baz = "qux" -- 41
		} -- 41
		local foo, baz = source.foo, source.baz -- 42
		assert.same(foo, "bar") -- 43
		return assert.same(baz, "qux") -- 44
	end) -- 40
	it("should handle import with computed expressions", function() -- 46
		local source = { -- 47
			first = 1, -- 47
			second = 2 -- 47
		} -- 47
		local target = source -- 48
		local first, second = target.first, target.second -- 49
		assert.same(first, 1) -- 50
		return assert.same(second, 2) -- 51
	end) -- 46
	it("should import from nested table paths", function() -- 53
		local deep = { -- 54
			outer = { -- 54
				inner = "value" -- 54
			} -- 54
		} -- 54
		local outer = deep.outer -- 55
		return assert.same(outer.inner, "value") -- 56
	end) -- 53
	it("should support importing Lua standard library functions", function() -- 58
		local print, type -- 59
		do -- 59
			local _obj_0 = require("_G") -- 59
			print, type = _obj_0.print, _obj_0.type -- 59
		end -- 59
		assert.is_true(type(print) == "function") -- 60
		return assert.is_true(type(type) == "function") -- 61
	end) -- 58
	it("should handle empty import gracefully", function() -- 63
		local source = { } -- 65
		local dummy = source.dummy -- 66
		return assert.same(dummy, nil) -- 67
	end) -- 63
	it("should work with table index expressions", function() -- 69
		local source = { -- 70
			normal = "ok" -- 70
		} -- 70
		local normal = source.normal -- 71
		return assert.same(normal, "ok") -- 72
	end) -- 69
	it("should support chaining imports from same source", function() -- 74
		local source = { -- 75
			a = 1, -- 75
			b = 2, -- 75
			c = 3 -- 75
		} -- 75
		local a, b = source.a, source.b -- 76
		local c = source.c -- 77
		assert.same(a, 1) -- 78
		assert.same(b, 2) -- 79
		return assert.same(c, 3) -- 80
	end) -- 74
	it("should handle importing from table returned by function", function() -- 82
		local get_table -- 83
		get_table = function() -- 83
			return { -- 83
				x = 100, -- 83
				y = 200 -- 83
			} -- 83
		end -- 83
		local x, y -- 84
		do -- 84
			local _obj_0 = get_table() -- 84
			x, y = _obj_0.x, _obj_0.y -- 84
		end -- 84
		assert.same(x, 100) -- 85
		return assert.same(y, 200) -- 86
	end) -- 82
	it("should support from with multi-line import", function() -- 88
		local source = { -- 89
			item1 = 1, -- 89
			item2 = 2, -- 89
			item3 = 3 -- 89
		} -- 89
		local item1, item2, item3 = source.item1, source.item2, source.item3 -- 90
		assert.same(item1, 1) -- 91
		assert.same(item2, 2) -- 92
		return assert.same(item3, 3) -- 93
	end) -- 88
	it("should work with import from string literal", function() -- 95
		local char -- 96
		do -- 96
			local _obj_0 = require("string") -- 96
			char = _obj_0.char -- 96
		end -- 96
		return assert.same(char(65), "A") -- 97
	end) -- 95
	it("should support import with table literal keys", function() -- 99
		local source = { -- 100
			normal_key = "value2" -- 100
		} -- 100
		local normal_key = source.normal_key -- 101
		return assert.same(normal_key, "value2") -- 102
	end) -- 99
	it("should handle consecutive imports", function() -- 104
		local source1 = { -- 105
			a = 1 -- 105
		} -- 105
		local source2 = { -- 106
			b = 2 -- 106
		} -- 106
		local a = source1.a -- 107
		local b = source2.b -- 108
		assert.same(a, 1) -- 109
		return assert.same(b, 2) -- 110
	end) -- 104
	return it("should support importing from complex expressions", function() -- 112
		local get_source -- 113
		get_source = function() -- 113
			return { -- 113
				result = 42 -- 113
			} -- 113
		end -- 113
		local result -- 114
		do -- 114
			local _obj_0 = get_source() -- 114
			result = _obj_0.result -- 114
		end -- 114
		return assert.same(result, 42) -- 115
	end) -- 112
end) -- 1
