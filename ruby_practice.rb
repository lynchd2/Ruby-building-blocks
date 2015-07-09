#This version does not take into account case

def c_c(sentence="APPLE ORANGE apple ORANGEZ", num=100000)
	alphabet = ("a".."z").to_a + ("A".."Z").to_a 
	s = sentence.split("")
	new_s = []
	s.each do |letter|
	a_i_of_l = alphabet.index(letter)
		if letter != " "
			if a_i_of_l + num < alphabet.length
				new_s << alphabet[(a_i_of_l + num)]
			else
				new_s << alphabet[num % alphabet.length - a_i_of_l]
			end
		else
			new_s << " "
		end
	end
	p new_s.join
end

c_c