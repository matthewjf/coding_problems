# DCP 83
# Google

# Invert a binary tree.

# For example, given the following tree:
#     a
#    / \
#   b   c
#  / \  /
# d   e f

# should become:
#   a
#  / \
#  c  b
#  \  / \
#   f e  d

class Node:
  def __init__(self, value, left=None, right=None):
    self.value = value
    self.left = left
    self.right = right

def invert_binary_tree(root):
  if root is None:
    return
  else:
    root.left,root.right = root.right,root.left
    invert_binary_tree(root.left)
    invert_binary_tree(root.right)
    return root

def print_tree(root):
  if root is None:
    return
  print(root.value)
  print_tree(root.left)
  print_tree(root.right)


root = Node('a', Node('b', Node('d'), Node('e')), Node('c', Node('f')))
print_tree(root)
print_tree(invert_binary_tree(root))
