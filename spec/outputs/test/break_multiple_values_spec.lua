local _anon_func_0 = function(_with_0)
	local _with_1 = nil
	local _val_0
	repeat
		if _with_1 ~= nil then
			_val_0 = _with_1.value
			break
		end
	until true
	return _val_0
end
local _anon_func_1 = function()
	local _val_0, _val_1
	for i = 1, 10 do
		if i == 5 then
			_val_0, _val_1 = i, i * 10
			break
		end
	end
	return _val_0, _val_1
end
local _anon_func_2 = function()
	local _val_0, _val_1
	for i = 1, 5 do
		if i == 3 then
			_val_0, _val_1 = i, i * 10
			break
		end
	end
	return _val_0, _val_1
end
local _anon_func_3 = function(self)
	local _val_0, _val_1
	for i = 1, 10 do
		if i == 4 then
			_val_0, _val_1 = self.start + i, self.end_val + i
			break
		end
	end
	return _val_0, _val_1
end
local _anon_func_4 = function()
	local _val_0, _val_1
	for i = 1, 5 do
		do
			if i == 3 then
				_val_0, _val_1 = i, i * 2
				break
			end
		end
	end
	return _val_0, _val_1
end
return describe("break with multiple values", function()
	it("should break with multiple values from numeric for loop", function()
		local x, y
		for i = 1, 10 do
			if i > 5 then
				x, y = i, i * 2
				break
			end
		end
		assert.same(x, 6)
		return assert.same(y, 12)
	end)
	it("should break with multiple values from ipairs iterator", function()
		local x, y
		for _, v in ipairs({
			1,
			2,
			3
		}) do
			if v > 2 then
				x, y = v, v * 2
				break
			end
		end
		assert.same(x, 3)
		return assert.same(y, 6)
	end)
	it("should break with multiple values from destructuring iterator", function()
		local x, y
		local _list_0 = {
			{
				10,
				20
			},
			{
				30,
				40
			},
			{
				40,
				50
			}
		}
		for _index_0 = 1, #_list_0 do
			local _des_0 = _list_0[_index_0]
			local a, b = _des_0[1], _des_0[2]
			if b > 20 then
				x, y = a, b * 2
				break
			end
		end
		assert.same(x, 30)
		return assert.same(y, 80)
	end)
	it("should break with multiple values from do block", function()
		local x, y
		do
			repeat
				x, y = 1, 2
				break
			until true
		end
		assert.same(x, 1)
		return assert.same(y, 2)
	end)
	it("should break with multiple values from with statement", function()
		local x
		do
			local _with_0 = {
				abc = 99,
				flag = true
			}
			repeat
				if _with_0.flag then
					x = _with_0.abc
					break
				end
				x = 0
				break
			until true
		end
		return assert.same(x, 99)
	end)
	it("should work with continue in comprehension", function()
		local input = {
			1,
			2,
			3,
			4,
			5,
			6
		}
		local output
		do
			local _accum_0 = { }
			local _len_0 = 1
			for _index_0 = 1, #input do
				local x = input[_index_0]
				if x % 2 == 1 then
					goto _continue_0
				end
				_accum_0[_len_0] = x
				_len_0 = _len_0 + 1
				::_continue_0::
			end
			output = _accum_0
		end
		return assert.same(output, {
			2,
			4,
			6
		})
	end)
	it("should break in comprehension with index", function()
		local f1
		f1 = function()
			local tb = {
				true,
				true,
				false
			}
			local index
			for i = 1, #tb do
				if tb[i] then
					index = i
					break
				end
			end
			return index
		end
		return assert.same(f1(), 1)
	end)
	it("should work with continue in indexed comprehension", function()
		local input = {
			1,
			2,
			3,
			4,
			5,
			6
		}
		local output
		do
			local _accum_0 = { }
			local _len_0 = 1
			for i = 1, #input do
				local x = input[i]
				if x % 2 == 1 then
					goto _continue_0
				end
				_accum_0[_len_0] = x
				_len_0 = _len_0 + 1
				::_continue_0::
			end
			output = _accum_0
		end
		return assert.same(output, {
			2,
			4,
			6
		})
	end)
	it("should break with multiple values in simple for loop", function()
		local a, b
		for i = 1, 5 do
			if i == 2 then
				a, b = i, i * 10
				break
			end
		end
		assert.same(a, 2)
		return assert.same(b, 20)
	end)
	it("should break with expression values", function()
		local sum, product
		for i = 1, 3 do
			if i == 2 then
				sum, product = i + i, i * i
				break
			end
		end
		assert.same(sum, 4)
		return assert.same(product, 4)
	end)
	it("should break with table iteration values", function()
		local key, value
		for k, v in pairs({
			a = 1,
			b = 2,
			c = 3
		}) do
			if k == "b" then
				key, value = k, v * 10
				break
			end
		end
		assert.same(key, "b")
		return assert.same(value, 20)
	end)
	it("should break in for loop with multiple values", function()
		local count, total
		for i = 1, 10 do
			if i == 5 then
				count, total = i, i * 10
				break
			end
		end
		assert.same(count, 5)
		return assert.same(total, 50)
	end)
	it("should break in repeat loop with multiple values", function()
		local i = 1
		local doubled
		do
			local _val_0, _val_1
			repeat
				if i > 3 then
					_val_0, _val_1 = i, i * 100
					break
				end
				i = i + 1
			until false
			i, doubled = _val_0, _val_1
		end
		assert.same(i, 4)
		return assert.same(doubled, 400)
	end)
	it("should work with with? and break", function()
		local dummy
		dummy = function(x)
			return x
		end
		local result
		do
			local _with_0 = {
				value = 1
			}
			repeat
				if _with_0 ~= nil then
					dummy(_anon_func_0(_with_0))
					result = _with_0.value
					break
				end
			until true
		end
		return assert.same(result, 1)
	end)
	it("should break with multiple values in do block", function()
		local x, y
		do
			repeat
				x, y = 10, 30
				break
			until true
		end
		assert.same(x, 10)
		return assert.same(y, 30)
	end)
	it("should break with string and number values", function()
		local name, age
		for k, v in pairs({
			name = "Alice",
			age = 30,
			city = "NYC"
		}) do
			if k == "name" then
				name, age = v, 25
				break
			end
		end
		assert.same(name, "Alice")
		return assert.same(age, 25)
	end)
	it("should break with nil values", function()
		local a, b, c
		for i = 1, 5 do
			if i == 3 then
				a, b, c = i, nil, "test"
				break
			end
		end
		assert.same(a, 3)
		assert.same(b, nil)
		return assert.same(c, "test")
	end)
	it("should break with boolean values", function()
		local found, value
		for i = 1, 5 do
			if i == 3 then
				found, value = true, "found"
				break
			end
		end
		assert.is_true(found)
		return assert.same(value, "found")
	end)
	it("should break with function call values", function()
		local fn
		fn = function()
			return 42
		end
		local val, dbl
		for i = 1, 3 do
			if i == 2 then
				val, dbl = fn(), fn() * 2
				break
			end
		end
		assert.same(val, 42)
		return assert.same(dbl, 84)
	end)
	it("should break with multiple values for destructuring", function()
		local x, y
		local _list_0 = {
			{
				1,
				2
			},
			{
				3,
				4
			},
			{
				5,
				6
			}
		}
		for _index_0 = 1, #_list_0 do
			local _des_0 = _list_0[_index_0]
			local a, b = _des_0[1], _des_0[2]
			if a > 2 then
				x, y = b, a
				break
			end
		end
		assert.same(x, 4)
		return assert.same(y, 3)
	end)
	it("should break in switch-like logic", function()
		local status, message
		for i = 1, 3 do
			do
				if i == 1 then
					status, message = "ok", "one"
					break
				end
				if i == 2 then
					status, message = "ok", "two"
					break
				end
			end
		end
		assert.same(status, "ok")
		return assert.same(message, "one")
	end)
	it("should handle multiple break conditions", function()
		local idx, val
		for i = 1, 10 do
			if i == 3 then
				idx, val = i, "first"
				break
			end
			if i == 7 then
				idx, val = i, "second"
				break
			end
		end
		assert.same(idx, 3)
		return assert.same(val, "first")
	end)
	it("should break with computed values", function()
		local sum, count
		for i = 1, 5 do
			if i == 4 then
				sum, count = 10 + i, i
				break
			end
		end
		assert.same(sum, 14)
		return assert.same(count, 4)
	end)
	it("should break with table literal", function()
		local name, data
		for i = 1, 3 do
			if i == 2 then
				name, data = "item", {
					value = i,
					index = i
				}
				break
			end
		end
		assert.same(name, "item")
		assert.same(data.value, 2)
		return assert.same(data.index, 2)
	end)
	it("should break with string concatenation", function()
		local prefix, suffix
		for i = 1, 3 do
			if i == 2 then
				prefix, suffix = "pre", "fix"
				break
			end
		end
		return assert.same(prefix .. suffix, "prefix")
	end)
	it("should break with continue in loop", function()
		local x, y
		for i = 1, 5 do
			if i == 3 then
				x, y = i, i * 2
				break
			end
		end
		assert.same(x, 3)
		return assert.same(y, 6)
	end)
	it("should break with ternary-like expression", function()
		local result, is_valid
		for i = 1, 5 do
			if i == 3 then
				result, is_valid = i, i > 2
				break
			end
		end
		assert.same(result, 3)
		return assert.is_true(is_valid)
	end)
	it("should break with arithmetic operations", function()
		local sum, diff
		for i = 1, 5 do
			if i == 3 then
				sum, diff = i + 10, 10 - i
				break
			end
		end
		assert.same(sum, 13)
		return assert.same(diff, 7)
	end)
	it("should break with table access", function()
		local data = {
			a = 1,
			b = 2
		}
		local first, second
		for i = 1, 3 do
			if i == 2 then
				first, second = data.a, data.b
				break
			end
		end
		assert.same(first, 1)
		return assert.same(second, 2)
	end)
	it("should break with literal values", function()
		local a, b
		for i = 1, 3 do
			if i == 2 then
				a, b = "x", "y"
				break
			end
		end
		assert.same(a, "x")
		return assert.same(b, "y")
	end)
	it("should break with conditional expression", function()
		local status, msg
		for i = 1, 5 do
			if i == 3 then
				status, msg = "ok", "done"
				break
			end
		end
		assert.same(status, "ok")
		return assert.same(msg, "done")
	end)
	it("should handle multiple breaks in sequence", function()
		local val1, val2
		for i = 1, 10 do
			if i == 3 then
				val1, val2 = i, i * 2
				break
			end
			if i == 5 then
				val1, val2 = i, i * 3
				break
			end
			if i == 7 then
				val1, val2 = i, i * 4
				break
			end
		end
		assert.same(val1, 3)
		return assert.same(val2, 6)
	end)
	it("should handle multiple breaks in switch", function()
		local val1, val2
		for i = 1, 10 do
			if 3 == i then
				val1, val2 = i, i * 2
				break
			elseif 5 == i then
				val1, val2 = i, i * 3
				break
			elseif 7 == i then
				val1, val2 = i, i * 4
				break
			end
		end
		assert.same(val1, 3)
		return assert.same(val2, 6)
	end)
	it("should break with nil and default", function()
		local a, b
		for i = 1, 5 do
			if i == 2 then
				a, b = i, nil
				break
			end
		end
		assert.same(a, 2)
		return assert.is_nil(b)
	end)
	it("should break with false and value", function()
		local found, data
		for i = 1, 5 do
			if i == 3 then
				found, data = false, "item"
				break
			end
		end
		assert.is_false(found)
		return assert.same(data, "item")
	end)
	it("should break with three values", function()
		local a, b, c
		for i = 1, 5 do
			if i == 3 then
				a, b, c = i, i * 2, i * 3
				break
			end
		end
		assert.same(a, 3)
		assert.same(b, 6)
		return assert.same(c, 9)
	end)
	it("should break in while loop", function()
		local i = 1
		local count, total
		do
			local _val_0, _val_1
			while i < 10 do
				if i == 5 then
					_val_0, _val_1 = i, i * 10
					break
				end
				i = i + 1
			end
			count, total = _val_0, _val_1
		end
		assert.same(count, 5)
		return assert.same(total, 50)
	end)
	it("should handle early break in loop", function()
		local a, b
		for i = 1, 100 do
			if i == 1 then
				a, b = "first", "second"
				break
			end
		end
		assert.same(a, "first")
		return assert.same(b, "second")
	end)
	it("should break with multiple function calls", function()
		local add
		add = function(a, b)
			return a + b
		end
		local mul
		mul = function(a, b)
			return a * b
		end
		local sum, product
		for i = 1, 5 do
			if i == 3 then
				sum, product = add(i, i), mul(i, i)
				break
			end
		end
		assert.same(sum, 6)
		return assert.same(product, 9)
	end)
	it("should work with chained comparisons", function()
		local x, y
		for i = 1, 10 do
			if 3 < i and i < 7 then
				x, y = i, i * i
				break
			end
		end
		assert.same(x, 4)
		return assert.same(y, 16)
	end)
	it("should work with logical expressions", function()
		local flag, value
		for i = 1, 5 do
			if i > 2 and i < 4 then
				flag, value = true, i
				break
			end
		end
		assert.is_true(flag)
		return assert.same(value, 3)
	end)
	it("should work with table unpacking in break", function()
		local tbl = {
			10,
			20
		}
		local a, b
		for i = 1, 5 do
			if i == 3 then
				a, b = tbl[1], tbl[2]
				break
			end
		end
		assert.same(a, 10)
		return assert.same(b, 20)
	end)
	it("should work with nested conditions", function()
		local result, flag
		for i = 1, 10 do
			if i > 2 then
				if i < 5 then
					if i == 3 then
						result, flag = i, true
						break
					end
				end
			end
		end
		assert.same(result, 3)
		return assert.is_true(flag)
	end)
	it("should work with class methods", function()
		local MyClass
		do
			local _class_0
			local _base_0 = {
				find_pair = function(self)
					local result = {
						_anon_func_1()
					}
					return result
				end
			}
			if _base_0.__index == nil then
				_base_0.__index = _base_0
			end
			_class_0 = setmetatable({
				__init = function() end,
				__base = _base_0,
				__name = "MyClass"
			}, {
				__index = _base_0,
				__call = function(cls, ...)
					local _self_0 = setmetatable({ }, _base_0)
					cls.__init(_self_0, ...)
					return _self_0
				end
			})
			_base_0.__class = _class_0
			MyClass = _class_0
		end
		local obj = MyClass()
		local result = obj:find_pair()
		assert.same(result[1], 5)
		return assert.same(result[2], 50)
	end)
	it("should work with string interpolation", function()
		local a, b
		for i = 1, 5 do
			if i == 3 then
				a, b = "item-" .. tostring(i), "value-" .. tostring(i * 10)
				break
			end
		end
		assert.same(a, "item-3")
		return assert.same(b, "value-30")
	end)
	it("should work with try-catch", function()
		return xpcall(function()
			local result, error_msg
			for i = 1, 5 do
				if i == 3 then
					result, error_msg = i, "found"
					break
				end
			end
			assert.same(result, 3)
			return assert.same(error_msg, "found")
		end, function(e)
			return error("Should not reach here")
		end)
	end)
	it("should work with const attribute", function()
		local MAX <const> = 10
		local first, second
		for i = 1, MAX do
			if i == 5 then
				first, second = i, i * 2
				break
			end
		end
		assert.same(first, 5)
		return assert.same(second, 10)
	end)
	it("should work with backcall style processing", function()
		local a, b
		for i = 1, 5 do
			if i == 3 then
				a, b = i, i * 2
				break
			end
		end
		assert.same(a, 3)
		return assert.same(b, 6)
	end)
	it("should work with varargs", function()
		local process
		process = function(...)
			local items = {
				...
			}
			local a, b
			for i = 1, #items do
				if items[i] == 3 then
					a, b = items[i], items[i] * 2
					break
				end
			end
			return a, b
		end
		local result1, result2 = process(1, 2, 3, 4, 5)
		assert.same(result1, 3)
		return assert.same(result2, 6)
	end)
	it("should work with table slicing", function()
		local matrix = {
			{
				1,
				2,
				3
			},
			{
				4,
				5,
				6
			},
			{
				7,
				8,
				9
			}
		}
		local sub, val
		for i = 1, #matrix do
			if matrix[i][1] == 4 then
				sub, val = matrix[i][1], matrix[i][2]
				break
			end
		end
		assert.same(sub, 4)
		return assert.same(val, 5)
	end)
	it("should work with chaining comparison", function()
		local result, flag
		for i = 1, 10 do
			if 1 < i and i <= 5 and 5 < 10 then
				result, flag = i, i * i
				break
			end
		end
		assert.same(result, 2)
		return assert.same(flag, 4)
	end)
	it("should work with implicit return", function()
		local fn
		fn = function()
			local result = {
				_anon_func_2()
			}
			return result
		end
		local result = fn()
		assert.same(result[1], 3)
		return assert.same(result[2], 30)
	end)
	it("should work with nil coalescing", function()
		local data = nil
		local first, second
		for i = 1, 5 do
			if i == 3 then
				first, second = i, i * 2
				break
			end
		end
		assert.same(first, 3)
		return assert.same(second, 6)
	end)
	it("should work with table literal shorthand", function()
		local a, b
		for i = 1, 5 do
			if i == 2 then
				a, b = "first", "second"
				break
			end
		end
		assert.same(a, "first")
		return assert.same(b, "second")
	end)
	it("should work with method calls", function()
		local obj = {
			start = 10,
			end_val = 20,
			find = function(self)
				local result = {
					_anon_func_3(self)
				}
				return result
			end
		}
		local result = obj:find()
		assert.same(result[1], 14)
		return assert.same(result[2], 24)
	end)
	it("should work with do-end assignment", function()
		local a, b
		do
			local x, y
			for i = 1, 5 do
				if i == 2 then
					x, y = i, i * 5
					break
				end
			end
			a, b = x, y
		end
		assert.same(a, 2)
		return assert.same(b, 10)
	end)
	it("should work with unary operators", function()
		local result, negated
		for i = 1, 5 do
			if i == 3 then
				result, negated = i, -i
				break
			end
		end
		assert.same(result, 3)
		return assert.same(negated, -3)
	end)
	it("should work with bitwise operators", function()
		local a, b
		for i = 1, 10 do
			if i == 4 then
				a, b = i ~ 1, i | 8
				break
			end
		end
		assert.same(a, 5)
		return assert.same(b, 12)
	end)
	it("should work with modulo operation", function()
		local quotient, remainder
		for i = 1, 10 do
			if i == 7 then
				quotient, remainder = i // 3, i % 3
				break
			end
		end
		assert.same(quotient, 2)
		return assert.same(remainder, 1)
	end)
	it("should work with exponentiation", function()
		local base, squared
		for i = 1, 5 do
			if i == 3 then
				base, squared = i, i ^ 2
				break
			end
		end
		assert.same(base, 3)
		return assert.same(squared, 9)
	end)
	it("should work with length operator", function()
		local str, len
		for i = 1, 5 do
			if i == 3 then
				str, len = "hello", #"hello"
				break
			end
		end
		assert.same(str, "hello")
		return assert.same(len, 5)
	end)
	it("should work with table concatenation", function()
		local part1, part2
		for i = 1, 5 do
			if i == 2 then
				part1, part2 = {
					1,
					2
				}, {
					3,
					4
				}
				break
			end
		end
		assert.same(part1, {
			1,
			2
		})
		return assert.same(part2, {
			3,
			4
		})
	end)
	it("should work with nested do blocks", function()
		local result
		do
			local temp = {
				_anon_func_4()
			}
			result = temp[1] + temp[2]
		end
		return assert.same(result, 9)
	end)
	it("should work with table.insert", function()
		local results = { }
		local item, index
		for i = 1, 5 do
			if i == 3 then
				item, index = i, i * 2
				break
			end
			table.insert(results, i)
		end
		return assert.same(results, {
			1,
			2
		})
	end)
	it("should break with multiple values in nested for loops", function()
		local x, y
		for i = 1, 5 do
			local a, b
			for j = 1, 5 do
				if i == 2 and j == 3 then
					a, b = i, j
					break
				end
			end
			if a then
				x, y = a, b
				break
			end
		end
		assert.same(x, 2)
		return assert.same(y, 3)
	end)
	it("should break with multiple values in for nested while", function()
		local x, y
		for i = 1, 10 do
			local j = 1
			local a, b
			do
				local _val_0, _val_1
				while j < 10 do
					if i == 3 and j == 5 then
						_val_0, _val_1 = i, j
						break
					end
					j = j + 1
				end
				a, b = _val_0, _val_1
			end
			if a and b then
				x, y = a, b
				break
			end
		end
		assert.same(x, 3)
		return assert.same(y, 5)
	end)
	it("should break with multiple values in while nested for", function()
		local i = 1
		local x, y
		do
			local _val_0, _val_1
			while i < 10 do
				local a, b
				for j = 1, 10 do
					if i == 3 and j == 4 then
						a, b = i, j
						break
					end
				end
				i = i + 1
				if a and b then
					_val_0, _val_1 = a, b
					break
				end
			end
			x, y = _val_0, _val_1
		end
		assert.same(x, 3)
		return assert.same(y, 4)
	end)
	it("should break with multiple values in for nested repeat", function()
		local x, y
		for i = 1, 5 do
			local j = 1
			local a, b
			do
				local _val_0, _val_1
				repeat
					if i == 2 and j == 3 then
						_val_0, _val_1 = i, j
						break
					end
					j = j + 1
				until j > 10
				a, b = _val_0, _val_1
			end
			if a and b then
				x, y = a, b
				break
			end
		end
		assert.same(x, 2)
		return assert.same(y, 3)
	end)
	it("should break with multiple values in repeat nested for", function()
		local i = 1
		local x, y
		do
			local _val_0, _val_1
			repeat
				local a, b
				for j = 1, 5 do
					if i == 3 and j == 2 then
						a, b = i, j
						break
					end
				end
				i = i + 1
				if a and b then
					_val_0, _val_1 = a, b
					break
				end
			until i > 10
			x, y = _val_0, _val_1
		end
		assert.same(x, 3)
		return assert.same(y, 2)
	end)
	it("should break with multiple values in do nested for", function()
		local x, y
		do
			repeat
				local a1, b1
				for i = 1, 5 do
					local a, b
					for j = 1, 5 do
						if i == 2 and j == 3 then
							a, b = i, j
							break
						end
					end
					if a and b then
						a1, b1 = a, b
						break
					end
				end
				x, y = a1, b1
				break
			until true
		end
		assert.same(x, 2)
		return assert.same(y, 3)
	end)
	it("should break with multiple values in for nested do", function()
		local x, y
		for i = 1, 5 do
			do
				if i == 3 then
					x, y = i, i * 2
					break
				end
			end
		end
		assert.same(x, 3)
		return assert.same(y, 6)
	end)
	it("should break with multiple values in for nested with", function()
		local x, y
		for i = 1, 5 do
			local _with_0 = {
				value = i,
				index = i * 2
			}
			if _with_0.value == 3 then
				x, y = _with_0.value, _with_0.index
				break
			end
		end
		assert.same(x, 3)
		return assert.same(y, 6)
	end)
	it("should break with a value in with nested for", function()
		local x
		do
			local _with_0 = {
				limit = 5
			}
			repeat
				for i = 1, _with_0.limit do
					if i == 3 then
						x = i
						break
					end
				end
				break
			until true
		end
		return assert.same(x, 3)
	end)
	it("should break with multiple values in three-level nested loops", function()
		local x, y, z
		for i = 1, 3 do
			local a1, a2, a3
			for j = 1, 3 do
				local b1, b2, b3
				for k = 1, 3 do
					if i == 2 and j == 2 and k == 2 then
						b1, b2, b3 = i, j, k
						break
					end
				end
				if b1 then
					a1, a2, a3 = b1, b2, b3
					break
				end
			end
			if a1 then
				x, y, z = a1, a2, a3
				break
			end
		end
		assert.same(x, 2)
		assert.same(y, 2)
		return assert.same(z, 2)
	end)
	it("should break with multiple values in while nested repeat", function()
		local i = 1
		local x, y
		do
			local _val_0, _val_1
			while i < 10 do
				local j = 1
				local a, b
				do
					local _val_2, _val_3
					repeat
						if i == 3 and j == 4 then
							_val_2, _val_3 = i, j
							break
						end
						j = j + 1
					until j > 10
					a, b = _val_2, _val_3
				end
				i = i + 1
				if a then
					_val_0, _val_1 = a, b
					break
				end
			end
			x, y = _val_0, _val_1
		end
		assert.same(x, 3)
		return assert.same(y, 4)
	end)
	it("should break with multiple values in repeat nested while", function()
		local i = 1
		local x, y
		do
			local _val_0, _val_1
			repeat
				local j = 1
				local a, b
				do
					local _val_2, _val_3
					while j < 10 do
						if i == 4 and j == 3 then
							_val_2, _val_3 = i, j
							break
						end
						j = j + 1
					end
					a, b = _val_2, _val_3
				end
				i = i + 1
				if a then
					_val_0, _val_1 = a, b
					break
				end
			until i > 10
			x, y = _val_0, _val_1
		end
		assert.same(x, 4)
		return assert.same(y, 3)
	end)
	it("should break with multiple values in do nested while", function()
		local i = 1
		local x, y
		do
			repeat
				local a, b
				do
					local _val_0, _val_1
					while i < 10 do
						if i == 4 then
							_val_0, _val_1 = i, i * 3
							break
						end
						i = i + 1
					end
					a, b = _val_0, _val_1
				end
				x, y = a, b
				break
			until true
		end
		assert.same(x, 4)
		return assert.same(y, 12)
	end)
	it("should break with multiple values in while nested do", function()
		local i = 1
		local x, y
		do
			local _val_0, _val_1
			while i < 10 do
				local a, b
				do
					repeat
						if i == 5 then
							a, b = i, i * 4
							break
						end
					until true
				end
				i = i + 1
				if a then
					_val_0, _val_1 = a, b
					break
				end
			end
			x, y = _val_0, _val_1
		end
		assert.same(x, 5)
		return assert.same(y, 20)
	end)
	it("should break with multiple values in do nested repeat", function()
		local i = 1
		local x, y
		do
			repeat
				local a, b
				do
					local _val_0, _val_1
					repeat
						if i == 3 then
							_val_0, _val_1 = i, i * 5
							break
						end
						i = i + 1
					until i > 10
					a, b = _val_0, _val_1
				end
				x, y = a, b
				break
			until true
		end
		assert.same(x, 3)
		return assert.same(y, 15)
	end)
	it("should break with multiple values in repeat nested do", function()
		local i = 1
		local x, y
		do
			local _val_0, _val_1
			repeat
				local a, b
				do
					repeat
						if i == 2 then
							a, b = i, i * 6
							break
						end
					until true
				end
				i = i + 1
				if a then
					_val_0, _val_1 = a, b
					break
				end
			until i > 10
			x, y = _val_0, _val_1
		end
		assert.same(x, 2)
		return assert.same(y, 12)
	end)
	it("should break with multiple values in with nested do", function()
		local x, y
		do
			repeat
				local _with_0 = {
					value = 10,
					factor = 3
				}
				local a, b
				do
					repeat
						if _with_0.value > 5 then
							a, b = _with_0.value, _with_0.factor
							break
						end
					until true
				end
				x, y = a, b
				break
			until true
		end
		assert.same(x, 10)
		return assert.same(y, 3)
	end)
	it("should break with multiple values in do nested with", function()
		local x, y
		do
			repeat
				local _with_0 = {
					num = 42,
					text = "test"
				}
				x, y = _with_0.num, _with_0.text
				break
			until true
		end
		assert.same(x, 42)
		return assert.same(y, "test")
	end)
	it("should break with multiple values in for nested for with different types", function()
		local name, age, active
		for i = 1, 5 do
			local a, b, c
			for j = 1, 5 do
				if i == 2 and j == 3 then
					a, b, c = "user-" .. tostring(i), j * 10, true
					break
				end
			end
			if a then
				name, age, active = a, b, c
				break
			end
		end
		assert.same(name, "user-2")
		assert.same(age, 30)
		return assert.is_true(active)
	end)
	it("should break with multiple values in with nested for with method calls", function()
		local obj = {
			data = {
				10,
				20,
				30,
				40
			},
			find = function(self)
				local x, y
				for i = 1, #self.data do
					if self.data[i] == 30 then
						x, y = self.data[i], i
						break
					end
				end
				return x, y
			end
		}
		local value, index = obj:find()
		assert.same(value, 30)
		return assert.same(index, 3)
	end)
	it("should break with multiple values in nested loops with early termination", function()
		local found, idx
		for i = 1, 10 do
			if i == 1 then
				found, idx = i, true
				break
			end
			local a, b
			for j = 1, 10 do
				if j == 5 then
					a, b = i, false
					break
				end
			end
			if a then
				found, idx = a, b
				break
			end
		end
		assert.same(found, 1)
		return assert.is_true(idx)
	end)
	it("should break with multiple values in nested loops with computed expressions", function()
		local sum, product
		for i = 1, 5 do
			local a, b
			for j = 1, 5 do
				if i * j == 12 then
					a, b = i + j, i * j
					break
				end
			end
			if a then
				sum, product = a, b
				break
			end
		end
		assert.same(sum, 7)
		return assert.same(product, 12)
	end)
	it("should mix break and break with values in same for expression", function()
		local x, y
		for i = 1, 5 do
			if i == 3 then
				x, y = i, i * 10
				break
			end
			if i == 4 then
				break
			end
		end
		assert.same(x, 3)
		return assert.same(y, 30)
	end)
	it("should return nils when plain break happens before value break", function()
		local x, y
		for i = 1, 5 do
			if i == 2 then
				break
			end
			if i == 4 then
				x, y = i, i * 10
				break
			end
		end
		assert.is_nil(x)
		return assert.is_nil(y)
	end)
	it("should mix plain break and value break across nested loops", function()
		local matrix = {
			{
				1,
				-1,
				9
			},
			{
				4,
				5,
				9
			}
		}
		local row, col
		for r = 1, #matrix do
			local a, b
			for c = 1, #matrix[r] do
				local cell = matrix[r][c]
				if cell < 0 then
					break
				end
				if cell == 9 then
					a, b = r, c
					break
				end
			end
			if a then
				row, col = a, b
				break
			end
		end
		assert.same(row, 2)
		return assert.same(col, 3)
	end)
	it("should mix break and break with values in while expression", function()
		local i = 0
		local x, y
		do
			local _val_0, _val_1
			while i < 5 do
				i = i + 1
				if i == 2 then
					break
				end
				if i == 4 then
					_val_0, _val_1 = i, i * 2
					break
				end
			end
			x, y = _val_0, _val_1
		end
		assert.is_nil(x)
		return assert.is_nil(y)
	end)
	it("should mix break and break with values in do with with block", function()
		local x, y
		do
			repeat
				local _with_0 = {
					value = 8,
					stop = false
				}
				if _with_0.stop then
					break
				end
				x, y = _with_0.value, _with_0.value * 2
				break
			until true
		end
		assert.same(x, 8)
		return assert.same(y, 16)
	end)
	it("should fall back to plain break in do with with block", function()
		local x, y
		do
			repeat
				do
					local _with_0 = {
						value = 8,
						stop = true
					}
					if _with_0.stop then
						break
					end
					x, y = _with_0.value, _with_0.value * 2
					break
				end
				break
			until true
		end
		assert.is_nil(x)
		return assert.is_nil(y)
	end)
	it("should mix continue and break with values in for expression", function()
		local x, y
		for i = 1, 8 do
			if i % 3 ~= 0 then
				goto _continue_0
			end
			if i == 6 then
				x, y = i, i + 100
				break
			end
			::_continue_0::
		end
		assert.same(x, 6)
		return assert.same(y, 106)
	end)
	it("should mix continue and break with values across nested for expressions", function()
		local row, col
		for r = 1, 3 do
			local a, b
			for c = 1, 4 do
				if c < 3 then
					goto _continue_1
				end
				if r == 2 and c == 3 then
					a, b = r, c
					break
				end
				::_continue_1::
			end
			if not a then
				goto _continue_0
			end
			row, col = a, b
			break
			::_continue_0::
		end
		assert.same(row, 2)
		return assert.same(col, 3)
	end)
	it("should mix break continue and value break with plain break winning", function()
		local x, y
		for i = 1, 7 do
			if i < 3 then
				goto _continue_0
			end
			if i == 4 then
				break
			end
			if i == 6 then
				x, y = i, i * 10
				break
			end
			::_continue_0::
		end
		assert.is_nil(x)
		return assert.is_nil(y)
	end)
	return it("should mix break continue and value break with value break winning", function()
		local x, y
		for i = 1, 9 do
			if i % 2 == 0 then
				goto _continue_0
			end
			if i == 5 then
				x, y = i, i * 3
				break
			end
			if i == 9 then
				break
			end
			::_continue_0::
		end
		assert.same(x, 5)
		return assert.same(y, 15)
	end)
end)
