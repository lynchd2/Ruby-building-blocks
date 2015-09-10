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
		p @answer
	end

	def answer_on_board
		p @answer.split("")
	end

	def hangman_board
		@answer.length.times do
			@board << ""
		end
		p @board
	end

end


class Game
	attr_reader :board, :answer, :player_guess
	def initialize(body)
		x = Board.new
		x.random_answer
		@answer = x.answer_on_board
		@board = x.hangman_board
		puts "You have five guessess left. Please pick a letter"
		@body = body
	end

	def check_guess
		answer.each_with_index do |letter, index|
			if letter == player_guess
				board[index] = letter
			end
		end
	end

	def guess
		@player_guess = gets.chomp
	end

	def play
		until body == 0
			guess
			check_guess
			p @board
			body -= 1
			p body
		end
	end

end


game = Game.new
game.play
