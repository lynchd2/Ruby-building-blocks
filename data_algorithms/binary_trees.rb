class Tree
	attr_reader = :root

	def initialize()
	end

	def build_tree(array_of_data)
		count = 0
		@root = Node.new(array_of_data.shift)
		p @root
		until array_of_data.empty?
			current_value = array_of_data.shift
			add_node(current_value, count)
			count += 1
		end
	end

	def add_node(value, count)
		array = []
		current = @root
		node = Node.new(value)
		until node.parent != nil
			if node.value < current.value
				if current.l_child == nil
					current.l_child = node
					node.parent = current
					array << current
				else
					current = current.l_child
				end
			else
				if current.r_child == nil
					current.r_child = node
					node.parent = current
					array << current
				else
					current = current.r_child
				end
			end
		end
		p array
	end

	class Node
		attr_reader = :root
		attr_accessor = :value, :parent, :l_child, :r_child
		def initialize(value, parent = nil, l_child = nil, r_child = nil)
			@value = value
			@parent = parent
			@l_child = l_child
			@r_child = r_child
		end
	end
end


new = Tree.new
new.build_tree([1,4,8,43,76,3,7])

