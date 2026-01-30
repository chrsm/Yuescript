return describe("using", function()
	it("should prevent variable shadowing in assignment", function()
		local tmp = 100
		local i, k = 100, 50
		local process
		process = function(add)
			local tmp = tmp + add
			i = i + tmp
			k = k + tmp
		end
		process(22)
		assert.same(i, 222)
		assert.same(k, 172)
		return assert.same(tmp, 100)
	end)
	it("should handle multiple variable names", function()
		local a, b, c = 1, 2, 3
		local process
		process = function(sum)
			a = a + 1
			b = b + 2
			local c = sum + 100
		end
		process(10)
		assert.same(a, 2)
		assert.same(b, 4)
		return assert.same(c, 3)
	end)
	it("should work with nil value", function()
		local x = 1
		local fn
		fn = function(val)
			if val ~= nil then
				x = val
			end
		end
		fn(100)
		assert.same(x, 100)
		return assert.is_true(x ~= 1)
	end)
	return it("should work with function calls", function()
		local count = 0
		local fn
		fn = function(n)
			count = count + n
		end
		fn(5)
		return assert.same(count, 5)
	end)
end)
