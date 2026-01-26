return describe("metatable", function() -- 1
	it("should get metatable with <> syntax", function() -- 2
		local obj = setmetatable({ -- 3
			value = 42 -- 3
		}, { -- 3
			__index = { -- 3
				extra = "data" -- 3
			} -- 3
		}) -- 3
		local mt = getmetatable(obj) -- 4
		return assert.is_true(mt ~= nil) -- 5
	end) -- 2
	it("should set metatable with <>", function() -- 7
		local obj = { } -- 8
		setmetatable(obj, { -- 9
			__index = { -- 9
				value = 100 -- 9
			} -- 9
		}) -- 9
		return assert.same(obj.value, 100) -- 10
	end) -- 7
	it("should access metatable with <>", function() -- 12
		local obj = setmetatable({ }, { -- 13
			__index = { -- 13
				value = 50 -- 13
			} -- 13
		}) -- 13
		local result = getmetatable(obj).__index.value -- 14
		return assert.same(result, 50) -- 15
	end) -- 12
	it("should work with <index> metamethod", function() -- 17
		local obj = setmetatable({ }, { -- 19
			__index = function(self, key) -- 19
				if key == "computed" then -- 20
					return "computed_value" -- 21
				end -- 20
			end -- 19
		}) -- 18
		return assert.same(obj.computed, "computed_value") -- 23
	end) -- 17
	it("should work with <newindex> metamethod", function() -- 25
		local obj = setmetatable({ }, { -- 27
			__newindex = function(self, key, value) -- 27
				return rawset(self, "stored_" .. key, value) -- 28
			end -- 27
		}) -- 26
		obj.test = 123 -- 30
		return assert.same(obj.stored_test, 123) -- 31
	end) -- 25
	it("should work with <add> metamethod", function() -- 33
		local obj = setmetatable({ -- 34
			value = 10 -- 34
		}, { -- 35
			__add = function(a, b) -- 35
				return a.value + b.value -- 35
			end -- 35
		}) -- 34
		local obj2 = setmetatable({ -- 37
			value = 20 -- 37
		}, { -- 38
			__add = function(a, b) -- 38
				return a.value + b.value -- 38
			end -- 38
		}) -- 37
		local result = obj + obj2 -- 40
		return assert.same(result, 30) -- 41
	end) -- 33
	it("should work with <call> metamethod", function() -- 43
		local obj = setmetatable({ }, { -- 45
			__call = function(self, x) -- 45
				return x * 2 -- 45
			end -- 45
		}) -- 44
		local result = obj(5) -- 47
		return assert.same(result, 10) -- 48
	end) -- 43
	it("should work with <tostring> metamethod", function() -- 50
		local obj = setmetatable({ -- 51
			value = 42 -- 51
		}, { -- 52
			__tostring = function(self) -- 52
				return "Value: " .. tostring(self.value) -- 52
			end -- 52
		}) -- 51
		local result = tostring(obj) -- 54
		return assert.same(result, "Value: 42") -- 55
	end) -- 50
	it("should work with <eq> metamethod", function() -- 57
		local obj1 = setmetatable({ -- 58
			id = 1 -- 58
		}, { -- 59
			__eq = function(a, b) -- 59
				return a.id == b.id -- 59
			end -- 59
		}) -- 58
		local obj2 = setmetatable({ -- 61
			id = 1 -- 61
		}, { -- 62
			__eq = function(a, b) -- 62
				return a.id == b.id -- 62
			end -- 62
		}) -- 61
		return assert.is_true(obj1 == obj2) -- 64
	end) -- 57
	it("should destructure metatable", function() -- 66
		local obj = setmetatable({ }, { -- 68
			new = function() -- 68
				return "new result" -- 68
			end, -- 68
			update = function() -- 69
				return "update result" -- 69
			end -- 69
		}) -- 67
		local new, update -- 71
		do -- 71
			local _obj_0 = getmetatable(obj) -- 71
			new, update = _obj_0.new, _obj_0.update -- 71
		end -- 71
		assert.is_true(type(new) == "function") -- 72
		return assert.is_true(type(update) == "function") -- 73
	end) -- 66
	it("should check if two objects have same metatable", function() -- 75
		local mt = { -- 76
			value = 100 -- 76
		} -- 76
		local obj1 = setmetatable({ }, mt) -- 77
		local obj2 = setmetatable({ }, mt) -- 78
		return assert.is_true(getmetatable(obj1) == getmetatable(obj2)) -- 79
	end) -- 75
	return it("should work with <concat> metamethod", function() -- 81
		local obj = setmetatable({ -- 82
			value = "hello" -- 82
		}, { -- 83
			__concat = function(a, b) -- 83
				return a.value .. b -- 83
			end -- 83
		}) -- 82
		local result = obj .. " world" -- 85
		return assert.same(result, "hello world") -- 86
	end) -- 81
end) -- 1
