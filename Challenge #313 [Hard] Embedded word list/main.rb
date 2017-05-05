## Dennis Sauve Embedded Word Challenge

# Bring in word list
fin = File.open('example1.txt', 'r')
word_list = fin.read.split("\n")
fin.close

# sort by length
word_list = word_list.sort_by(&:length).reverse

# add a ret_str
ret_str = ''

# start adding in words if not contained... method?
def check_and_add(word, jumble)
	last_index = 0
	found = false
	word.split('').each_with_index do |letter|
		found = false
		jumble.split('').each_with_index do |character, index|
			if character == letter
				last_index = index
				found = true
				break
			end
		end
		if found == false
			jumble.insert(last_index, letter)
			last_index += 1
		end
	end
	jumble
end

word_list.each { |word| ret_str = check_and_add(word, ret_str) }

puts ret_str
