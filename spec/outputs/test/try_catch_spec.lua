local _anon_func_0 = function(error)
	return error("boom")
end
local _anon_func_1 = function(e, error)
	return error("wrap:" .. e:match("^.-:%d+:%s*(.*)$"))
end
return describe("try/catch", function()
	return it("catch and rethrow", function()
		local pcall <const> = pcall
		local error <const> = error
		local xpcall <const> = xpcall
		local assert <const> = assert
		local ok, success, err = pcall(function()
			return xpcall(_anon_func_0, function(e)
				local _, result = pcall(_anon_func_1, e, error)
				return result
			end, error)
		end)
		assert.same(ok, true)
		assert.same(success, false)
		return assert.is_true(err:match("wrap:boom") ~= nil)
	end)
end)
