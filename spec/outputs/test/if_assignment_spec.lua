return describe("if assignment", function()
	it("should assign and check truthy value", function()
		local obj = {
			find_user = function(name)
				return name == "valid" and {
					name = name
				} or nil
			end
		}
		local user = obj:find_user("valid")
		if user then
			return assert.same(user.name, "valid")
		end
	end)
	it("should not enter block when nil", function()
		local obj = {
			find_user = function()
				return nil
			end
		}
		local user = obj:find_user()
		if user then
			return assert.is_true(false)
		else
			return assert.is_true(true)
		end
	end)
	it("should work with elseif", function()
		local get_value
		get_value = function(key)
			if "a" == key then
				return 1
			elseif "b" == key then
				return 2
			else
				return nil
			end
		end
		local result = nil
		do
			local val = get_value("c")
			if val then
				result = "c: " .. tostring(val)
			else
				val = get_value("b")
				if val then
					result = "b: " .. tostring(val)
				else
					result = "no match"
				end
			end
		end
		return assert.same(result, "b: 2")
	end)
	it("should scope variable to if block", function()
		do
			local x = 10
			if x then
				assert.same(x, 10)
			end
		end
		return assert.is_true(true)
	end)
	it("should work with multiple return values", function()
		local fn
		fn = function()
			return true, "success"
		end
		local success, result = fn()
		if success then
			assert.is_true(success)
			return assert.same(result, "success")
		end
	end)
	it("should work with table destructuring", function()
		local get_point
		get_point = function()
			return {
				x = 10,
				y = 20
			}
		end
		local _des_0 = get_point()
		if _des_0 then
			local x, y = _des_0.x, _des_0.y
			assert.same(x, 10)
			return assert.same(y, 20)
		end
	end)
	it("should work with array destructuring", function()
		local get_coords
		get_coords = function()
			return {
				1,
				2,
				3
			}
		end
		local _des_0 = get_coords()
		if _des_0 then
			local a, b, c = _des_0[1], _des_0[2], _des_0[3]
			assert.same(a, 1)
			assert.same(b, 2)
			return assert.same(c, 3)
		end
	end)
	it("should chain multiple assignments", function()
		local a = 1
		if a then
			local b = a + 1
			if b then
				return assert.same(b, 2)
			end
		end
	end)
	it("should work in expression context", function()
		local get_value
		get_value = function(x)
			if x > 0 then
				return x
			else
				return nil
			end
		end
		local result
		do
			local val = get_value(5)
			if val then
				result = val * 2
			else
				result = 0
			end
		end
		return assert.same(result, 10)
	end)
	it("should work with os.getenv", function()
		local path = os.getenv("PATH")
		if path then
			return assert.is_true(type(path) == "string")
		else
			return assert.is_true(true)
		end
	end)
	it("should support table access", function()
		local tb = {
			key = "value"
		}
		local val = tb.key
		if val then
			return assert.same(val, "value")
		end
	end)
	it("should work with function call results", function()
		local fn
		fn = function()
			return "result"
		end
		local s = fn()
		if s then
			return assert.same(s, "result")
		end
	end)
	return it("should handle false values", function()
		local val = false
		if val then
			return assert.is_true(false)
		else
			return assert.is_true(true)
		end
	end)
end)
