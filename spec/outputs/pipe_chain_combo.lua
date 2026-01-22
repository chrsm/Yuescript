local f1
f1 = function(x)
	return x + 2
end
local f2
f2 = function(x)
	return x * 3
end
local value = print(tostring(f2(f1(3))))
