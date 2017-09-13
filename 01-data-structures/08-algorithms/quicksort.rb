def quick_sort(array)
  start = 0
  finish = array.length - 1
  
  recursive_quick_sort(array, start, finish)
end

def recursive_quick_sort(array, start, finish)
  if start >= finish
    return
  end
  
  pivot = array[finish]
  
  min = start
  max = finish
  free = max
  
  while min < max
    if free == max
      if array[min] >= pivot
        array[free] = array[min]
        max -= 1
        free = min
      else
        min += 1
      end
    elsif free == min
      if array[max] <= pivot
        array[free] = array[max]
        min += 1
        free = max
      else
        max -= 1
      end
    end
  end
end
