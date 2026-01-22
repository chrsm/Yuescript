local target = {
	val = 1,
	add = function(self, n)
		self.val = self.val + n
		return self.val
	end
}
local result
do
	local val = 100
	add(2)
	result = target
end
return print(result, target.val)
