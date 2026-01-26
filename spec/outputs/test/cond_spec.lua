local _anon_func_0 = function(flag)
	if flag then
		return 1
	else
		return 0
	end
end
local _anon_func_1 = function()
	if nil then
		return true
	else
		return false
	end
end
local _anon_func_2 = function()
	if false then
		return true
	else
		return false
	end
end
local _anon_func_3 = function()
	if 0 then
		return true
	else
		return false
	end
end
local _anon_func_4 = function()
	if "" then
		return true
	else
		return false
	end
end
local _anon_func_5 = function()
	if { } then
		return true
	else
		return false
	end
end
local _anon_func_6 = function()
	if 1 then
		return true
	else
		return false
	end
end
return describe("cond", function()
	it("should execute if branch when condition is true", function()
		local result = nil
		if true then
			result = "yes"
		end
		return assert.same(result, "yes")
	end)
	it("should execute else branch when condition is false", function()
		local result = nil
		if false then
			result = "yes"
		else
			result = "no"
		end
		return assert.same(result, "no")
	end)
	it("should support elseif chain", function()
		local value = 2
		local result
		if 1 == value then
			result = "one"
		elseif 2 == value then
			result = "two"
		else
			result = "other"
		end
		return assert.same(result, "two")
	end)
	it("should handle nested conditions", function()
		local result = nil
		if true then
			if true then
				result = "nested"
			end
		end
		return assert.same(result, "nested")
	end)
	it("should work as expression", function()
		local value
		if true then
			value = "yes"
		else
			value = "no"
		end
		return assert.same(value, "yes")
	end)
	it("should work in string interpolation", function()
		local flag = true
		local result = "value is " .. tostring(_anon_func_0(flag))
		return assert.same(result, "value is 1")
	end)
	it("should support chained comparisons", function()
		return assert.is_true(1 < 2 and 2 <= 2 and 2 < 3)
	end)
	it("should short-circuit and expression", function()
		local count = 0
		local inc
		inc = function()
			count = count + 1
			return false
		end
		local result = inc() and inc()
		return assert.same(count, 1)
	end)
	it("should short-circuit or expression", function()
		local count = 0
		local inc
		inc = function()
			count = count + 1
			return true
		end
		local result = inc() or inc()
		return assert.same(count, 1)
	end)
	it("should support unless keyword", function()
		local result = nil
		if not false then
			result = "executed"
		end
		return assert.same(result, "executed")
	end)
	it("should support unless with else", function()
		local result = nil
		if not true then
			result = "no"
		else
			result = "yes"
		end
		return assert.same(result, "yes")
	end)
	it("should handle postfix if", function()
		local result = nil
		if true then
			result = "yes"
		end
		return assert.same(result, "yes")
	end)
	it("should handle postfix unless", function()
		local result = nil
		if not false then
			result = "yes"
		end
		return assert.same(result, "yes")
	end)
	it("should evaluate truthiness correctly", function()
		assert.is_false(_anon_func_1())
		assert.is_false(_anon_func_2())
		assert.is_true(_anon_func_3())
		assert.is_true(_anon_func_4())
		assert.is_true(_anon_func_5())
		return assert.is_true(_anon_func_6())
	end)
	it("should support and/or operators", function()
		assert.same(true and false, false)
		assert.same(false or true, true)
		assert.same(nil or "default", "default")
		return assert.same("value" or "default", "value")
	end)
	it("should handle complex boolean expressions", function()
		local a, b, c = true, false, true
		local result = a and b or c
		return assert.same(result, c)
	end)
	it("should support not operator", function()
		assert.is_true(not false)
		assert.is_true(not nil)
		assert.is_false(not true)
		return assert.is_false(not 1)
	end)
	it("should work with table as condition", function()
		local result = nil
		if { } then
			result = "truthy"
		end
		return assert.same(result, "truthy")
	end)
	it("should work with string as condition", function()
		local result = nil
		if "" then
			result = "truthy"
		end
		return assert.same(result, "truthy")
	end)
	it("should work with zero as condition", function()
		local result = nil
		if 0 then
			result = "truthy"
		end
		return assert.same(result, "truthy")
	end)
	it("should support multiple elseif branches", function()
		local value = 3
		local result
		if value == 1 then
			result = "one"
		elseif value == 2 then
			result = "two"
		elseif value == 3 then
			result = "three"
		else
			result = "other"
		end
		return assert.same(result, "three")
	end)
	it("should handle then keyword syntax", function()
		local result
		if true then
			result = "yes"
		else
			result = "no"
		end
		return assert.same(result, "yes")
	end)
	return it("should work with function call in condition", function()
		local return_true
		return_true = function()
			return true
		end
		local result
		if return_true() then
			result = "yes"
		else
			result = "no"
		end
		return assert.same(result, "yes")
	end)
end)
