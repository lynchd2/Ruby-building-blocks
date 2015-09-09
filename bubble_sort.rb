def bubble_sort(ar)
	swapped = true
	while swapped
		swapped = false
		for i in (0..ar.length - 2)
			 if ar[i] > ar[i+1]
			 	ar[i], ar[i+1] = ar[i+1], ar[i] 				
			 	swapped = true
			 end
		end
	end
	p ar
end


def bubble_sort_by(ar)
	swapped = true
	while swapped
		swapped = false
		for i in (0..ar.length - 2)
			if yield(ar[i], ar[i+1]) < 0
			 	ar[i], ar[i+1] = ar[i+1], ar[i] 		
				swapped = true
			end
		end
	end
	p ar
end

 bubble_sort([1,2,5,6,4,2])
 bubble_sort_by(["this","should","sort","by","length"]) {|l,r| r.length - l.length}