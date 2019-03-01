# DCP 54
# Dropbox

=begin
Implement an effiicent sudoku solver
=end

input_1 = [
  [nil, nil, nil, nil, nil, nil,   8,   7,   1],
  [  4, nil, nil, nil, nil,   5,   9, nil, nil],
  [nil, nil,   9,   7,   2,   1, nil,   6, nil],
  [nil,   9, nil, nil,   5,   7, nil, nil,   2],
  [  6, nil,   4, nil,   1, nil,   5, nil,   8],
  [  5, nil, nil,   3,   6, nil, nil,   1, nil],
  [nil,   6, nil,   5,   3,   9,   2, nil, nil],
  [nil, nil,   2,   1, nil, nil, nil, nil,   6],
  [  8,   3,   5, nil, nil, nil, nil, nil, nil]
]

input_2 = [
  [nil,   4, nil, nil, nil,   3,   1, nil, nil],
  [nil, nil,   5,   2, nil, nil, nil, nil,   3],
  [  1, nil, nil, nil,   9, nil,   8, nil,   5],
  [nil, nil,   1,   7, nil,   5, nil,   3, nil],
  [  8, nil, nil, nil, nil, nil, nil, nil,   6],
  [nil,   5, nil,   9, nil,   8,   7, nil, nil],
  [  4, nil,   3, nil,   5, nil, nil, nil,   2],
  [  7, nil, nil, nil, nil,   9,   6, nil, nil],
  [nil, nil,   9,   8, nil, nil, nil,   4, nil]
]

# brute force (dfs)

def solver(puzzle, row: 0, col: 0)
  return puzzle if row > 8
  next_row, next_col = next_pos(row, col)
  return solver(puzzle, row: next_row, col: next_col) unless puzzle[row][col].nil?

  allowed_values = values(puzzle, row, col)
  return false unless allowed_values

  allowed_values.each do |val|
    duped = deep_dup(puzzle)
    duped[row][col] = val
    solved = solver(duped, row: next_row, col: next_col)
    return solved if solved
  end

  return false
end

def next_pos(row, col)
  [ row + (col + 1)/9, (col + 1) % 9 ]
end

def values(puzzle, row, col)
  cell = puzzle[row][col]
  column_values = (0...9).map do |row|
    puzzle[row][col]
  end
  row_values = puzzle[row]
  result = [1,2,3,4,5,6,7,8,9] - (column_values + row_values)
  result.empty? ? false : result
end

def deep_dup(matrix)
  matrix.map do |row|
    row.dup
  end
end

def print_solution(solution)
  puts "no solution" unless solution
  solution.each do |row|
    puts "[" + row.map {|el| el.nil? ? ' ' : el}.join(', ') + "]"
  end
end

puts "PROBLEM 1"
puts "========="
print_solution(input_1)
puts "output:"
print_solution(solver input_1)

puts "\n\n"

puts "PROBLEM 2"
puts "========="
print_solution(input_2)
puts "output:"
print_solution(solver input_2)
