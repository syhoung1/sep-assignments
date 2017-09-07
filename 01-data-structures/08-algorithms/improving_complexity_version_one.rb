def poorly_written_ruby(*arrays)
  combined_array = []
  arrays.each do |array|
    combined_array += array
  end

  sorted_array = [combined_array.pop()]

  for val in combined_array
    for i in 0..sorted_array.length - 1 do
      if val <= sorted_array[i]
       sorted_array.insert(i, val)
       break
      elsif i == sorted_array.length - 1
       sorted_array << val
       break
      end
    end
  end
  sorted_array
end
 