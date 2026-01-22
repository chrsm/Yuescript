local list = {
	1,
	2,
	3
}
local pairs
do
	local _accum_0 = { }
	local _len_0 = 1
	for _index_0 = 1, #list do
		local i = list[_index_0]
		if i % 2 == 1 then
			for _index_1 = 1, #list do
				local j = list[_index_1]
				if j > i then
					_accum_0[_len_0] = tostring(i) .. "-" .. tostring(j)
					_len_0 = _len_0 + 1
				end
			end
		end
	end
	pairs = _accum_0
end
return print(table.concat(pairs, ","))
