#This version does not take into account case

def c_c(sentence="APPLE ORANGE apple ORANGEZ", num=1000)
	alphabet = ("a".."z").to_a + ("A".."Z").to_a
	n_s = sentence.split("")
	alphabet_length = sentence.length
	until num < alphabet_length
		num -= alphabet_length
	end
	answer = n_s.map do |letter|
		if letter == ' '
			' '
		else
			new_index = alphabet.index(letter) + num
			if new_index > alphabet_length
				new_index -= alphabet_length
			end
			alphabet[new_index]
		end
	end
	p answer
end

c_c