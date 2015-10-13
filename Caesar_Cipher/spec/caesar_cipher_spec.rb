require './lib/caesar_cipher.rb'

describe 'c_c' do 
	it 'transcribes the given string by five letters' do
		c_c("a", 5).should eql 'f'
	end

	it 'transcribes the given string by 25 letters' do
		c_c('bbb', 26).should eql 'bbb'
	end

	it 'transcribes the given string by 0 letters' do
		c_c('$#@@^$', 12).should eql '$#@@^$'
	end

	it 'transcribes this normal sentence to all uppder case' do
		c_c('this is a sentence', 51).should eql 'this is a sentence'
	end

	it 'transcirbes this normal sentence to all downcase' do
		c_c('THIS IS A SENTENCE', 51).should eql 'THIS IS A SENTENCE'
	end

end


