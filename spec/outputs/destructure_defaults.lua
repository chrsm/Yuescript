local t = {
	a = 1,
	b = {
		c = 3
	},
	d = nil
}
local a, c, d, e = t.a, t.b.c, t.b.d, t.e
if d == nil then
	d = 4
end
if e == nil then
	e = 5
end
return print(a, c, d, e)
