def substrings(sentence, dictionary)
	frequency = Hash.new(0)
	s_array = sentence.split(" ")
	s_array.each {|word| frequency[word.to_sym] = frequency[word.to_sym] + 1 }
	p frequency
end

substrings("This is a sentence sentence", ['hello', 'this'])