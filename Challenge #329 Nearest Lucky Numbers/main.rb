# ini vars
index = 0

# get integer
input = gets.chomp.to_i

# Generate array to 2*n
set = (1..(2 * input)).to_a

# Filter array of evens
# set.delete_if {|number| (set.index(number) + 1) % 2 == 0}
set.delete_if {|numeber| number.even?}

puts set.inspect
