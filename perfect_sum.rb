# DCP 70
# Microsoft

=begin
A number is considered perfect if its digits sum to exactly 10.

Given a positive integer n, return the nth perfect number.

  examples:
  - given 1, return 19
  - given 2, return 28
=end

=begin
NOTES
1 -> 19
2 -> 28
3 -> 37
4 -> 46
5 -> 55
...
9 -> 91
10 -> 109
11 -> 118
...
19 -> 190
20 -> 208
21 -> 217
...
28 -> 280
29 -> 307 * offset
30 -> 316
=end

# iterative

def sum_digits(n)
  remaining = n
  sum = 0
  while remaining > 0
    sum += remaining % 10
    remaining = remaining / 10
  end
  sum
end

def iterative_perfect_sum(n)
  num = 0
  counter = 0

  while true
    if sum_digits(num) == 10
      counter += 1
      return num if counter == n
    end
    num += 1
  end
end

# non-iterative?
