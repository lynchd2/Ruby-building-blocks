class Board
	attr_reader :dictionary, :board, :answer
	def initialize
		@dictionary = File.new("/home/dylan/Programming/hangman/dictionary.txt")
		@board = []
	end

	def random_answer
		random_number = rand(dictionary.readlines.length)
		dictionary.rewind
		@answer = dictionary.readlines[random_number].strip
	end

	def hangman_board
		@answer.length.times do
			@board << ""
		end
		p @board
	end

end

x = Board.new
p x.random_answer
x.hangman_board