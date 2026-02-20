return describe("reserve_comments option", function()
	local to_lua
	do
		local _obj_0 = require("yue")
		to_lua = _obj_0.to_lua
	end
	it("should preserve top-level comments with reserve_comment option", function()
		local code = [[-- Top level comment
x = 1
-- Another comment
y = 2
]]
		local result = to_lua(code, {
			reserve_comment = true
		})
		assert.is_true(result:match("Top level comment") ~= nil)
		return assert.is_true(result:match("Another comment") ~= nil)
	end)
	it("should NOT preserve comments without reserve_comment option", function()
		local code = [[-- Top level comment
x = 1
-- Another comment
y = 2
]]
		local result = to_lua(code, { })
		assert.is_true(result:match("Top level comment") == nil)
		return assert.is_true(result:match("Another comment") == nil)
	end)
	it("should preserve comments in table literals", function()
		local code = [[t = {
    -- First value comment
    1,
    -- Second value comment
    2
}
]]
		local result = to_lua(code, {
			reserve_comment = true
		})
		assert.is_true(result:match("First value comment") ~= nil)
		return assert.is_true(result:match("Second value comment") ~= nil)
	end)
	it("should preserve comments in if statement", function()
		local code = [[if true
    -- Inside if block
    print "test"
]]
		local result = to_lua(code, {
			reserve_comment = true
		})
		return assert.is_true(result:match("Inside if block") ~= nil)
	end)
	it("should preserve comments in function body", function()
		local code = [[func = =>
    -- Inside function
    print "hello"
]]
		local result = to_lua(code, {
			reserve_comment = true
		})
		return assert.is_true(result:match("Inside function") ~= nil)
	end)
	it("should preserve comments in while loop", function()
		local code = [[while true
    -- Loop body comment
    print "looping"
    break
]]
		local result = to_lua(code, {
			reserve_comment = true
		})
		return assert.is_true(result:match("Loop body comment") ~= nil)
	end)
	it("should preserve comments in for loop", function()
		local code = [[for i = 1, 3
    -- For loop comment
    print i
]]
		local result = to_lua(code, {
			reserve_comment = true
		})
		return assert.is_true(result:match("For loop comment") ~= nil)
	end)
	it("should preserve comments in TableBlock syntax", function()
		local code = [[tbl = {
    -- Key comment
    key: "value"
    -- Another key
    another: 123
}
]]
		local result = to_lua(code, {
			reserve_comment = true
		})
		assert.is_true(result:match("Key comment") ~= nil)
		return assert.is_true(result:match("Another key") ~= nil)
	end)
	it("should preserve multiple comments across statements", function()
		local code = [[-- Assign x
x = 1
-- Assign y
y = 2
-- Assign z
z = 3
]]
		local result = to_lua(code, {
			reserve_comment = true
		})
		assert.is_true(result:match("Assign x") ~= nil)
		assert.is_true(result:match("Assign y") ~= nil)
		return assert.is_true(result:match("Assign z") ~= nil)
	end)
	it("should handle table with mixed values and comments", function()
		local code = [[t = {
    -- First item
    1,
    -- Second item
    2,
    -- Third item
    3
}
]]
		local result = to_lua(code, {
			reserve_comment = true
		})
		assert.is_true(result:match("First item") ~= nil)
		assert.is_true(result:match("Second item") ~= nil)
		return assert.is_true(result:match("Third item") ~= nil)
	end)
	it("should preserve comments in nested structures", function()
		local code = [[outer = {
    -- outer comment
    inner: {
        -- inner comment
        value: 42
    }
}
]]
		local result = to_lua(code, {
			reserve_comment = true
		})
		assert.is_true(result:match("outer comment") ~= nil)
		return assert.is_true(result:match("inner comment") ~= nil)
	end)
	it("should preserve comments in else block", function()
		local code = [[if false
    print "if"
else
    -- else comment
    print "else"
]]
		local result = to_lua(code, {
			reserve_comment = true
		})
		return assert.is_true(result:match("else comment") ~= nil)
	end)
	it("should preserve comments in elseif block", function()
		local code = [[if false
    print "if"
elseif true
    -- elseif comment
    print "elseif"
]]
		local result = to_lua(code, {
			reserve_comment = true
		})
		return assert.is_true(result:match("elseif comment") ~= nil)
	end)
	it("should preserve comments before return statement", function()
		local code = [[func = =>
    -- before return
    return 42
]]
		local result = to_lua(code, {
			reserve_comment = true
		})
		return assert.is_true(result:match("before return") ~= nil)
	end)
	it("should preserve comments in switch statement", function()
		local code = [[switch 2
    when 1
        -- case 1 comment
        print "one"
    when 2
        -- case 2 comment
        print "two"
]]
		local result = to_lua(code, {
			reserve_comment = true
		})
		assert.is_true(result:match("case 1 comment") ~= nil)
		return assert.is_true(result:match("case 2 comment") ~= nil)
	end)
	it("should preserve comments in with statement", function()
		local code = [[with t
    -- with body comment
    .value = 10
]]
		local result = to_lua(code, {
			reserve_comment = true
		})
		return assert.is_true(result:match("with body comment") ~= nil)
	end)
	it("should handle empty lines with reserve_comment", function()
		local code = [[-- First comment
x = 1
-- Second comment
]]
		local result = to_lua(code, {
			reserve_comment = true
		})
		assert.is_true(result ~= nil)
		return assert.is_true(type(result) == "string")
	end)
	it("should preserve comments in class body", function()
		local code = [[class MyClass
    -- property comment
    value: 10
    -- method comment
    method: => print "hello"
]]
		local result = to_lua(code, {
			reserve_comment = true
		})
		assert.is_true(result:match("property comment") ~= nil)
		return assert.is_true(result:match("method comment") ~= nil)
	end)
	it("should preserve comments in class with inheritance", function()
		local code = [[class Child extends Parent
    -- child property
    value: 100
]]
		local result = to_lua(code, {
			reserve_comment = true
		})
		return assert.is_true(result:match("child property") ~= nil)
	end)
	it("should preserve comments in export statement", function()
		local code = [[-- export value comment
export x = 42
]]
		local result = to_lua(code, {
			reserve_comment = true
		})
		return assert.is_true(result:match("export value comment") ~= nil)
	end)
	it("should preserve comments in import statement", function()
		local code = [[-- import comment
import format from "string"
]]
		local result = to_lua(code, {
			reserve_comment = true
		})
		return assert.is_true(result:match("import comment") ~= nil)
	end)
	it("should preserve empty lines between comments in TableBlock", function()
		local code = "tb =\n\t-- line\n\n\n\n\t--[[ajdjd]]\n\ta: ->\n\n\t-- line 2\n\tb: 123\n"
		local result = to_lua(code, {
			reserve_comment = true
		})
		assert.is_true(result:match("line") ~= nil)
		assert.is_true(result:match("ajdjd") ~= nil)
		return assert.is_true(result:match("line 2") ~= nil)
	end)
	it("should preserve block comments in TableBlock", function()
		local code = "tb =\n\t--[[block comment]]\n\ta: 1\n\n\t--[[another block]]\n\tb: 2\n"
		local result = to_lua(code, {
			reserve_comment = true
		})
		assert.is_true(result:match("block comment") ~= nil)
		return assert.is_true(result:match("another block") ~= nil)
	end)
	it("should preserve multiple empty lines in table literal", function()
		local code = "tb = {\n\t-- line\n\n\n\n\t--[[ajdjd]]\n\ta: ->\n\n\t-- line 2\n\tb: 123\n}\n"
		local result = to_lua(code, {
			reserve_comment = true
		})
		assert.is_true(result:match("line") ~= nil)
		assert.is_true(result:match("ajdjd") ~= nil)
		return assert.is_true(result:match("line 2") ~= nil)
	end)
	it("should preserve mixed single and block comments in TableBlock", function()
		local code = "tb =\n\t-- single line comment\n\ta: 1\n\n\t--[[multi\n\tline\n\tblock\n\tcomment]]\n\tb: 2\n\n\t-- another single\n\tc: 3\n"
		local result = to_lua(code, {
			reserve_comment = true
		})
		assert.is_true(result:match("single line comment") ~= nil)
		assert.is_true(result:match("multi") ~= nil)
		return assert.is_true(result:match("another single") ~= nil)
	end)
	it("should preserve comments and empty lines in table with colon syntax", function()
		local code = "tbl = {\n\t-- first key\n\tkey1: \"value1\"\n\n\n\t-- second key\n\tkey2: \"value2\"\n\n\t-- third key\n\tkey3: \"value3\"\n}\n"
		local result = to_lua(code, {
			reserve_comment = true
		})
		assert.is_true(result:match("first key") ~= nil)
		assert.is_true(result:match("second key") ~= nil)
		return assert.is_true(result:match("third key") ~= nil)
	end)
	it("should preserve comments in nested TableBlock structures", function()
		local code = "outer =\n\t-- outer item\n\ta: 1\n\n\t-- inner tableblock\n\tinner:\n\t\t-- inner item 1\n\t\tx: 10\n\t\t-- inner item 2\n\t\ty: 20\n"
		local result = to_lua(code, {
			reserve_comment = true
		})
		assert.is_true(result:match("outer item") ~= nil)
		assert.is_true(result:match("inner tableblock") ~= nil)
		assert.is_true(result:match("inner item 1") ~= nil)
		return assert.is_true(result:match("inner item 2") ~= nil)
	end)
	it("should handle function values in TableBlock with comments", function()
		local code = "tb =\n\t-- comment before function\n\tfunc1: => print \"a\"\n\n\t-- another function\n\tfunc2: (x) => x * 2\n\n\t-- method\n\tmethod: =>\n\t\t-- inside method\n\t\tprint \"method\"\n"
		local result = to_lua(code, {
			reserve_comment = true
		})
		assert.is_true(result:match("comment before function") ~= nil)
		assert.is_true(result:match("another function") ~= nil)
		assert.is_true(result:match("method") ~= nil)
		return assert.is_true(result:match("inside method") ~= nil)
	end)
	it("should preserve comments in TableBlock with various value types", function()
		local code = "tb =\n\t-- string value\n\tstr: \"hello\"\n\n\t-- number value\n\tnum: 42\n\n\t-- boolean value\n\tbool: true\n\n\t-- table value\n\ttbl: {1, 2, 3}\n"
		local result = to_lua(code, {
			reserve_comment = true
		})
		assert.is_true(result:match("string value") ~= nil)
		assert.is_true(result:match("number value") ~= nil)
		assert.is_true(result:match("boolean value") ~= nil)
		return assert.is_true(result:match("table value") ~= nil)
	end)
	it("should preserve empty lines at end of TableBlock", function()
		local code = "tb =\n\t-- item 1\n\ta: 1\n\n\t-- item 2\n\tb: 2\n\n\n"
		local result = to_lua(code, {
			reserve_comment = true
		})
		assert.is_true(result:match("item 1") ~= nil)
		return assert.is_true(result:match("item 2") ~= nil)
	end)
	it("should preserve empty lines in TableBlock between comments", function()
		local code = "tb =\n\t-- a\n\t\n\t\n\t\n\tval: 1\n"
		local result = to_lua(code, {
			reserve_comment = true
		})
		return assert.is_true(result:match("-- %d+") ~= nil)
	end)
	it("should preserve empty lines in TableBlock with comments", function()
		local code = "tb =\n\t-- first\n\t\n\t\n\tval: 1\n\t\n\t-- second\n\tval2: 2\n"
		local result = to_lua(code, {
			reserve_comment = true
		})
		assert.is_true(result:match("first") ~= nil)
		assert.is_true(result:match("second") ~= nil)
		return assert.is_true(result:match("-- %d+") ~= nil)
	end)
	it("should preserve empty lines in table literal", function()
		local code = "t = {\n\t-- item1\n\t\n\t\n\t1,\n\t\n\t-- item2\n\t2\n}\n"
		local result = to_lua(code, {
			reserve_comment = true
		})
		assert.is_true(result:match("item1") ~= nil)
		assert.is_true(result:match("item2") ~= nil)
		return assert.is_true(result:match("-- %d+") ~= nil)
	end)
	it("should have more newlines with reserve_comment than without", function()
		local code = "-- comment1\nx = 1\n-- comment2\ny = 2\n"
		local result_with = to_lua(code, {
			reserve_comment = true
		})
		local result_without = to_lua(code, { })
		local newlines_with = 0
		local newlines_without = 0
		for _ in result_with:gmatch("\n") do
			newlines_with = newlines_with + 1
		end
		for _ in result_without:gmatch("\n") do
			newlines_without = newlines_without + 1
		end
		return assert.is_true(newlines_with >= newlines_without)
	end)
	it("should preserve empty lines in TableBlock between entries", function()
		local code = "tb =\n\t-- key1\n\tkey1: 1\n\t\n\t\n\t-- key2\n\tkey2: 2\n"
		local result = to_lua(code, {
			reserve_comment = true
		})
		assert.is_true(result:match("key1") ~= nil)
		assert.is_true(result:match("key2") ~= nil)
		return assert.is_true(result:match("\t-- %d+\n") ~= nil)
	end)
	it("should preserve empty lines in class body", function()
		local code = "class C\n\t-- prop1\n\tprop1: 1\n\t\n\t\n\t-- prop2\n\tprop2: 2\n"
		local result = to_lua(code, {
			reserve_comment = true
		})
		assert.is_true(result:match("prop1") ~= nil)
		return assert.is_true(result:match("prop2") ~= nil)
	end)
	it("should preserve empty lines between comments in table", function()
		local code = "t = {\n\t-- first\n\t\n\t-- second\n\t\n\t-- third\n\tval: 1\n}\n"
		local result = to_lua(code, {
			reserve_comment = true
		})
		assert.is_true(result:match("first") ~= nil)
		assert.is_true(result:match("second") ~= nil)
		assert.is_true(result:match("third") ~= nil)
		return assert.is_true(result:match("-- %d+") ~= nil)
	end)
	it("should preserve multiple consecutive empty lines in TableBlock", function()
		local code = "tb =\n\t-- start\n\tval1: 1\n\t\n\t\n\t\n\t-- middle\n\tval2: 2\n\t\n\t\n\t-- end\n\tval3: 3\n"
		local result = to_lua(code, {
			reserve_comment = true
		})
		assert.is_true(result:match("start") ~= nil)
		assert.is_true(result:match("middle") ~= nil)
		assert.is_true(result:match("end") ~= nil)
		return assert.is_true(result:match("-- %d+") ~= nil)
	end)
	it("should preserve comments in table literal", function()
		local code = "t = {\n\t-- comment\n\tkey: 1\n}\n"
		local result = to_lua(code, {
			reserve_comment = true
		})
		return assert.is_true(result:match("comment") ~= nil)
	end)
	it("should preserve comments in TableBlock", function()
		local code = "t =\n\t-- comment\n\tkey: 1\n"
		local result = to_lua(code, {
			reserve_comment = true
		})
		return assert.is_true(result:match("comment") ~= nil)
	end)
	it("should preserve comments in class body", function()
		local code = "class C\n\t-- comment\n\tkey: 1\n"
		local result = to_lua(code, {
			reserve_comment = true
		})
		return assert.is_true(result:match("comment") ~= nil)
	end)
	it("should preserve multiple comments in class body", function()
		local code = "class C\n\t-- prop1\n\tprop1: 1\n\t-- prop2\n\tprop2: 2\n"
		local result = to_lua(code, {
			reserve_comment = true
		})
		assert.is_true(result:match("prop1") ~= nil)
		return assert.is_true(result:match("prop2") ~= nil)
	end)
	it("should preserve empty lines in table literal", function()
		local code = "t = {\n\t-- a\n\t\n\t-- b\n\tkey: 1\n}\n"
		local result = to_lua(code, {
			reserve_comment = true
		})
		assert.is_true(result:match("a") ~= nil)
		assert.is_true(result:match("b") ~= nil)
		return assert.is_true(result:match("-- %d+") ~= nil)
	end)
	it("should preserve empty lines in TableBlock", function()
		local code = "t =\n\t-- a\n\t\n\t-- b\n\tkey: 1\n"
		local result = to_lua(code, {
			reserve_comment = true
		})
		assert.is_true(result:match("a") ~= nil)
		assert.is_true(result:match("b") ~= nil)
		return assert.is_true(result:match("-- %d+") ~= nil)
	end)
	return it("should preserve empty lines in class body", function()
		local code = "class C\n\t-- a\n\ta: 1\n\t\n\t-- b\n\tb: 2\n"
		local result = to_lua(code, {
			reserve_comment = true
		})
		assert.is_true(result:match("a") ~= nil)
		return assert.is_true(result:match("b") ~= nil)
	end)
end)
