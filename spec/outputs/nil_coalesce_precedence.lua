local a = nil
local b = false
local c = 0
local x
if a ~= nil then
	x = a
else
	do
		local _exp_0 = (b and 1)
		if _exp_0 ~= nil then
			x = _exp_0
		else
			x = (c or 2)
		end
	end
end
local y = ((function()
	if a ~= nil then
		return a
	else
		return b
	end
end)()) and 1 or 2
return print(x, y)
