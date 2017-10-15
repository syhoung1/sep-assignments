#sets up the variables necessary for the recursive search function
def recursive_binary_search(array, target)
  low = 0
  high = array.length - 1
  mid = ((high + low) / 2).floor
  
  index = recursion(array, low, mid, high, target)
  puts index
  array[index]
end

#recursively searches for the target value
def recursion(array, low, mid, high, target)
  if target == array[mid]
    return mid
  elsif high == low
    return false
  elsif target > array[mid]
    low = mid + 1
    mid = ((high + low) / 2).floor
  elsif target < array[mid]
    high = mid
    mid = ((high + low) / 2).floor
  end
  
  
  puts "high is: #{high}"
  puts "low is: #{low}"
  puts "mid is: #{mid}"
  recursion(array, low, mid, high, target)
end
