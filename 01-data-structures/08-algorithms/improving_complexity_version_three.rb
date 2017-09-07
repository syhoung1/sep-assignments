def poorly_written_ruby(*arrays)
  combined_array = []
  arrays.each do |array|
    combined_array += array
  end

  if combined_array.length <= 1
    combined_array
  end
  
  sorted_max = 0
  current_index = 1
  
  while current_index < combined_array.length
    if combined_array[current_index] <= combined_array[sorted_max]
      for x in 0..sorted_max do
        if combined_array[x] >= combined_array[current_index]
          value = combined_array.delete_at(current_index)
          combined_array.insert(x, value)
        end
      end
      sorted_max += 1
      current_index += 1
    else
      sorted_max += 1
      current_index += 1
    end
  end
  
  combined_array
end