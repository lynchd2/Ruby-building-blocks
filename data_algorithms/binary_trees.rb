class Tree
	attr_accessor :root

	def initialize()
	end

	def build_tree(array_of_data)
		array = []
		@root = Node.new(array_of_data.shift)
		array << @root
		until array_of_data.empty?
			current_value = array_of_data.shift
			array << add_node(current_value, @root)
			#Testing below
			#array.each{|x| puts x.r_child if x.parent.nil?} 
			#Testing finished
		end
	end

	def add_node(value, current_node)
		current = current_node
			if value <= current.value
				if current.l_child == nil
					node = Node.new(value)
					current.l_child = node
					node.parent = current
					node
				else
					add_node(value, current.l_child)
				end
			else
				if current.r_child == nil
					node = Node.new(value)
					current.r_child = node
					node.parent = current
					node
				else
					add_node(value, current.r_child)
				end
			end
		end

		def bdt(values)
			answer = nil
			quene = []
			quene << @root
			until quene.empty?
				current = quene.shift
				if current.value == values
					answer = values
					break
				elsif current.value != values
					if (current.l_child && (current.l_child.value != values)) && (current.r_child && (current.r_child.value != values))
						quene << current.l_child
						quene << current.r_child
					end
				end
			end
			return answer
		end


	class Node
		attr_accessor :value, :parent, :l_child, :r_child
		def initialize(value, parent = nil, l_child = nil, r_child = nil)
			@value = value
			@parent = parent
			@l_child = l_child
			@r_child = r_child
		end
	end
end


f = Tree.new
f.build_tree([9,4,8,43,76,3,7])
f.bdt(9)
