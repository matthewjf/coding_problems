# DCP 58
# Amazon

=begin
A sorted array of integers was rotated an unknown number of times.

Given such an array, find the index of the element in the array
in faster than linear time. If the element doesn't exist in the
array, return null.
=end

def find_rotated(arr, val, start=0, finish=arr.length-1)
  return finish if arr[finish] == val
  return start if arr[start] == val

  mid = get_middle(start, finish)

  return mid if arr[mid] == val

  return find_rotated(arr, val, start, mid - 1) if (arr[start] > val && arr[mid] < val) || (arr[start] < val && arr[mid] > val)
  return find_rotated(arr, val, mid + 1, finish) if (arr[mid] > val && arr[finish] < val) || (arr[mid] < val && arr[finish] >= val)

  return nil
end

def get_middle(start, finish)
  start + (finish - start)/2
end

puts find_rotated([9,8,7], 7)
puts find_rotated([9,8,7], 6).inspect
puts find_rotated([1,2,3,4,5], 5)
puts find_rotated([3,4,5,1,2], 3)
puts find_rotated([4,5,1,2,3], 3)
