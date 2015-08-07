class Game
	attr_accessor :board
	class Player 
		attr_reader :name, :symbol
		def initialize(name, symbol)
			@name = name
			@symbol = symbol
		end
	end

	def initialize
		get_player
		puts "Ok. #{@player1.name}'s symbol is #{@player1.symbol}"
		puts "And #{@player2.name}'s symbol is #{@player2.symbol}. Let's play!"
		@count = 9
		@board = board

	end

	def check_win
		win = [[0, 1 ,2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
			   [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
		p @board
		win.each do |i|
			i.all? do |x| 
				if @board[x] == :X
					puts "Win"
				end
			end
		end
	end

	def get_player
		puts "What is your name, Player 1?"
		name1, symbol1 = gets.chomp
		puts "And what is your name, Player 2?"
		name2, symbol2 = gets.chomp
		if rand > 0.5 
			symbol1, symbol2 = :X, :O
		else 
			symbol1, symbol2 = :O, :X
		end
		@player1 = Player.new(name1, symbol1)
		@player2 = Player.new(name2, symbol2)

	end
	  
	def board
	   	@board = [1,2,3,4,5,6,7,8,9]
	end

	  def print_board
	  	count = 2
	  	puts "\n"
	  	@board.each_slice(3) do |row|
	  		puts row.join("  |  ")
	  		unless count == 0
	  			puts "---+-----+----"
	  			count -=1
	  		end
	  	end
	  	puts "\n"
	  end

	  def play
	  	until @count == 0
		  	if @count % 2 != 0
		  		current_player = @player1
		  		print_board
		  		puts "#{current_player.name} who has #{current_player.symbol}: please pick a number on the board for your move:"
		  		move = gets.chomp.to_i
		  		check_move(move, current_player)
		  		@count -= 1
		  		check_win

		  	else
		  		current_player = @player2
		  		print_board
		  		puts "#{current_player.name} who has #{current_player.symbol}: please pick a number on the board for your move"
		  		move = gets.chomp.to_i
		  		check_move(move, current_player)
		  		@count -= 1
		  		check_win
	  		end
	  	end
	  	print_board
	  	puts "The game ended in a tie!"

	  end

	  def check_move(move, player)
	  		if @board[move - 1] != :X && @board[move - 1] != :O
	  			@board[move - 1] = player.symbol
	  		elsif @board[move - 1] == :X
	  			puts "Someone already put it there. Try again."
	  			@count += 1
	  		elsif @board[move - 1] == :O
	  			puts "Someone already moved there. Try again."
	  			@count += 1
	  		end
	  end
end

Game.new.play