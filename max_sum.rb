# DCP 49
# AMAZON

=begin
Given an array of numbers, find the maximum sum
of any contiguous subarray of the array
=end

input = [34, -50, 42, 14, -5, 86]
expected = 137

def max_sum(arr)
  max = 0
  current_max = 0

  arr.each do |el|
    current_max = [el + current_max, 0].max
    max = [max, current_max].max
  end

  max
end

puts max_sum(input)
