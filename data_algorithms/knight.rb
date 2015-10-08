class Node
	attr_accessor :x, :y, :count, :parent
	def initialize(x, y, count, parent = nil)
		@x = x
		@y = y
		@count = count
		@parent = parent
	end
end

class Knight
	POSSIBLE_MOVES = [[2, 1], [2, -1], [1, 2],
					[1, -2], [-2, 1], [-2, -1], [-1, 2], [-1, -2]]
	def initialize
	end

	def create_possible_moves
		start = Node.new(0, 0, 1, nil)
		tree = POSSIBLE_MOVES.collect do |move|
			new_place = Node.new(start.x + move[0], start.y + move[1], start.count + 1, start)
		end
		tree.find {|node| node.x == 0 && node.y == 0} 
	end


end


class Board
	attr_accessor :start
	def initialize
		puts "How big would you like the board to be?"
		x_coordinate = gets.chomp.to_i
		puts "By"
		y_coordinate = gets.chomp.to_i
		@board = make_board(x_coordinate, y_coordinate)


	end

	def make_board(x,y)
		array = []
		(0..x - 1).each do |x|
			(0..y - 1).each do |y|
				array << [x,y]	
			end
		end
		p array
	end

end

x = Board.new
v = Knight.new
v.create_possible_moves