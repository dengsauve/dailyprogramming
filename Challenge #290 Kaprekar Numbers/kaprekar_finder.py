def is_kaprekar(number):
	if number % 10 == 0: return False
	sqd_num = str(number**2)
	for i in range(len(sqd_num)-1):
		if int(sqd_num[:i+1])+int(sqd_num[i+1:]) == number: return True

for i in range(2, 1000000000):
	if is_kaprekar(i): print(i)
