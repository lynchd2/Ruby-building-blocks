	class Board
		attr_reader :board, :colors

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
	attr_reader :name
	def initialize
		puts "What's your name?"
		@name = gets.chomp
	end
end

class Game
	attr_reader :new_player, :new_board, :guess_number
	def initialize
		@new_board = Board.new
		@new_player = Player.new
		@guess_number = 2
	end
	def introduction
		new_board.fill_answer_board
		puts "Well, #{new_player.name}. We are going to play Mastermind."
		puts "There are six colors to choose from: Red, Yellow, Blue,"
		puts "Green, Black and White. You are going to choose four colors"
		puts "Each turn, and you will have total of nine turns to guess"
		puts "The correct position of each color. If you get the position "
		puts "and color correct, you will be notifed accordingly. Good luck!"
	end

	def turn_count(guess_number)
		puts "You have #{guess_number} guesses left"
	end
	

	def guess
		puts "Please choose a color and press 'ENTER'."
		puts "You will do this four times."
		guess_array = []
		until guess_array.length == 4
			color_guess = gets.chomp.intern.downcase
			check_guess(color_guess, guess_array)
		end
		p guess_array
		check_answer(guess_array)
	end

	def check_guess(color_guess, guess_array)
		new_board.colors.any? do |color|
			if color_guess == color
				guess_array << color
			#need to add something to tell "try again"
			end
		end
	end

	def check_answer(guess_array)
		count = 0
		p new_board.board
		until count == 4
		new_board.board.each_with_index do |color,index|
				if guess_array[count] == color
					if new_board.board.index(color) == guess_array.index(guess_array[count])
						puts "#{color} is in the right place at the #{index} index"
					end
				end
				count += 1
			end
		end

	end

	def turn(guess_number)
		until guess_number == 0
			turn_count(guess_number)
			guess
			guess_number -= 1
		end
	end


	def play
		introduction
		turn(guess_number)
		#THIS NEEDS TO BE FIXED
		if guess_number != 0
			puts "GAME OVER!"
			puts "The answer was #{new_board.board}"
		else
			puts "YOU GUESSED CORRECTLY! CONGRATS!"
		end
	end
end

a = Game.new
a.play
