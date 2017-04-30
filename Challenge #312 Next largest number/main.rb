# den510
# Daily Programmer
# Given an integer, find the next largest integer using ONLY the digits from the given integer.
"1234\n1243\n234765\n19000".split().each do |line|
  permutations = line.split('').permutation(line.length).to_a
  largest, number = ('9'*line.length).to_i, line.to_i
  permutations.each { |perm| largest = perm.join('').to_i if perm.join('').to_i > number and perm.join('').to_i < largest}
  puts number.to_s + ' >> ' + largest.to_s
end
