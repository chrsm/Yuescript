local _anon_func_0 = function(a, b)
	if a ~= nil then
		return a
	else
		return b
	end
end
local _anon_func_1 = function(a, c)
	if a ~= nil then
		return a
	else
		return c
	end
end
return describe("nil coalescing", function()
	return it("distinguish nil and false", function()
		local a = nil
		local b = false
		local c = 0
		assert.same((_anon_func_0(a, b)), false)
		return assert.same((_anon_func_1(a, c)), 0)
	end)
end)
