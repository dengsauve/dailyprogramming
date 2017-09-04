require 'benchmark'

def is_lucky(num, nums)
  return nums.include?(num)
end


def create_set(input)
  index = 1
  ll_num = 1
  set = (1..(input + 20).to_i).to_a

  # Filter array of evens
  set.delete_if {|number| number.even?}

  # Filter array of every third odd
  set.delete_if {|number| (number + 1) % 6 == 0}

  # Filter array using Lucky Number Sieve
  until ll_num >= (input / 2) or ll_num > set.length
    # Increment to next sieve index
    index += 1
    # Set increment value
    ll_num = set[index]
    limit = (set.length - 1) / ll_num * ll_num
    ( -limit..-(ll_num - 1) ).step(ll_num) do |number|
      set.delete_at(-number - 1)
    end
  end
  return set
end


def find_lucky_numbers(input)
  set = create_set(input)
  unless is_lucky(input, set)
    min = input
    until is_lucky(min, set)
      min -= 1
    end
    max = set[set.index(min) + 1]
    return "#{min} < #{input} < #{max}"
  else
    return "#{input} is a lucky number!"
  end
end

# get integer
if ARGV.empty?
  print 'enter your number: '
  input = gets.chomp.to_i

  start = Time.now
  puts find_lucky_numbers(input)
  puts "Time elapsed: #{Time.now - start} second(s)"
else
  unless ARGV.include?('-b')
    input = ARGV[0].to_i

    start = Time.now
    puts find_lucky_numbers(input)
    puts "Time elapsed: #{Time.now - start} second(s)"
  else
    Benchmark.bm do |x|
      x.report { puts find_lucky_numbers(103) }
      x.report { puts find_lucky_numbers(225) }
      x.report { puts find_lucky_numbers(997) }
      x.report { puts find_lucky_numbers(100000) }
      x.report { puts find_lucky_numbers(1000000) }
      x.report { puts find_lucky_numbers(10000000) }
    end
  end
end
