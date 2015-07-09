=begin
The code works. Just need to figure out
how to start from the beginning of the alphabet array 
if a letter from the sentence is at
the end of the index in the alphabet aray
=end

def c_c(sentence="Sentence test", num=2)
	alphabet = ("a".."z").to_a + ("A".."Z").to_a 
	s = sentence.split("")
	new_s = []
	s.each do |letter|
		if letter != " "
			new_s << alphabet[(alphabet.index(letter) + num)]
		else
			new_s << " "
		end
	end
	p new_s.join
end

c_c