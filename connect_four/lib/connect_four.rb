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
		row1 = ['_','_','_','_','_','_','_']
		row2 = ['_','_','_','_','_','_','_']
		row3 = ['_','_','_','_','_','_','_']
		row4 = ['_','_','_','_','_','_','_']
		row5 = ['_','_','_','_','_','_','_']
		row6 = ['_','_','_','_','_','_','_']
		@board = {6 => row6, 5 => row5, 4 => row4,
				  3 => row3, 2 => row2, 1 => row1 }		
	end


	def check_win(board)
		@board[1..4][0]

	end


	def view_board
		@board.each do |key, value|
			print key
			print ":"
			p value
		end
		puts '   1    2    3    4    5    6    7'
	end

end


class Game
	attr_accessor :board

	def initialize
	end


	def make_move(y_column, board, piece_color)
		i = 1
		until i == 6
			if board[i][y_column - 1] !=  '_'
				i += 1
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
b = Board.new()
g = Game.new

10.times do
player1.move
g.make_move(player1.y, b.board, piece1.color)
b.view_board

player2.move
g.make_move(player2.y, b.board, piece2.color)
b.view_board

end