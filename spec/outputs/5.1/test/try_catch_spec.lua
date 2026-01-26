local _anon_func_0 = function(e, error)
	return error("wrap:" .. e:match("^.-:%d+:%s*(.*)$"))
end
return describe("try/catch", function()
	return it("catch and rethrow", function()
		local pcall = pcall
		local error = error
		local xpcall = xpcall
		local assert = assert
		local ok, success, err = pcall(function()
			return xpcall(function()
				return error("boom")
			end, function(e)
				local _, result = pcall(_anon_func_0, e, error)
				return result
			end)
		end)
		assert.same(ok, true)
		assert.same(success, false)
		return assert.is_true(err:match("wrap:boom") ~= nil)
	end)
end)
