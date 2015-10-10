#Works with user input creating board and finish spot.
#If finish sport is greater than 12, the program hangs.

class Node
	attr_accessor :x, :y, :node_count, :parent
	def initialize(x, y, node_count, parent = nil)
		@x = x
		@y = y
		@node_count = node_count
		@parent = parent

	end
end

class Knight
	attr_accessor :start
	POSSIBLE_MOVES = [[2, 1], [2, -1], [1, 2],
					[1, -2], [-2, 1], [-2, -1], [-1, 2], [-1, -2]]
	def initialize(start, finish)
		@start = start
		@finish = finish
	end

	def path_of_best_knight(finished_node)
		finished_node
		parents = [finished_node]
		finished_node = parents[-1]
		i = finished_node.node_count
		until parents.length >= i 
			parents << finished_node.parent
			finished_node = parents[-1]
		end
		puts "This is the path:"
		number = 1
		parents.reverse.each do |node|
			puts "Move #{number} : [#{node.x}, #{node.y}]"
			number += 1
		end
	end

	def create_possible_moves(parameters)
		finished_node = ''
		start = Node.new(@start[0], @start[1], 0, nil)
		quene = []
		quene << start
		until finished_node != ''
			line = quene.shift
			POSSIBLE_MOVES.each do |move|
				new_node = Node.new(line.x + move[0], line.y + move[1], line.node_count + 1, line)
				if (new_node.x >= 0 && new_node.x <= parameters[0]) && (new_node.y >= 0 && new_node.y <= parameters[1]) 
					if new_node.x == @finish[0]  && new_node.y == @finish[1]
						finished_node = new_node
						path_of_best_knight(finished_node)
					else
						quene << new_node
					end
				end
			end
	end

	end

end


class Board
	attr_accessor :board, :x_parameter, :y_parameter, :x_finish, :y_finish
	def initialize
		puts "How big would you like the board to be?"
		@x_parameter = gets.chomp.to_i
		puts "By"
		@y_parameter = gets.chomp.to_i
		puts "And where do you want to go?(Give X-coordinate," +
			 "then Y-coordinate)"
		@x_finish = gets.chomp.to_i
		@y_finish = gets.chomp.to_i
		@board = make_board(x_parameter, y_parameter)

	end

	def make_board(x,y)
		array = []
		(0..x - 1).each do |x|
			(0..y - 1).each do |y|
				array << [x,y]	
			end
		end
	end

	def parameters_check
		if @x_parameter <= @x_finish || @y_parameter <= y_finish
			puts "The knight is off the board.. Try again"
			exit
		end
	end


end

new_board = Board.new
new_board.parameters_check
v = Knight.new([0,0], [new_board.x_finish,new_board.y_finish])
v.create_possible_moves([new_board.x_parameter, new_board.y_parameter])