local _anon_func_0 = function(obj)
	if obj ~= nil then
		return obj.value
	end
	return nil
end
local _anon_func_1 = function(obj)
	if obj ~= nil then
		return obj.value
	end
	return nil
end
local _anon_func_2 = function(obj)
	if obj ~= nil then
		return obj.x
	end
	return nil
end
local _anon_func_3 = function(obj)
	if obj ~= nil then
		return obj.y
	end
	return nil
end
return describe("existential", function()
	it("should handle ?. with existing object", function()
		local obj = {
			value = 42
		}
		local result
		if obj ~= nil then
			result = obj.value
		end
		return assert.same(result, 42)
	end)
	it("should handle ?. with nil object", function()
		local obj = nil
		local result
		if obj ~= nil then
			result = obj.value
		end
		return assert.same(result, nil)
	end)
	it("should chain ?. calls", function()
		local obj = {
			nested = {
				value = 100
			}
		}
		local result
		if obj ~= nil then
			do
				local _obj_0 = obj.nested
				if _obj_0 ~= nil then
					result = _obj_0.value
				end
			end
		end
		return assert.same(result, 100)
	end)
	it("should return nil in chain with nil", function()
		local obj = nil
		local result
		if obj ~= nil then
			do
				local _obj_0 = obj.nested
				if _obj_0 ~= nil then
					result = _obj_0.value
				end
			end
		end
		return assert.same(result, nil)
	end)
	it("should handle ?. with method call", function()
		local obj = {
			func = function()
				return "result"
			end
		}
		local result
		if obj ~= nil then
			result = obj.func()
		end
		return assert.same(result, "result")
	end)
	it("should handle ? on table index", function()
		local tb = {
			[1] = "first"
		}
		local result
		if tb ~= nil then
			result = tb[1]
		end
		return assert.same(result, "first")
	end)
	it("should return nil for missing index", function()
		local tb = { }
		local result
		if tb ~= nil then
			result = tb[99]
		end
		return assert.same(result, nil)
	end)
	it("should work with ? in if condition", function()
		local obj = {
			value = 5
		}
		local result
		if _anon_func_0(obj) then
			result = "exists"
		end
		return assert.same(result, "exists")
	end)
	it("should combine ?. with and/or", function()
		local obj = {
			value = 10
		}
		local result = _anon_func_1(obj) and 20 or 30
		return assert.same(result, 20)
	end)
	it("should handle with? safely", function()
		local obj = {
			x = 1,
			y = 2
		}
		local sum = _anon_func_2(obj) + _anon_func_3(obj)
		return assert.same(sum, 3)
	end)
	it("should return nil with with? on nil", function()
		local obj = nil
		local result
		if obj ~= nil then
			result = obj.x
		end
		return assert.same(result, nil)
	end)
	it("should handle false value correctly", function()
		local obj = {
			value = false
		}
		local result
		if obj ~= nil then
			result = obj.value
		end
		return assert.same(result, false)
	end)
	it("should handle 0 value correctly", function()
		local obj = {
			value = 0
		}
		local result
		if obj ~= nil then
			result = obj.value
		end
		return assert.same(result, 0)
	end)
	it("should handle empty string correctly", function()
		local obj = {
			value = ""
		}
		local result
		if obj ~= nil then
			result = obj.value
		end
		return assert.same(result, "")
	end)
	it("should handle empty table correctly", function()
		local obj = {
			value = { }
		}
		local result
		if obj ~= nil then
			result = obj.value
		end
		return assert.same(type(result), "table")
	end)
	it("should work with deep chains", function()
		local obj = {
			a = {
				b = {
					c = {
						d = "deep"
					}
				}
			}
		}
		local result
		if obj ~= nil then
			do
				local _obj_0 = obj.a
				if _obj_0 ~= nil then
					do
						local _obj_1 = _obj_0.b
						if _obj_1 ~= nil then
							do
								local _obj_2 = _obj_1.c
								if _obj_2 ~= nil then
									result = _obj_2.d
								end
							end
						end
					end
				end
			end
		end
		return assert.same(result, "deep")
	end)
	it("should break chain on first nil", function()
		local obj = {
			a = nil
		}
		local result
		if obj ~= nil then
			do
				local _obj_0 = obj.a
				if _obj_0 ~= nil then
					do
						local _obj_1 = _obj_0.b
						if _obj_1 ~= nil then
							result = _obj_1.c
						end
					end
				end
			end
		end
		return assert.same(result, nil)
	end)
	it("should handle ?. with string methods", function()
		local s = "hello"
		local result
		if s ~= nil then
			result = s:upper()
		end
		return assert.same(result, "HELLO")
	end)
	return it("should handle ?. with nil string", function()
		local s = nil
		local result
		if s ~= nil then
			result = s:upper()
		end
		return assert.same(result, nil)
	end)
end)
