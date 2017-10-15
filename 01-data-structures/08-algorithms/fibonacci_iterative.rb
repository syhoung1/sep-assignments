def fib(n)
  first_number = 0
  second_number = 1
  for x in 1..n do
    puts first_number
    temp = first_number
    first_number = second_number
    second_number = temp + second_number
  end
end
