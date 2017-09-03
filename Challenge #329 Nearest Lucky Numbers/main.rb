def is_lucky(num, nums)
  return nums.include?(num)
end

# ini vars
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
set = (1..(input*1.5).to_i).to_a

# Filter array of evens
# set.delete_if {|number| (set.index(number) + 1) % 2 == 0}
set.delete_if {|number| number.even?}

# Filter array using Lucky Number Sieve
until ll_num >= (input / 2) or ll_num > set.length
  index += 1
  ll_num = set[index]
  #puts ll_num
  nd = []
  (1..(set.length - 1)).step(ll_num) do |number|
    nd << (number - 1) if number > index
  end
  nd.reverse!
  puts nd.inspect
  nd.each do |i|
    set.delete_at(i - 1)
  end
  #set.delete_if {|number| (set.index(number) + 1) % ll_num == 0}
  #puts set.inspect
  #sleep(0.5)
end

# Find lucky number(s)
unless is_lucky(input, set)
  min = set.min_by { |x| (x - input).abs }
  max = set[set.index(min) + 1]
  puts "#{min} < #{input} < #{max}"
else
  puts "#{input} is a lucky number!"
end

puts "Time elapsed: #{Time.now - start} second(s)"
