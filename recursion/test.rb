def flat(arr)
	p arr if arr.flatten == arr.flatten!.flatten
	flat(arr.flatten!)
end

flat([[1, [8, 9]], [3, 4]])