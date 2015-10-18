class Player
	attr_accessor :color, :y, :name

	def initialize(color)
		@color = color
		puts "Please tell me your name"
		@name = gets.chomp
		
	end

	def move
		print "Please provide the column, from 1-6,"
		puts " of your move"
		@y = gets.chomp.to_i
	end

end

class Piece
	attr_accessor :color

	def initialize(color)
		@color = color
	end
end

class Board
	attr_accessor :board

	def initialize()
		@board = [
		['_','_','_','_','_','_','_'],
		['_','_','_','_','_','_','_'],
		['_','_','_','_','_','_','_'],
		['_','_','_','_','_','_','_'],
		['_','_','_','_','_','_','_'],
		['_','_','_','_','_','_','_']

		]	
	end

	def view_board
		@board.each do |row|
			print "#{row}\n"
		end
		puts '  1    2    3    4    5    6    7'
	end

end


class Game
	attr_accessor :board, :i, :win

	def initialize(board)
		@board = board
		@win = false
	end


	def make_move(y_column, board, piece_color)
		i = 5
		until i == -1
			if board[i][y_column - 1] !=  '_'
				i -= 1
			else
				board[i][y_column - 1] = piece_color
				break
			end
		end
	end

	def diagonal_win_contant_backwards(row, col, count, player, player_color)	
		until row == -1 || col == -1
			if @board[row][col] == player_color
				row -= 1
				col -= 1
				count += 1
				if count == 4
					puts "#{player} won diagonally!"
					@win = true
				end
			else
				row -= 1
				col -= 1
				count = 0
			end
		end
	end

	def diagonal_win_contant_forwards(row, col, count, player, player_color)	
		until row == -1 || col == 6
			if @board[row][col] == player_color
				row -= 1
				col += 1
				count += 1
				if count == 4
					puts "#{player} won diagonally!"
					@win = true
				end
			else
				row -= 1
				col += 1
				count = 0
			end
		end
	end

	def check_win(player, player_color)
		#diagonal backwards for row 2 and 3
		stopper = 0
		count = 0
		row = 4
		col = 6
		until stopper == 2
			diagonal_win_contant_backwards(4, 0, 0, player, player_color)
			row = stopper
			stopper += 1
			col = 6
		end
		#diagonal backwards for col 1-4
		stopper = 6
		count = 0
		row = 5
		col = 6
		until stopper == 4
			diagonal_win_contant_backwards(5, 6, 0, player, player_color)
			row = 5
			stopper -= 1
			col = stopper
		end
		#diagonal forwards for row 2 and 3
		stopper = 0
		count = 0
		row = 4
		col = 0
		until stopper == 2
			diagonal_win_contant_forwards(4, 0, 0, player, player_color)
			row = stopper
			stopper += 1
			col = 0
		end
		#diagonal forwards for col 1-4
		stopper = 0
		count = 0
		row = 5
		col = 0
		until stopper == 4
			diagonal_win_contant_forwards(5, 0, 0, player, player_color)
			row = 5
			stopper += 1
			col = stopper
		end

		#horizontal
		@board.each do |row|
			count = 0
			i = 0
			until i == 7
				if row[i] == player_color
					count += 1
					i += 1
					if count == 4
						puts "#{player} wins horizontally!"
						@win = true
					end
				else
					count = 0
					i += 1
				end
			end
		end

		#vertical
		count = 0
		row = 5
		col = 0
		until col == 7
			until row == -1
				if @board[row][col] == player_color
					count += 1
					row -= 1
					if count == 4
						puts "#{player} wins vertically!"
						@win = true
					end
				else
					count = 0
					row -= 1
				end
			end
			col += 1
			row = 5
			count = 0
		end
	end

	def winner
		if @win == true
			exit
		end
	end

end

player1 = Player.new(:re)
player2 = Player.new(:bl)
piece1 = Piece.new(player1.color)
piece2 = Piece.new(player2.color)
b = Board.new
g = Game.new(b.board)

until g.win do
	b.view_board
	player1.move
	g.make_move(player1.y, b.board, piece1.color)
	g.check_win(player1.name, player1.color)
	g.winner

	b.view_board
	player2.move
	g.make_move(player2.y, b.board, piece2.color)
	b.view_board
	g.check_win(player2.name, player2.color)
end