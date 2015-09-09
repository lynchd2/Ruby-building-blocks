def test
	a = [:blue,:red,:blue,:blue]
	b = [:blue,:blue,:red,:red]
	a.each_with_index do |num1,index1|
		b.each_with_index do |num2, index2|
			if (num1 == num2) && (index1 == index2)
				puts "They are the same number and index"
				a.delete_at(index1)
				p a
			elsif (num1 == num2) && (index1 != index2)
				puts "They are the same number but different index"
				a.delete_at(index2)
				p a
			end
		end
	end
end

test()