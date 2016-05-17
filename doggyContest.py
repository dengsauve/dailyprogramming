#! /bin/python
# Challenge found at https://www.reddit.com/r/dailyprogrammer/comments/4jom3a/20160516_challenge_267_easy_all_the_places_your/

def placementList(place, placings, neatString):
	for i in range(1, placings + 1): #Bonus 2 Achieved!
		if i != place:
			if i % 10 == 1 and i % 100 != 11: #Bonus 1 and Bonus 3 Achieved
				neatString += "%dst, " % i
			elif i % 10 == 2 and i % 100 != 12: #Bonus 1 and Bonus 3 Achieved
				neatString += "%dnd, " % i
			elif i % 10 == 3 and i % 100 != 13: #Bonus 1 and Bonus 3 Achieved
				neatString += "%drd, " % i
			else:
				neatString += "%dth, " % i
	return neatString[:-2] + "." #cuts the last whitespace and comma, and adds a period allowing for scaling
print placementList(2, 300, "The other places were: ")