class Node
  attr_reader :value
  attr_accessor :parent, :lchild, :rchild
  
  def initialize(v, p=nil, lc=nil, rc=nil)
    @value = v
    @parent = p
    @lchild = lc
    @rchild = rc
  end
  
  # Method used by tree builder, to add branches
  def check_val(val)
    if val <= self.value && self.lchild.nil?
      self.lchild = Node.new(val, self)
    elsif val <= self.value && self.lchild != nil
      self.lchild.check_val(val)
    elsif val > self.value && self.rchild.nil?
      self.rchild = Node.new(val, self)
    elsif val > self.value && self.rchild != nil
      self.rchild.check_val(val)
    end
  end
  
  # Method used to search for given value inside the tree, using breadth first search
  def breadth_first_search(val)
    queue = [] << self
    while !queue.empty?
      n = queue.shift
      val_to_check = n.value

      if val_to_check==val
        puts "Value #{val} found in node: #{n}"
        return n
      else
        queue << n.lchild if !n.lchild.nil?
        queue << n.rchild if !n.rchild.nil?
      end
    end
    puts "Value #{val} not found in this tree." if queue.empty?
  end
  
  # Method used to search for given value inside the tree, using depth first search
  def depth_first_search(val)
    stack = [] << self
    result = []
    
    while !stack.empty?
      n = stack.last
      val_to_check = n.value
      
      if val_to_check==val
        puts "Value #{val} found in node: #{n}"
        return n
      else
        if !n.lchild.nil? && !result.include?(n.lchild)
          stack << n.lchild
        elsif !n.rchild.nil? && !result.include?(n.rchild)
          stack << n.rchild
        else
          poppy = stack.pop
          result << poppy
          if stack.last==self
            puts "Value #{val} not found in this tree."
            break
          end
        end
      end
    end
  end
  
  # Method used to search for given value inside the tree, using recursive depth first search
  def dfs_rec(val)
    x = nil
    if self.value == val
      puts "Value #{val} found in node: #{self}"
      return self
    else
      if x.nil?
        x = self.lchild.dfs_rec(val) if !self.lchild.nil?
        return x if !x.nil?
        x = self.rchild.dfs_rec(val) if !self.rchild.nil?
        return x if !x.nil?
      end
    end
    puts "Value #{val} not found in this tree." if self.parent.nil? && x.nil?
  end
end

# Method that takes an array, and creates data tree of it
def build_tree(ary)
  tree = Node.new(ary.first)
  ary.each_with_index do |x, i|
    if i>0
      tree.check_val(x)
    end
  end
  tree
end

# Method used to check if the tree was created properly
def check_tree(tree, level=0)
  if !tree.rchild.nil? || !tree.lchild.nil?
    puts "Level: #{level}"
    #puts tree.value
    puts "Left branch: #{tree.value} => #{tree.lchild.value}" if !tree.lchild.nil?
    puts "Right branch: #{tree.value} => #{tree.rchild.value}" if !tree.rchild.nil?
    check_tree(tree.lchild, level+1) if !tree.lchild.nil?
    check_tree(tree.rchild, level+1) if !tree.rchild.nil?
  end
end

a = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324, 100]
tree = build_tree(a)


puts "\nBreadth first search:"
a = tree.breadth_first_search(100)
puts a.value if !a.nil?
puts "\nDepth first search:"
b = tree.depth_first_search(100)
puts b.value if !b.nil?
puts "\nDepth first recursive search:"
c = tree.dfs_rec(100)
puts c.value if !c.nil?
