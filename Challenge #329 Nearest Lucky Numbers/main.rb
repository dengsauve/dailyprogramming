def is_lucky(num, nums)
  return nums.include?(num)
end


# ini vars: ll_num is 'latest lucky number'
start = Time.now
index = 0
ll_num = 1


# get integer
if ARGV.empty?
  print 'enter your number: '
  input = gets.chomp.to_i
else
  input = ARGV[0].to_i
end


# Generate array to 2*n
set = (1..(input*1.1).to_i).to_a


# Filter array of evens
set.delete_if {|number| number.even?}


# Filter array using Lucky Number Sieve
until ll_num >= (input / 2) or ll_num > set.length
  # Increment to next sieve value
  index += 1

  # Set increment
  ll_num = set[index]

  limit = (set.length - 1) / ll_num * ll_num
  ( -limit..-(ll_num - 1) ).step(ll_num) do |number|
    set.delete_at(-number - 1)
  end
end


# Find lucky number(s)
unless is_lucky(input, set)
  min = input
  until is_lucky(min, set)
    min -= 1
  end
  max = set[set.index(min) + 1]
  puts "#{min} < #{input} < #{max}"
else
  puts "#{input} is a lucky number!"
end

puts "Time elapsed: #{Time.now - start} second(s)"


set.each do |i|
  puts set[set.index(i) - 1] 
end
