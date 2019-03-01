# DCP 50
# Microsoft

=begin
Suppose an arithmetic expression is given as
a binary tree. each leaf is an integer and
each internal node is one of '+', '-'', '*'
or '/'. Given the roof, write a function to
evaluate such a tree.

Example:
      *
    /  \
  +     +
 / \   / \
3  2  4  5
=end
class Node
  attr_reader :left, :right, :value
  def initialize(value, left: nil, right: nil)
    @value = value
    @left = left
    @right = right
  end
end

input = Node.new('*',
  left: Node.new('+',
    left: Node.new('3'),
    right: Node.new('2')),
  right: Node.new('+',
    left: Node.new('4'),
    right: Node.new('5'))
)
expected = 45

def eval_tree(root)
  eval(bst(root))
end

def bst(node)
  return '' if node.nil?
  '(' + bst(node.left) + node.value + bst(node.right) + ')'
end

eval_tree(input)
