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


def my_any?
	present = false
	self.my_each do |i|
		if yield(i)
			presesnt = true
			break
		end
	end
	p present
end

def my_none?
	present = true
	self.my_each do |i|
		if yield(i)
			present = false
			break
		end
	end
	p present
end

def my_count
	count = 0
	self.my_each{|i| count +=1 if yield(i)}
	p count
end

def my_map(&proc)
	ar = []
	self.my_each {|i| ar << proc.call(i)}
	p ar
end

def my_inject()
	total = self[0]
	self[1..-1].my_each {|i| total = yield(total, i)}
	p total
end

def multiple_els(array)
	array.my_inject {|sum, n| sum * n}
end

##Tests
[1,2,3,5,3].my_each {|x| x}
[1,2,6,4,0].my_select{|x| x > 0}
[1,1,1,1,1].my_all?{|x| x == 1}
[1,5,3,6].my_any?{|x| x == 3}
[1,5,3,6].my_none?{|x| x == 2}
[1,2,3,5,3,6].my_count {|x| x < 6}
[1,2,3,5].my_map {|x| x * 100}
[1,2,3,4].my_inject {|sum, n| sum += n }
multiple_els([5,5,5,5])
##End of Tests
