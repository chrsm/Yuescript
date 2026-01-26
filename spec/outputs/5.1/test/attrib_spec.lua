return describe("attrib", function() -- 1
	it("should support const attribute", function() -- 2
		do -- 3
			local x <const> = 10 -- 4
			return assert.same(x, 10) -- 5
		end -- 3
	end) -- 2
	it("should support const with multiple variables", function() -- 7
		do -- 8
			local a <const>, b <const>, c <const> = 1, 2, 3 -- 9
			assert.same(a, 1) -- 10
			assert.same(b, 2) -- 11
			return assert.same(c, 3) -- 12
		end -- 8
	end) -- 7
	it("should support close attribute", function() -- 14
		do -- 16
			local x <close> = 1 -- 17
			return assert.same(x, 1) -- 18
		end -- 16
	end) -- 14
	it("should work with destructuring", function() -- 20
		do -- 21
			local a, b -- 22
			do -- 22
				local _obj_0 = { -- 22
					a = 1, -- 22
					b = 2 -- 22
				} -- 22
				a, b = _obj_0[1], _obj_0[2] -- 22
			end -- 22
			assert.same(a, 1) -- 23
			return assert.same(b, 2) -- 24
		end -- 21
	end) -- 20
	it("should work in conditional", function() -- 26
		do -- 27
			local flag = true -- 28
			local x -- 29
			if flag then -- 29
				x = 5 -- 29
			end -- 29
			return assert.same(x, 5) -- 30
		end -- 27
	end) -- 26
	it("should work with switch", function() -- 32
		do -- 33
			local y -- 34
			do -- 34
				local _exp_0 = 2 -- 34
				if 2 == _exp_0 then -- 35
					y = 100 -- 35
				else -- 36
					y = 0 -- 36
				end -- 34
			end -- 34
			return assert.same(y, 100) -- 37
		end -- 33
	end) -- 32
	it("should work with table literals", function() -- 39
		do -- 40
			local a, b -- 41
			do -- 41
				local _obj_0 = { -- 41
					1, -- 41
					2 -- 41
				} -- 41
				a, b = _obj_0[1], _obj_0[2] -- 41
			end -- 41
			assert.same(a, 1) -- 42
			return assert.same(b, 2) -- 43
		end -- 40
	end) -- 39
	return it("should support close in expressions", function() -- 45
		do -- 46
			local result -- 47
			if true then -- 47
				result = 42 -- 48
			else -- 50
				result = 0 -- 50
			end -- 47
			local _close_0 <close> = result -- 47
			return assert.same(result, 42) -- 51
		end -- 46
	end) -- 45
end) -- 1
