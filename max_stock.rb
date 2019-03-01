arr = [9,11,8,5,7,10]

def max_stock(arr)
  max = 0
  i1,i2 = 0,1

  while i2 < arr.length
    if arr[i2] <= arr[i1]
      i1 = i2
    else
      max = [arr[i2] - arr[i1], max].max
    end
    i2 += 1
  end

  max
end
