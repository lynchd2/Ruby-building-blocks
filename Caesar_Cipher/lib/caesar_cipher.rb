def c_c(sentence, number)
	l_alphabet = ("a".."z").to_a
	u_alphabet = ("A".."Z").to_a
	until number <= 26
		number -= 25
	end
	sentence = sentence.split("").map do |letter|
		if l_alphabet.include?(letter)
			l_alphabet[number - 26 + l_alphabet.index(letter)]
		elsif u_alphabet.include?(letter)
			u_alphabet[number - 26 + u_alphabet.index(letter)]
		else
			letter
		end
	end
	sentence.join
end