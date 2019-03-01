# dcp 62
# facebook

=begin
There is an N by M matrix of zeroes. Given N and M, write a function to
count the number of ways of starting at the top-left corner and getting
to the bottom-right corner. You can only move right or down.

For example, given a 2 by 2 matrix, you should return 2, since there are
two ways to get to the bottom-right:

Right, then down
Down, then right

Given a 5 by 5 matrix, there are 70 ways to get to the bottom-right.
=end

def choose(n, c)
  ((n-c+1)..n).reduce(1,:*) / (1..c).reduce(1,:*)
end

# solution
# N - 1 + M - 1 line segment
# N - 1 of those segment are rights and the rest are downs

def matrix_ways(n, m)
  choose(n - 1 + m - 1, m - 1)
end
