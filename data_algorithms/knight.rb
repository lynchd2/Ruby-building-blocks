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
	attr_accessor :start, :finish
	POSSIBLE_MOVES = [[2, 1], [2, -1], [1, 2],
					[1, -2], [-2, 1], [-2, -1], [-1, 2], [-1, -2]]
	def initialize(start, finish)
		@start = start
		@finish = finish
	end

	def create_possible_moves
		finished_node = []
		start = Node.new(@start[0], @start[1], 0, nil)
		quene = []
		quene << start
		until !finished_node.empty?
			line = quene.shift
			POSSIBLE_MOVES.each do |move|
				new_node = Node.new(line.x + move[0], line.y + move[1], line.count + 1, line)
				if (new_node.x >= 0 && new_node.x <= @finish[0]) && (new_node.y >= 0 && new_node.y <= @finish[1]) 
					if new_node.x == @finish[0]  && new_node.y == @finish[1]
						finished_node << new_node
					else
						quene << new_node
					end
				end
			end
		end
		p finished_node
	end

end


class Board
	attr_accessor :start, :board, :x_coordinate, :y_coordinate, :x_finish, :y_finish
	def initialize
		puts "How big would you like the board to be?"
		@x_coordinate = gets.chomp.to_i
		puts "By"
		@y_coordinate = gets.chomp.to_i
		puts "And where do you want to go?(Give X-coordinate," +
			 "then Y-coordinate)"
		@x_finish = gets.chomp.to_i
		@y_finish = gets.chomp.to_i
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
v = Knight.new([0,0], [x.x_finish,x.y_finish])
v.create_possible_moves
