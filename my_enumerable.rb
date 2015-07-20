public
	def my_each
		for i in (0...self.length)
			yield(self[i])
		end

	end


	def my_each_with_index
		for i in (0...self.length)
			yield(i,self[i])
		end
	end

def my_select
	ar = []
	self.my_each {|i| ar << i if yield(i)}
	p ar
end

def my_all?
	count = 0
	self.my_each{|i| count +=1 if yield(i)}
	if count == self.length
		p true
	else
		p false
	end
end

[1,2,6,4,0].my_select{|x| x == 0}
[1,1,1,1,1].my_all?{|x| x == 1}

