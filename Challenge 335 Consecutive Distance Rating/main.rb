# Consecutive Distance Rating

e_input = "6 11
31 63 53 56 96 62 73 25 54 55 64
77 39 35 38 41 42 76 73 40 31 10
30 63 57 87 37 31 58 83 34 76 38
18 62 55 92 88 57 90 10 11 96 12
26 8 7 25 52 17 45 64 11 35 12
89 57 21 55 56 81 54 100 22 62 50".split("\n")[1..-1]

c_input = "6 20
76 74 45 48 13 75 16 14 79 58 78 82 46 89 81 88 27 64 21 63
37 35 88 57 55 29 96 11 25 42 24 81 82 58 15 2 3 41 43 36
54 64 52 39 36 98 32 87 95 12 40 79 41 13 53 35 48 42 33 75
21 87 89 26 85 59 54 2 24 25 41 46 88 60 63 23 91 62 61 6
94 66 18 57 58 54 93 53 19 16 55 22 51 8 67 20 17 56 21 59
6 19 45 46 7 70 36 2 56 47 33 75 94 50 34 35 73 72 39 5".split("\n")[1..-1]


line_sum = 0

[e_input, c_input].each do | a |
	a.each do | line |
		line.split.each_with_index do | number, index |
			next_big, next_small, ls = (number.to_i + 1).to_s, (number.to_i - 1).to_s, line.split
			line_sum += ls.index(next_big) - index if ls.include?(next_big) and ls.index(next_big) > index
			line_sum += ls.index(next_small) - index if ls.include?(next_small) and ls.index(next_small) > index
		end
		puts line_sum
		line_sum = 0
	end
	puts
end