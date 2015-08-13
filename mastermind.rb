	class Board
		attr_reader :board

		def initialize()
			@colors = [:red, :yellow, :blue, :green, :black, :white]
			@board = []

		end

		def fill_answer_board
			until board.length == 4
				board.push(@colors[rand(5)])
			end
		end
end

class Player
	attr_accessor :name
	def initialize
		puts "What's your name?"
		@name = gets.chomp
	end
end

class Game
	attr_accessor :new_player, :new_board
	def initialize
		@new_board = Board.new
		@new_player = Player.new
	end
	def introduction
		puts "Well, #{new_player.name}. We are going to play Mastermind."
		puts "There are six colors to choose from: Red, Yellow, Blue,"
		puts "Green, Black and White. You are going to choose four colors"
		puts "Each turn, and you will have total of nine turns to guess"
		puts "The correct position of each color. If you get the position "
		puts "and color correct, you will be notifed accordingly. Good luck!"
	end

	def turn_count(turn_number)
		puts "You have #{turn_number} guesses left"
	end

	def turn
		guess = 9
		until guess == 0
			turn_count(guess)
			guess -= 1
		end
	end


	def play
		introduction
		turn
	end
end
a = Game.new
a.play
