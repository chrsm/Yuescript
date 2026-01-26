return describe("switch", function() -- 1
	it("should match single value", function() -- 2
		local value = "cool" -- 3
		local result -- 4
		if "cool" == value then -- 5
			result = "matched" -- 6
		else -- 8
			result = "not matched" -- 8
		end -- 4
		return assert.same(result, "matched") -- 9
	end) -- 2
	it("should match multiple values with or", function() -- 11
		local hi = "world" -- 12
		local matched = false -- 13
		if "one" == hi or "two" == hi then -- 15
			matched = true -- 16
		end -- 14
		assert.is_false(matched) -- 17
		hi = "one" -- 19
		if "one" == hi or "two" == hi then -- 21
			matched = true -- 22
		end -- 20
		return assert.is_true(matched) -- 23
	end) -- 11
	it("should execute else branch when no match", function() -- 25
		local value = "other" -- 26
		local result -- 27
		if "cool" == value then -- 28
			result = "matched cool" -- 29
		elseif "yeah" == value then -- 30
			result = "matched yeah" -- 31
		else -- 33
			result = "else branch" -- 33
		end -- 27
		return assert.same(result, "else branch") -- 34
	end) -- 25
	it("should destructure table with single key", function() -- 36
		local tb = { -- 37
			x = 100 -- 37
		} -- 37
		local result -- 38
		do -- 39
			local _type_0 = type(tb) -- 39
			local _tab_0 = "table" == _type_0 or "userdata" == _type_0 -- 39
			local _match_0 = false -- 39
			if _tab_0 then -- 39
				local x = tb.x -- 39
				if x ~= nil then -- 39
					_match_0 = true -- 39
					result = x -- 40
				end -- 39
			end -- 39
			if not _match_0 then -- 39
				result = "no match" -- 42
			end -- 38
		end -- 38
		return assert.same(result, 100) -- 43
	end) -- 36
	it("should destructure table with multiple keys", function() -- 45
		local tb = { -- 46
			x = 100, -- 46
			y = 200 -- 46
		} -- 46
		local result -- 47
		do -- 48
			local _type_0 = type(tb) -- 48
			local _tab_0 = "table" == _type_0 or "userdata" == _type_0 -- 48
			local _match_0 = false -- 48
			if _tab_0 then -- 48
				local x = tb.x -- 48
				local y = tb.y -- 48
				if x ~= nil and y ~= nil then -- 48
					_match_0 = true -- 48
					result = x + y -- 49
				end -- 48
			end -- 48
			if not _match_0 then -- 48
				result = "no match" -- 51
			end -- 47
		end -- 47
		return assert.same(result, 300) -- 52
	end) -- 45
	it("should destructure table with default values", function() -- 54
		local tb = { -- 55
			a = 1 -- 55
		} -- 55
		local _type_0 = type(tb) -- 57
		local _tab_0 = "table" == _type_0 or "userdata" == _type_0 -- 57
		if _tab_0 then -- 57
			local a = tb.a -- 57
			local b = tb.b -- 57
			if a == nil then -- 57
				a = 1 -- 57
			end -- 57
			if b == nil then -- 57
				b = 2 -- 57
			end -- 57
			assert.same(a, 1) -- 58
			return assert.same(b, 2) -- 59
		end -- 56
	end) -- 54
	it("should destructure nested tables", function() -- 61
		local dict = { -- 63
			{ }, -- 63
			{ -- 64
				1, -- 64
				2, -- 64
				3 -- 64
			}, -- 64
			a = { -- 65
				b = { -- 65
					c = 1 -- 65
				} -- 65
			}, -- 65
			x = { -- 66
				y = { -- 66
					z = 1 -- 66
				} -- 66
			} -- 66
		} -- 62
		local matched = false -- 68
		do -- 70
			local _type_0 = type(dict) -- 70
			local _tab_0 = "table" == _type_0 or "userdata" == _type_0 -- 70
			if _tab_0 then -- 70
				local first = dict[1] -- 70
				local one -- 70
				do -- 70
					local _obj_0 = dict[2] -- 70
					local _type_1 = type(_obj_0) -- 70
					if "table" == _type_1 or "userdata" == _type_1 then -- 70
						one = _obj_0[1] -- 70
					end -- 70
				end -- 70
				local two -- 70
				do -- 70
					local _obj_0 = dict[2] -- 70
					local _type_1 = type(_obj_0) -- 70
					if "table" == _type_1 or "userdata" == _type_1 then -- 70
						two = _obj_0[2] -- 70
					end -- 70
				end -- 70
				local three -- 70
				do -- 70
					local _obj_0 = dict[2] -- 70
					local _type_1 = type(_obj_0) -- 70
					if "table" == _type_1 or "userdata" == _type_1 then -- 70
						three = _obj_0[3] -- 70
					end -- 70
				end -- 70
				local c -- 70
				do -- 70
					local _obj_0 = dict.a -- 70
					local _type_1 = type(_obj_0) -- 70
					if "table" == _type_1 or "userdata" == _type_1 then -- 70
						do -- 70
							local _obj_1 = _obj_0.b -- 70
							local _type_2 = type(_obj_1) -- 70
							if "table" == _type_2 or "userdata" == _type_2 then -- 70
								c = _obj_1.c -- 70
							end -- 70
						end -- 70
					end -- 70
				end -- 70
				local z -- 70
				do -- 70
					local _obj_0 = dict.x -- 70
					local _type_1 = type(_obj_0) -- 70
					if "table" == _type_1 or "userdata" == _type_1 then -- 70
						do -- 70
							local _obj_1 = _obj_0.y -- 70
							local _type_2 = type(_obj_1) -- 70
							if "table" == _type_2 or "userdata" == _type_2 then -- 70
								z = _obj_1.z -- 70
							end -- 70
						end -- 70
					end -- 70
				end -- 70
				if first ~= nil and one ~= nil and two ~= nil and three ~= nil and c ~= nil and z ~= nil then -- 70
					matched = first == { } and one == 1 and two == 2 and three == 3 and c == 1 and z == 1 -- 76
				end -- 70
			end -- 69
		end -- 69
		return assert.is_true(matched) -- 77
	end) -- 61
	it("should destructure arrays with exact match", function() -- 79
		local tb = { -- 80
			1, -- 80
			2, -- 80
			3 -- 80
		} -- 80
		local result -- 81
		do -- 82
			local _type_0 = type(tb) -- 82
			local _tab_0 = "table" == _type_0 or "userdata" == _type_0 -- 82
			local _match_0 = false -- 82
			if _tab_0 then -- 82
				if 1 == tb[1] and 2 == tb[2] and 3 == tb[3] then -- 82
					_match_0 = true -- 82
					result = "exact match" -- 83
				end -- 82
			end -- 82
			if not _match_0 then -- 82
				result = "no match" -- 85
			end -- 81
		end -- 81
		return assert.same(result, "exact match") -- 86
	end) -- 79
	it("should destructure arrays with variables", function() -- 88
		local tb = { -- 89
			1, -- 89
			"b", -- 89
			3 -- 89
		} -- 89
		local result -- 90
		do -- 91
			local _type_0 = type(tb) -- 91
			local _tab_0 = "table" == _type_0 or "userdata" == _type_0 -- 91
			local _match_0 = false -- 91
			if _tab_0 then -- 91
				local b = tb[2] -- 91
				if 1 == tb[1] and b ~= nil and 3 == tb[3] then -- 91
					_match_0 = true -- 91
					result = b -- 92
				end -- 91
			end -- 91
			if not _match_0 then -- 91
				result = "no match" -- 94
			end -- 90
		end -- 90
		return assert.same(result, "b") -- 95
	end) -- 88
	it("should destructure arrays with defaults", function() -- 97
		local tb = { -- 98
			1, -- 98
			2 -- 98
		} -- 98
		local result -- 99
		do -- 100
			local _type_0 = type(tb) -- 100
			local _tab_0 = "table" == _type_0 or "userdata" == _type_0 -- 100
			local _match_0 = false -- 100
			if _tab_0 then -- 100
				local b = tb[3] -- 100
				if b == nil then -- 100
					b = 3 -- 100
				end -- 100
				if 1 == tb[1] and 2 == tb[2] then -- 100
					_match_0 = true -- 100
					result = b -- 101
				end -- 100
			end -- 100
			if not _match_0 then -- 100
				result = "no match" -- 103
			end -- 99
		end -- 99
		return assert.same(result, 3) -- 104
	end) -- 97
	it("should match pattern with __class", function() -- 106
		local ClassA -- 107
		do -- 107
			local _class_0 -- 107
			local _base_0 = { } -- 107
			if _base_0.__index == nil then -- 107
				_base_0.__index = _base_0 -- 107
			end -- 107
			_class_0 = setmetatable({ -- 107
				__init = function() end, -- 107
				__base = _base_0, -- 107
				__name = "ClassA" -- 107
			}, { -- 107
				__index = _base_0, -- 107
				__call = function(cls, ...) -- 107
					local _self_0 = setmetatable({ }, _base_0) -- 107
					cls.__init(_self_0, ...) -- 107
					return _self_0 -- 107
				end -- 107
			}) -- 107
			_base_0.__class = _class_0 -- 107
			ClassA = _class_0 -- 107
		end -- 107
		local ClassB -- 108
		do -- 108
			local _class_0 -- 108
			local _base_0 = { } -- 108
			if _base_0.__index == nil then -- 108
				_base_0.__index = _base_0 -- 108
			end -- 108
			_class_0 = setmetatable({ -- 108
				__init = function() end, -- 108
				__base = _base_0, -- 108
				__name = "ClassB" -- 108
			}, { -- 108
				__index = _base_0, -- 108
				__call = function(cls, ...) -- 108
					local _self_0 = setmetatable({ }, _base_0) -- 108
					cls.__init(_self_0, ...) -- 108
					return _self_0 -- 108
				end -- 108
			}) -- 108
			_base_0.__class = _class_0 -- 108
			ClassB = _class_0 -- 108
		end -- 108
		local item = ClassA() -- 109
		local result -- 110
		do -- 111
			local _type_0 = type(item) -- 111
			local _tab_0 = "table" == _type_0 or "userdata" == _type_0 -- 111
			local _match_0 = false -- 111
			if _tab_0 then -- 111
				ClassA = item.__class -- 111
				if ClassA ~= nil then -- 111
					_match_0 = true -- 111
					result = "Object A" -- 112
				end -- 111
			end -- 111
			if not _match_0 then -- 111
				local _match_1 = false -- 113
				if _tab_0 then -- 113
					ClassB = item.__class -- 113
					if ClassB ~= nil then -- 113
						_match_1 = true -- 113
						result = "Object B" -- 114
					end -- 113
				end -- 113
				if not _match_1 then -- 113
					result = "unknown" -- 116
				end -- 110
			end -- 110
		end -- 110
		return assert.same(result, "Object A") -- 117
	end) -- 106
	it("should match pattern with metatable", function() -- 119
		local tb = setmetatable({ }, { -- 120
			__mode = "v" -- 120
		}) -- 120
		local metatable_matched = false -- 121
		do -- 123
			local _type_0 = type(tb) -- 123
			local _tab_0 = "table" == _type_0 or "userdata" == _type_0 -- 123
			if _tab_0 then -- 123
				local mt = getmetatable(tb) -- 123
				if mt ~= nil then -- 123
					metatable_matched = mt ~= nil -- 124
				end -- 123
			end -- 122
		end -- 122
		return assert.is_true(metatable_matched) -- 125
	end) -- 119
	it("should use switch as expression in assignment", function() -- 127
		local tb = { -- 128
			x = "abc" -- 128
		} -- 128
		local matched -- 129
		if 1 == tb then -- 130
			matched = "1" -- 131
		else -- 132
			do -- 132
				local _type_0 = type(tb) -- 132
				local _tab_0 = "table" == _type_0 or "userdata" == _type_0 -- 132
				local _match_0 = false -- 132
				if _tab_0 then -- 132
					local x = tb.x -- 132
					if x ~= nil then -- 132
						_match_0 = true -- 132
						matched = x -- 133
					end -- 132
				end -- 132
				if not _match_0 then -- 132
					if false == tb then -- 134
						matched = "false" -- 135
					else -- 137
						matched = nil -- 137
					end -- 129
				end -- 129
			end -- 129
		end -- 129
		return assert.same(matched, "abc") -- 138
	end) -- 127
	it("should use switch in return statement", function() -- 140
		local fn -- 141
		fn = function(tb) -- 141
			if nil == tb then -- 143
				return "invalid" -- 144
			else -- 145
				local _type_0 = type(tb) -- 145
				local _tab_0 = "table" == _type_0 or "userdata" == _type_0 -- 145
				local _match_0 = false -- 145
				if _tab_0 then -- 145
					local a = tb.a -- 145
					local b = tb.b -- 145
					if a ~= nil and b ~= nil then -- 145
						_match_0 = true -- 145
						return tostring(a + b) -- 146
					end -- 145
				end -- 145
				if not _match_0 then -- 145
					if 1 == tb or 2 == tb or 3 == tb or 4 == tb or 5 == tb then -- 147
						return "number 1 - 5" -- 148
					else -- 150
						return "should not reach here" -- 150
					end -- 142
				end -- 142
			end -- 142
		end -- 141
		assert.same(fn({ -- 151
			a = 1, -- 151
			b = 2 -- 151
		}), "3") -- 151
		assert.same(fn(3), "number 1 - 5") -- 152
		return assert.same(fn(nil), "invalid") -- 153
	end) -- 140
	it("should support pattern matching assignment with :=", function() -- 155
		local v = "hello" -- 156
		local matched = false -- 157
		do -- 158
			v = "hello" -- 158
			if "hello" == v then -- 159
				matched = true -- 160
			else -- 162
				matched = false -- 162
			end -- 158
		end -- 158
		assert.is_true(matched) -- 163
		return assert.same(v, "hello") -- 164
	end) -- 155
	it("should match with computed expressions", function() -- 166
		local hi = 4 -- 167
		local matched = false -- 168
		if (3 + 1) == hi or (function() -- 170
			return 4 -- 170
		end)() == hi or (5 - 1) == hi then -- 170
			matched = true -- 171
		end -- 169
		return assert.is_true(matched) -- 172
	end) -- 166
	it("should handle nested array destructuring", function() -- 174
		local tb = { -- 176
			{ -- 176
				a = 1, -- 176
				b = 2 -- 176
			}, -- 176
			{ -- 177
				a = 3, -- 177
				b = 4 -- 177
			}, -- 177
			{ -- 178
				a = 5, -- 178
				b = 6 -- 178
			}, -- 178
			"fourth" -- 179
		} -- 175
		local result -- 181
		do -- 182
			local _type_0 = type(tb) -- 182
			local _tab_0 = "table" == _type_0 or "userdata" == _type_0 -- 182
			local _match_0 = false -- 182
			if _tab_0 then -- 182
				local fourth = tb[4] -- 182
				local _val_0 -- 182
				do -- 182
					local _obj_0 = tb[1] -- 182
					if _obj_0 ~= nil then -- 182
						_val_0 = _obj_0.a -- 182
					end -- 182
				end -- 182
				local _val_1 -- 182
				do -- 182
					local _obj_0 = tb[1] -- 182
					if _obj_0 ~= nil then -- 182
						_val_1 = _obj_0.b -- 182
					end -- 182
				end -- 182
				local _val_2 -- 182
				do -- 182
					local _obj_0 = tb[2] -- 182
					if _obj_0 ~= nil then -- 182
						_val_2 = _obj_0.a -- 182
					end -- 182
				end -- 182
				local _val_3 -- 182
				do -- 182
					local _obj_0 = tb[2] -- 182
					if _obj_0 ~= nil then -- 182
						_val_3 = _obj_0.b -- 182
					end -- 182
				end -- 182
				local _val_4 -- 182
				do -- 182
					local _obj_0 = tb[3] -- 182
					if _obj_0 ~= nil then -- 182
						_val_4 = _obj_0.a -- 182
					end -- 182
				end -- 182
				local _val_5 -- 182
				do -- 182
					local _obj_0 = tb[3] -- 182
					if _obj_0 ~= nil then -- 182
						_val_5 = _obj_0.b -- 182
					end -- 182
				end -- 182
				if 1 == _val_0 and 2 == _val_1 and 3 == _val_2 and 4 == _val_3 and 5 == _val_4 and 6 == _val_5 and fourth ~= nil then -- 182
					_match_0 = true -- 182
					result = fourth -- 188
				end -- 182
			end -- 182
			if not _match_0 then -- 182
				result = "no match" -- 190
			end -- 181
		end -- 181
		return assert.same(result, "fourth") -- 191
	end) -- 174
	it("should match combined patterns", function() -- 193
		local tb = { -- 194
			success = true, -- 194
			result = "data" -- 194
		} -- 194
		local result -- 195
		do -- 196
			local _type_0 = type(tb) -- 196
			local _tab_0 = "table" == _type_0 or "userdata" == _type_0 -- 196
			local _match_0 = false -- 196
			if _tab_0 then -- 196
				result = tb.result -- 196
				if true == tb.success and result ~= nil then -- 196
					_match_0 = true -- 196
					result = { -- 197
						"success", -- 197
						result -- 197
					} -- 197
				end -- 196
			end -- 196
			if not _match_0 then -- 196
				local _match_1 = false -- 198
				if _tab_0 then -- 198
					if false == tb.success then -- 198
						_match_1 = true -- 198
						result = { -- 199
							"failed", -- 199
							result -- 199
						} -- 199
					end -- 198
				end -- 198
				if not _match_1 then -- 198
					result = { -- 201
						"invalid" -- 201
					} -- 201
				end -- 195
			end -- 195
		end -- 195
		return assert.same(result, { -- 202
			"success", -- 202
			"data" -- 202
		}) -- 202
	end) -- 193
	it("should match type discriminated patterns", function() -- 204
		local tb = { -- 205
			type = "success", -- 205
			content = "data" -- 205
		} -- 205
		local result -- 206
		do -- 207
			local _type_0 = type(tb) -- 207
			local _tab_0 = "table" == _type_0 or "userdata" == _type_0 -- 207
			local _match_0 = false -- 207
			if _tab_0 then -- 207
				local content = tb.content -- 207
				if "success" == tb.type and content ~= nil then -- 207
					_match_0 = true -- 207
					result = { -- 208
						"success", -- 208
						content -- 208
					} -- 208
				end -- 207
			end -- 207
			if not _match_0 then -- 207
				local _match_1 = false -- 209
				if _tab_0 then -- 209
					local content = tb.content -- 209
					if "error" == tb.type and content ~= nil then -- 209
						_match_1 = true -- 209
						result = { -- 210
							"error", -- 210
							content -- 210
						} -- 210
					end -- 209
				end -- 209
				if not _match_1 then -- 209
					result = { -- 212
						"invalid" -- 212
					} -- 212
				end -- 206
			end -- 206
		end -- 206
		return assert.same(result, { -- 213
			"success", -- 213
			"data" -- 213
		}) -- 213
	end) -- 204
	it("should match with wildcard array capture", function() -- 215
		local clientData = { -- 216
			"Meta", -- 216
			"CUST_1001", -- 216
			"CHK123" -- 216
		} -- 216
		local metadata = nil -- 217
		local customerId = nil -- 218
		local checksum = nil -- 219
		do -- 221
			local _type_0 = type(clientData) -- 221
			local _tab_0 = "table" == _type_0 or "userdata" == _type_0 -- 221
			if _tab_0 then -- 221
				local capturedMetadata -- 221
				do -- 221
					local _accum_0 = { } -- 221
					local _len_0 = 1 -- 221
					local _max_0 = #clientData + -3 + 1 -- 221
					for _index_0 = 1, _max_0 do -- 221
						local _item_0 = clientData[_index_0] -- 221
						_accum_0[_len_0] = _item_0 -- 221
						_len_0 = _len_0 + 1 -- 221
					end -- 221
					capturedMetadata = _accum_0 -- 221
				end -- 221
				customerId = clientData[#clientData - 1] -- 221
				checksum = clientData[#clientData] -- 221
				if customerId ~= nil and checksum ~= nil then -- 221
					metadata = capturedMetadata -- 222
				end -- 221
			end -- 220
		end -- 220
		assert.same(metadata, { -- 223
			"Meta" -- 223
		}) -- 223
		assert.same(customerId, "CUST_1001") -- 224
		return assert.same(checksum, "CHK123") -- 225
	end) -- 215
	it("should work with complex tuple patterns", function() -- 227
		local handlePath -- 228
		handlePath = function(segments) -- 228
			local _type_0 = type(segments) -- 230
			local _tab_0 = "table" == _type_0 or "userdata" == _type_0 -- 230
			local _match_0 = false -- 230
			if _tab_0 then -- 230
				local resource = segments[#segments - 1] -- 230
				local action = segments[#segments] -- 230
				if resource ~= nil and action ~= nil then -- 230
					_match_0 = true -- 230
					return { -- 231
						"Resource: " .. tostring(resource), -- 231
						"Action: " .. tostring(action) -- 231
					} -- 231
				end -- 230
			end -- 230
			if not _match_0 then -- 230
				return { -- 233
					"no match" -- 233
				} -- 233
			end -- 229
		end -- 228
		local result = handlePath({ -- 234
			"admin", -- 234
			"logs", -- 234
			"view" -- 234
		}) -- 234
		return assert.same(result, { -- 235
			"Resource: logs", -- 235
			"Action: view" -- 235
		}) -- 235
	end) -- 227
	it("should match boolean false correctly", function() -- 237
		local items = { -- 239
			{ -- 239
				x = 100, -- 239
				y = 200 -- 239
			}, -- 239
			{ -- 240
				width = 300, -- 240
				height = 400 -- 240
			}, -- 240
			false -- 241
		} -- 238
		local results = { } -- 243
		for _index_0 = 1, #items do -- 244
			local item = items[_index_0] -- 244
			local _type_0 = type(item) -- 246
			local _tab_0 = "table" == _type_0 or "userdata" == _type_0 -- 246
			local _match_0 = false -- 246
			if _tab_0 then -- 246
				local x = item.x -- 246
				local y = item.y -- 246
				if x ~= nil and y ~= nil then -- 246
					_match_0 = true -- 246
					table.insert(results, "Vec2") -- 247
				end -- 246
			end -- 246
			if not _match_0 then -- 246
				local _match_1 = false -- 248
				if _tab_0 then -- 248
					local width = item.width -- 248
					local height = item.height -- 248
					if width ~= nil and height ~= nil then -- 248
						_match_1 = true -- 248
						table.insert(results, "Size") -- 249
					end -- 248
				end -- 248
				if not _match_1 then -- 248
					if false == item then -- 250
						table.insert(results, "None") -- 251
					end -- 245
				end -- 245
			end -- 245
		end -- 244
		return assert.same(results, { -- 252
			"Vec2", -- 252
			"Size", -- 252
			"None" -- 252
		}) -- 252
	end) -- 237
	it("should handle switch with then syntax", function() -- 254
		local value = "cool" -- 255
		local result -- 256
		if "cool" == value then -- 257
			result = "matched cool" -- 257
		else -- 258
			result = "else branch" -- 258
		end -- 256
		return assert.same(result, "matched cool") -- 259
	end) -- 254
	return it("should handle switch in function call", function() -- 261
		local getValue -- 262
		getValue = function() -- 262
			local _exp_0 = something -- 263
			if 1 == _exp_0 then -- 264
				return "yes" -- 264
			else -- 265
				return "no" -- 265
			end -- 263
		end -- 262
		local something = 1 -- 266
		return assert.same(getValue(), "yes") -- 267
	end) -- 261
end) -- 1
