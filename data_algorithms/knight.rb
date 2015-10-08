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
		finished_nodes = []
		start = Node.new(0, 0, 0, nil)
		quene = []
		quene << start
		until !finished_nodes.empty?
			line = quene.shift
			POSSIBLE_MOVES.each do |move|
				new_node = Node.new(line.x + move[0], line.y + move[1], line.count + 1, line)
				if (new_node.x >= 0 && new_node.x <= 10) && (new_node.y >= 0 && new_node.y <= 10) 
					if new_node.x == 2  && new_node.y == 4
						finished_nodes << new_node
					else
						quene << new_node
					end
				end
			end
		end
		p finished_nodes
	end

end


class Board
	attr_accessor :start, :board, :x_coordinate, :y_coordinate
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
		array
	end

end

x = Board.new
v = Knight.new
v.create_possible_moves