return describe("advanced tables", function()
	it("should create table with implicit keys", function()
		local hair = "golden"
		local height = 200
		local person = {
			hair = hair,
			height = height,
			shoe_size = 40
		}
		assert.same(person.hair, "golden")
		return assert.same(person.height, 200)
	end)
	it("should work with computed keys", function()
		local t = {
			[1 + 2] = "hello",
			["key_" .. "suffix"] = "value"
		}
		assert.same(t[3], "hello")
		return assert.same(t["key_suffix"], "value")
	end)
	it("should support keyword keys", function()
		local tbl = {
			["do"] = "something",
			["end"] = "hunger",
			["function"] = "test"
		}
		assert.same(tbl["do"], "something")
		assert.same(tbl["end"], "hunger")
		return assert.same(tbl["function"], "test")
	end)
	it("should handle array syntax with mixed content", function()
		local tb = {
			1,
			2,
			3,
			name = "superman",
			4,
			5,
			6
		}
		assert.same(tb[1], 1)
		assert.same(tb.name, "superman")
		return assert.same(tb[4], 4)
	end)
	it("should work with single line table literals", function()
		local tb = {
			dance = "Tango",
			partner = "none"
		}
		assert.same(tb.dance, "Tango")
		return assert.same(tb.partner, "none")
	end)
	it("should support nested tables", function()
		local tb = {
			outer = {
				inner = {
					value = 42
				}
			}
		}
		return assert.same(tb.outer.inner.value, 42)
	end)
	it("should handle table without braces", function()
		local profile = {
			height = "4 feet",
			shoe_size = 13,
			favorite_foods = {
				"ice cream",
				"donuts"
			}
		}
		assert.same(profile.height, "4 feet")
		return assert.same(profile.shoe_size, 13)
	end)
	it("should work with colon syntax for keys", function()
		local t = {
			name = "Bill",
			age = 200,
			["favorite food"] = "rice"
		}
		assert.same(t.name, "Bill")
		return assert.same(t["favorite food"], "rice")
	end)
	it("should support implicit object in table", function()
		local tb = {
			name = "abc",
			values = {
				"a",
				"b",
				"c"
			}
		}
		return assert.same(tb.values, {
			"a",
			"b",
			"c"
		})
	end)
	it("should handle array only table", function()
		local some_values = {
			1,
			2,
			3,
			4
		}
		assert.same(some_values[1], 1)
		return assert.same(some_values[4], 4)
	end)
	it("should work with trailing comma", function()
		local list_with_one = {
			1
		}
		return assert.same(list_with_one[1], 1)
	end)
	it("should support table spreading", function()
		local a = {
			1,
			2,
			3,
			x = 1
		}
		local b = {
			4,
			5,
			y = 1
		}
		local merge
		do
			local _tab_0 = { }
			local _idx_0 = 1
			for _key_0, _value_0 in pairs(a) do
				if _idx_0 == _key_0 then
					_tab_0[#_tab_0 + 1] = _value_0
					_idx_0 = _idx_0 + 1
				else
					_tab_0[_key_0] = _value_0
				end
			end
			local _idx_1 = 1
			for _key_0, _value_0 in pairs(b) do
				if _idx_1 == _key_0 then
					_tab_0[#_tab_0 + 1] = _value_0
					_idx_1 = _idx_1 + 1
				else
					_tab_0[_key_0] = _value_0
				end
			end
			merge = _tab_0
		end
		assert.same(merge[1], 1)
		assert.same(merge[4], 4)
		assert.same(merge.x, 1)
		return assert.same(merge.y, 1)
	end)
	it("should handle mixed spread", function()
		local parts = {
			"shoulders",
			"knees"
		}
		local lyrics
		do
			local _tab_0 = {
				"head"
			}
			local _idx_0 = 1
			for _key_0, _value_0 in pairs(parts) do
				if _idx_0 == _key_0 then
					_tab_0[#_tab_0 + 1] = _value_0
					_idx_0 = _idx_0 + 1
				else
					_tab_0[_key_0] = _value_0
				end
			end
			_tab_0[#_tab_0 + 1] = "and"
			_tab_0[#_tab_0 + 1] = "toes"
			lyrics = _tab_0
		end
		return assert.same(lyrics, {
			"head",
			"shoulders",
			"knees",
			"and",
			"toes"
		})
	end)
	it("should work with metatable creation", function()
		local mt = { }
		local add
		add = function(self, right)
			return setmetatable({
				value = self.value + right.value
			}, mt)
		end
		mt.__add = add
		local a = setmetatable({
			value = 1
		}, mt)
		local b = {
			value = 2
		}
		setmetatable(b, mt)
		local c = a + b
		return assert.same(c.value, 3)
	end)
	it("should support metatable accessing", function()
		local tb = setmetatable({ }, {
			["value"] = 123
		})
		getmetatable(tb).__index = getmetatable(tb)
		return assert.same(tb.value, 123)
	end)
	it("should handle metatable destructuring", function()
		local tb = setmetatable({
			item = "test",
			new = function()
				return "created"
			end,
		}, {
			__close = function()
				return "closed"
			end
		})
		local item, new = tb.item, tb.new
		local close = getmetatable(tb).__close
		assert.same(item, "test")
		assert.same(new(), "created")
		return assert.same(close(), "closed")
	end)
	it("should work with string keys directly", function()
		local t = {
			["hello world"] = true,
			["test-key"] = "value"
		}
		assert.is_true(t["hello world"])
		return assert.same(t["test-key"], "value")
	end)
	it("should support number keys", function()
		local t = {
			[10] = "ten",
			[20] = "twenty"
		}
		assert.same(t[10], "ten")
		return assert.same(t[20], "twenty")
	end)
	it("should handle empty tables", function()
		local empty = { }
		return assert.same(#empty, 0)
	end)
	return it("should work with table literals in function calls", function()
		local fn
		fn = function(tb)
			return tb.x + tb.y
		end
		local result = fn({
			x = 10,
			y = 20
		})
		return assert.same(result, 30)
	end)
end)
