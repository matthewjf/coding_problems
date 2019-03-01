# dcp 61
# google

=begin
Implement integer exponentiation. That is, implement the pow(x, y)
function, where x and y are integers and returns x^y.

Do this faster than the naive method of repeated multiplication.
=end

# notes
# x^5 => (x^2)^2 * x
# x^8 => ((x^2)^2)^2
# x^10 => ((x^2)^2)^2 * x^2
# y base 2

def pow(x, y)
  num_of_ops = 0
  return 1 if y == 0
  power_base_2 = y.to_s(2)

  result = 1
  power_base_2.length.times do |i|
    num_of_ops += 1
    result = result * digit_to_pow(x, i) if power_base_2[-i - 1] == '1'
  end

  result
end

def digit_to_pow(x, pos)
  return 1 if pos == '0'

  total = x
  while pos > 0
    num_of_ops += 1
    total = total * total
    pos -= 1
  end

  total
end
