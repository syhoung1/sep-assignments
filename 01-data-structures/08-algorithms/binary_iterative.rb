def binary_search(array, target)
  low = 0
  high = array.length - 1
  mid = ((high + low) / 2).floor
  
  while high != mid
    puts "high is: #{high}"
    puts "low is: #{low}"
    puts "mid is: #{mid}"
    if target == array[mid]
      puts "found #{target} at index #{mid}"
      return array[mid]
    elsif target > array[mid]
      low = mid
      mid = ((high + low) / 2).floor
    elsif target < array[mid]
      high = mid
      mid = ((high + low) / 2).floor
    else
      -1
    end
  end
end
