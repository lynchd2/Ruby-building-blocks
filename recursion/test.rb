def fibs(n)
	return n if n < 2
	fibs(n-1) + fibs(n - 2)
end

p fibs(5)