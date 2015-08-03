class Game
	Player = Struct.new(:name, :symbol)

	def initialize
		get_player
		puts "Ok. #{@player1.name}'s symbol is #{@player1.symbol}"
		puts "And #{@player2.name}'s symbol is #{@player2.symbol}. Let's play!"

	end


	def get_player
		puts "What is your name, Player 1?"
		name1, symbol1 = gets.chomp
		puts "And what is your name, Player 2?"
		name2, symbol2 = gets.chomp
		if rand > 0.5 
			symbol1, symbol2 = "X", 'O' 
		else 
			symbol1, symbol2 = "O", "X"
		end
		@player1 = Player.new(name1, symbol1)
		@player2 = Player.new(name2, symbol2)

	end
	  
	def board
	   	@board = [[1,2,3],[4,5,6],[7,8,9]]
	end

	  def print_board
	  	count = 2
	  	puts "\n"
	  	board.each do |row|
	  		puts row.join("  |  ")
	  		unless count == 0
	  			puts "---+-----+----"
	  			count -=1
	  		end
	  	end
	  	puts "\n"
	  end

	  def end
	  end
end
	  Game.new.end