# 1:
def fib(n)
	result = [0,1]
	(n - 1).times do 
		result << result[-1] + result[-2]
	end
	p result
end

fib(10)

# 2:

def fibs(n)
	return n if n < 2
	fibs(n - 1) + fibs(n - 2)
end

p fibs(10)