def stock_picker(array)
	profit = 0
	while array.index(array.max) < array.index(array.min)
		array.slice!(array.index(array.max))
	end
	if array.index(array.max) > array.index(array.min)
		profit = array.max - array.min
	end
	p profit
end

stock_picker([1,409,7,3,7,3,9,1,99])