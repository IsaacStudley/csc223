class BinaryTree
  attr_accessor :root

  def initialize
    self.root = nil
  end
  def build_from_postfix(tokens)
    stack = []
    tokens.each do |token|
      if ["+", "-", "*", "/"].include?(token)
        right = stack.pop
        left = stack.pop
        node = Node.new(left , right ,token)
        stack.push(node)
      else
        node = Node.new(nil, nil, token)
        stack.push(node)
      end
    end
    @root = stack.pop
  end

end

class Node
  attr_accessor :left, :right, :value

  def initialize(left=nil, right=nil, value=nil)
    self.left = left
    self.right = right
    self.value = value
  end

  def to_s
    value.to_s
  end

  def inOrder
    if left
      print "("
      left.inOrder
    end
    print" #{value} "
    if right
      right.inOrder
      print ")"
    end
  end

end
puts "Type expression in postfix: "
expression = gets.chomp.split


tree = BinaryTree.new
tree.build_from_postfix(expression)
puts "Infix expression: "
tree.root.inOrder
puts
## Calebs implimentation
def print_tree(node, left_accessor: nil, right_accessor: nil, value_accessor: nil, prefix: "", is_left: true)
  return if node.nil?

  left_accessor  ||= -> (n) { n.left }
  right_accessor ||= -> (n) { n.right }
  value_accessor ||= -> (n) { n.to_s }

  right_child = right_accessor.call(node)
  left_child  = left_accessor.call(node)

  print_tree(right_child, left_accessor: left_accessor, right_accessor: right_accessor,
             value_accessor: value_accessor,
             prefix: prefix + (is_left ? "│   " : "    "), is_left: false)

  puts prefix + (is_left ? "└── " : "┌── ") + value_accessor.call(node)

  print_tree(left_child, left_accessor: left_accessor, right_accessor: right_accessor,
             value_accessor: value_accessor,
             prefix: prefix + (is_left ? "    " : "│   "), is_left: true)
end


print_tree(tree.root)
puts "Expression tree built!"