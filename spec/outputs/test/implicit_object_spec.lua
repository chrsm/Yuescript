return describe("implicit object", function()
	it("should create list with asterisk", function()
		local list = {
			1,
			2,
			3
		}
		return assert.same(list, {
			1,
			2,
			3
		})
	end)
	it("should create list with dash", function()
		local items = {
			"a",
			"b",
			"c"
		}
		return assert.same(items, {
			"a",
			"b",
			"c"
		})
	end)
	it("should work with function call", function()
		local results = { }
		local fn = {
			1,
			2,
			3
		}
		for _index_0 = 1, #fn do
			local item = fn[_index_0]
			table.insert(results, item)
		end
		return assert.same(results, {
			1,
			2,
			3
		})
	end)
	it("should support nested implicit objects", function()
		local tb = {
			name = "test",
			values = {
				"a",
				"b",
				"c"
			},
			objects = {
				{
					name = "first",
					value = 1
				},
				{
					name = "second",
					value = 2
				}
			}
		}
		assert.same(tb.values, {
			"a",
			"b",
			"c"
		})
		assert.same(tb.objects[1].name, "first")
		return assert.same(tb.objects[2].value, 2)
	end)
	it("should work with return statement", function()
		local fn
		fn = function()
			return {
				1,
				2,
				3
			}
		end
		return assert.same(fn(), {
			1,
			2,
			3
		})
	end)
	it("should handle mixed content", function()
		local tb = {
			key = "value",
			items = {
				1,
				2
			},
			other = "data"
		}
		assert.same(tb.key, "value")
		assert.same(tb.items, {
			1,
			2
		})
		return assert.same(tb.other, "data")
	end)
	it("should work in assignment", function()
		local list = {
			"x",
			"y",
			"z"
		}
		return assert.same(list, {
			"x",
			"y",
			"z"
		})
	end)
	it("should support nested structures with asterisk", function()
		local tb = {
			1,
			2,
			nested = {
				3,
				4
			}
		}
		assert.same(tb[1], 1)
		assert.same(tb[2], 2)
		return assert.same(tb.nested, {
			3,
			4
		})
	end)
	it("should handle implicit object in tables", function()
		local tb = {
			name = "test",
			list = {
				1,
				2
			},
			value = 42
		}
		return assert.same(tb.list, {
			1,
			2
		})
	end)
	it("should work with expressions", function()
		local x = 10
		local list = {
			x + 1,
			x + 2,
			x + 3
		}
		return assert.same(list, {
			11,
			12,
			13
		})
	end)
	it("should support method calls in implicit object", function()
		local tb = {
			name = "test",
			items = {
				{
					name = "item1",
					getName = function(self)
						return self.name
					end
				},
				{
					name = "item2",
					getName = function(self)
						return self.name
					end
				}
			}
		}
		assert.same(tb.items[1]:getName(), "item1")
		return assert.same(tb.items[2]:getName(), "item2")
	end)
	it("should work with complex nested structures", function()
		local config = {
			database = {
				host = "localhost",
				ports = {
					8080,
					8081,
					8082
				}
			},
			servers = {
				{
					name = "server1",
					port = 8080
				},
				{
					name = "server2",
					port = 8081
				}
			}
		}
		assert.same(config.database.ports, {
			8080,
			8081,
			8082
		})
		return assert.same(config.servers[1].name, "server1")
	end)
	it("should handle empty implicit object", function()
		local tb = {
			items = {
				nil
			}
		}
		return assert.same(tb, {
			items = {
				nil
			}
		})
	end)
	it("should work in function arguments", function()
		local fn
		fn = function(items)
			return #items
		end
		local result = fn({
			1,
			2,
			3
		})
		return assert.same(result, 3)
	end)
	return it("should support mixed asterisk and dash", function()
		local tb = {
			values = {
				1,
				2,
				3
			}
		}
		return assert.same(tb.values, {
			1,
			2,
			3
		})
	end)
end)
