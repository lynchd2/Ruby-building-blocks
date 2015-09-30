def merge_sort(arr)
	return arr if arr.length == 1
	a = arr[0..(arr.length / 2) - 1]
	b = arr[arr.length / 2..-1]
	left = merge_sort(a)
	right = merge_sort(b)
	sorted = []

	until (left.length == 0 || right.length == 0)
		left.first >= right.first ? sorted << right.shift : sorted << left.shift
	end

	return sorted + left + right 
end
p merge_sort([5,4,3,7,6,8])
