require 'yaml'

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

	def answer_on_board
		@answer.split("")
	end

	def hangman_board
		@answer.length.times do
			@board << ""
		end
		@board
	end

end


class Game
	attr_reader :board, :answer, :player_guess
	def initialize
		@body = 6
		puts "Welcome to Hangman! Make sure to input"
		puts "only one letter at a time"
		puts "Enter 'load' to load a prior game save. Have fun!"
		puts "\n"
	end

private
	def active_board_answer
		x = Board.new
		@random_answer = x.random_answer
		@board = x.hangman_board
		@answer = x.answer_on_board
	end

	def check_correct_guess
		answer.each_with_index do |letter, index|
			if letter == @player_guess
				board[index] = letter
			end
		end
	end

	def check_incorrect_guess
		if !answer.include?(player_guess)
			@body -= 1
			if player_guess == "save" || player_guess == "load"
				@body += 1
			end
		end
	end

	def guess
		@player_guess = gets.chomp.to_s.downcase
		unless ('a'..'z').include?(@player_guess) || (player_guess == "save" || player_guess == "load")
			puts "Invalid. Try again"
			p @board
			@player_guess = gets.chomp.to_s.downcase
		end
	end

	def check_win_lose
		if @body == 0
			puts "YOU LOSE!"
			exit
		elsif @answer == @board
			puts "YOU WIN!"
			exit
		end
	end

	def save_or_load
		if @player_guess == "save"
			save_game
		elsif @player_guess == "load"
			@body += 1
			puts "LOADED GAME BELOW"
			load_game
		end
	end

public
	def play
		active_board_answer
		until @body == 0
			save_or_load
			puts "You have #{@body} guesses left. Please pick a letter"
			p @board
			guess
			check_correct_guess
			check_incorrect_guess
			check_win_lose
		end
	end

def load_game
	puts "\n" * 5
	filename = File.open('games/game_save.yaml','r') {|file|file.read}
	YAML.load(filename).play
end

def save_game
	Dir.mkdir('games') if !Dir.exists?('games')
	filename = 'games/game_save.yaml'
	File.open(filename,'w') do |file|
		file.write YAML.dump(self)
	end
end
end

game = Game.new
game.play