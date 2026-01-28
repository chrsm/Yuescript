local stub_fn
stub_fn = function()
	return function() end
end
local _anon_func_0 = function(stub_fn)
	stub_fn()
	return true
end
return describe("function stub", function()
	it("should create empty function", function()
		stub_fn()
		return assert.is_true(true)
	end)
	it("should support stub in table", function()
		local obj = {
			stub = stub_fn()
		}
		return assert.is_true(true)
	end)
	it("should work with method stub", function()
		local obj = {
			method = stub_fn()
		}
		return assert.is_true(true)
	end)
	it("should handle stub in assignment", function()
		local my_func = stub_fn()
		return assert.is_true(true)
	end)
	it("should support stub in return", function()
		local get_stub
		get_stub = function()
			return stub_fn()
		end
		local fn = get_stub()
		return assert.is_true(true)
	end)
	it("should work in conditional", function()
		if stub_fn() then
			return assert.is_true(true)
		end
	end)
	it("should support stub as callback", function()
		local call_fn
		call_fn = function(fn)
			return fn()
		end
		local result = call_fn(stub_fn())
		return assert.is_true(true)
	end)
	it("should handle stub in table literal", function()
		local tb = {
			on_click = stub_fn(),
			on_hover = stub_fn()
		}
		return assert.is_true(true)
	end)
	it("should work with fat arrow stub", function()
		local obj = {
			value = 10,
			method = stub_fn()
		}
		local result = obj:method()
		return assert.is_true(true)
	end)
	it("should support stub in array", function()
		local callbacks = {
			stub_fn(),
			stub_fn(),
			stub_fn()
		}
		return assert.same(#callbacks, 3)
	end)
	it("should handle stub in expression", function()
		local result = stub_fn() and true or false
		return assert.is_true(result)
	end)
	it("should work with chained stub calls", function()
		stub_fn()
		stub_fn()
		stub_fn()
		return assert.is_true(true)
	end)
	it("should support stub in comprehension", function()
		local result
		do
			local _accum_0 = { }
			local _len_0 = 1
			for i = 1, 3 do
				_accum_0[_len_0] = stub_fn()
				_len_0 = _len_0 + 1
			end
			result = _accum_0
		end
		return assert.same(#result, 3)
	end)
	it("should handle stub in switch", function()
		local value = "test"
		local result
		if "test" == value then
			stub_fn()
			result = "matched"
		else
			result = "not matched"
		end
		return assert.same(result, "matched")
	end)
	it("should work in with statement", function()
		local obj = {
			stub = stub_fn()
		}
		obj.stub()
		return assert.is_true(true)
	end)
	it("should support stub as argument default", function()
		local fn
		fn = function(callback)
			if callback == nil then
				callback = stub_fn()
			end
			return callback()
		end
		local result = fn()
		return assert.is_true(true)
	end)
	it("should handle stub in varargs", function()
		local collect
		collect = function(...)
			return {
				...
			}
		end
		local result = collect(stub_fn(), stub_fn())
		return assert.same(#result, 2)
	end)
	it("should work in do block", function()
		do
			stub_fn()
		end
		return assert.is_true(true)
	end)
	return it("should support stub in try block", function()
		local success = xpcall(_anon_func_0, function(err)
			return false
		end, stub_fn)
		return assert.is_true(success)
	end)
end)
