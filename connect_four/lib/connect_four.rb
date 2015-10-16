class Player
	attr_accessor :color, :y

	def initialize(color)
		@color = color
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

	def check_win(color)
		#diagonal forwards for row 2 and 3
		stopper = 0
		count = 0
		row = 4
		col = 0
		until stopper == 2
			until row == -1 || col == 6
				if @board[row][col] == color
					row -= 1
					col += 1
					count += 1
					if count == 4
						puts "#{color} won diagonally!"
					end
				else
					row -= 1
					col += 1
					count = 0
				end
			end
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
			until row == -1 || col == 6
				if @board[row][col] == color
					row -= 1
					col += 1
					count += 1
					if count == 4
						puts "#{color} won diagonally!"
					end
				else
					row -= 1
					col += 1
					count = 0
				end
			end
			row = 5
			stopper += 1
			col = stopper
		end

		#horizontal
		@board.each do |row|
			count = 0
			i = 0
			until i == 7
				if row[i] == color
					count += 1
					i += 1
					if count == 4
						puts "#{color} wins horizontally!"
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
				if @board[row][col] == color
					count += 1
					row -= 1
					if count == 4
						puts "#{color} wins vertically!"
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

	def view_board
		@board.each do |row|
			print "#{row}\n"
		end
		puts '  1    2    3    4    5    6    7'
	end

end


class Game
	attr_accessor :board, :i

	def initialize
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

	def win(player)
		puts "#{player} wins!"
		false

	end

end

player1 = Player.new(:re)
player2 = Player.new(:bl)
piece1 = Piece.new(player1.color)
piece2 = Piece.new(player2.color)
b = Board.new
g = Game.new

20.times do
player1.move
g.make_move(player1.y, b.board, piece1.color)
b.view_board
b.check_win(piece1.color)

player2.move
g.make_move(player2.y, b.board, piece2.color)
b.view_board
b.check_win(piece2.color)
end