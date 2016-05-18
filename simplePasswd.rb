# Simple Password Generator - den510

def generatePasswd(passwdLength)
	newPassword = ""
	jumble = ('a'..'z').to_a + ('0'..'9').to_a + ['!','@','#','%','$','^','&','*','?','<','>']
	for i in 0..passwdLength
		x = jumble[rand(jumble.length)]
		if x.is_a? String
			newPassword += coinToss(x)
		else
			newPassword += x
		end
	end
	return newPassword
end

def coinToss(x)
	if rand(1..2) == 1
		return x.upcase
	else
		return x.downcase
	end
end

print "Please enter a numeric password length in base 10: "
passwdLength = gets.to_i
puts generatePasswd(passwdLength)

at_exit do
	puts 'Exiting, press enter to exit.'
	exiter = gets.chomp
end