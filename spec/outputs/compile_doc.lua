local outputFolder = ...
local _list_0 = {
	{
		"codes_from_doc.lua",
		{
			"doc/docs/doc/introduction.md",
			"doc/docs/doc/macro.md",
			"doc/docs/doc/operator.md",
			"doc/docs/doc/module.md",
			"doc/docs/doc/assignment.md",
			"doc/docs/doc/destructuring-assignment.md",
			"doc/docs/doc/if-assignment.md",
			"doc/docs/doc/varargs-assignment.md",
			"doc/docs/doc/whitespace.md",
			"doc/docs/doc/comment.md",
			"doc/docs/doc/try.md",
			"doc/docs/doc/attributes.md",
			"doc/docs/doc/literals.md",
			"doc/docs/doc/function-literals.md",
			"doc/docs/doc/backcalls.md",
			"doc/docs/doc/table-literals.md",
			"doc/docs/doc/comprehensions.md",
			"doc/docs/doc/for-loop.md",
			"doc/docs/doc/while-loop.md",
			"doc/docs/doc/continue.md",
			"doc/docs/doc/conditionals.md",
			"doc/docs/doc/line-decorators.md",
			"doc/docs/doc/switch.md",
			"doc/docs/doc/object-oriented-programming.md",
			"doc/docs/doc/with-statement.md",
			"doc/docs/doc/do.md",
			"doc/docs/doc/function-stubs.md",
			"doc/docs/doc/the-using-clause-controlling-destructive-assignment.md"
		}
	},
	{
		"codes_from_doc_zh.lua",
		{
			"doc/docs/zh/doc/introduction.md",
			"doc/docs/zh/doc/macro.md",
			"doc/docs/zh/doc/operator.md",
			"doc/docs/zh/doc/module.md",
			"doc/docs/zh/doc/assignment.md",
			"doc/docs/zh/doc/destructuring-assignment.md",
			"doc/docs/zh/doc/if-assignment.md",
			"doc/docs/zh/doc/varargs-assignment.md",
			"doc/docs/zh/doc/whitespace.md",
			"doc/docs/zh/doc/comment.md",
			"doc/docs/zh/doc/try.md",
			"doc/docs/zh/doc/attributes.md",
			"doc/docs/zh/doc/literals.md",
			"doc/docs/zh/doc/function-literals.md",
			"doc/docs/zh/doc/backcalls.md",
			"doc/docs/zh/doc/table-literals.md",
			"doc/docs/zh/doc/comprehensions.md",
			"doc/docs/zh/doc/for-loop.md",
			"doc/docs/zh/doc/while-loop.md",
			"doc/docs/zh/doc/continue.md",
			"doc/docs/zh/doc/conditionals.md",
			"doc/docs/zh/doc/line-decorators.md",
			"doc/docs/zh/doc/switch.md",
			"doc/docs/zh/doc/object-oriented-programming.md",
			"doc/docs/zh/doc/with-statement.md",
			"doc/docs/zh/doc/do.md",
			"doc/docs/zh/doc/function-stubs.md",
			"doc/docs/zh/doc/the-using-clause-controlling-destructive-assignment.md"
		}
	}
}
for _index_0 = 1, #_list_0 do
	local _des_0 = _list_0[_index_0]
	local compiledFile, docFiles = _des_0[1], _des_0[2]
	local codes = { }
	for _index_1 = 1, #docFiles do
		local docFile = docFiles[_index_1]
		local input
		local _with_0 = io.open(docFile)
		if _with_0 ~= nil then
			local to_lua = require("yue").to_lua
			local text = _with_0:read("*a")
			for code in text:gmatch("```yuescript[\r\n]+(.-)```[^%w]") do
				local result, err = to_lua(code, {
					implicit_return_root = false,
					reserve_line_number = false
				})
				if result then
					codes[#codes + 1] = result
				elseif not err:match("macro exporting module only accepts macro definition") then
					print(err)
					os.exit(1)
				end
			end
			for code in text:gmatch("```yue[\r\n]+(.-)```[^%w]") do
				local result, err = to_lua(code, {
					implicit_return_root = false,
					reserve_line_number = false
				})
				if result then
					codes[#codes + 1] = result
				else
					print(err)
					os.exit(1)
				end
			end
		end
		input = _with_0
		local _close_0 <close> = input
	end
	local output
	local _with_0 = io.open(tostring(outputFolder) .. "/" .. tostring(compiledFile), "w+")
	_with_0:write(table.concat(codes))
	output = _with_0
	local _close_0 <close> = output
end
