"""
	Wandering Fingers: 'SWYPE' Logic Emulator
	By: Dennis Sauve
	Env: Python 3.5
	Date: 9-27-16
"""


def is_word_in_target(sub_string, super_string):# Checks if sub_string is in super_string in order. ex. 'tea' in is 'theatre', 'ip' is not in 'pie'
    counter, limit = 0, len(sub_string)
    for letter in super_string:
        if counter < limit and letter == sub_string[counter]:
            counter += 1# Since limit is len(sub_string), while counter remains less, search for matching letters cont.
    return True if counter == limit else False# False returned: counter < limit b/c not all letters of sub_string appeared in order in super_string.


def shadow_words(pattern, dictionary):# Using the first and last letters and length of the pattern, this method runs through the dictionary, reducing num of strings tested.
    first_letter, last_letter, word_length, iter_words, pattern_list = pattern[0], pattern[-1], len(pattern), [], []
    for i in range(1, len(pattern)):
        pattern_list.append(pattern[:i] + pattern[i-1] + pattern[i:])# As per Bonus req., assembles pattern w/doubled letter for each letter in pattern
    for entry in dictionary:# Runs through the dictionary
        if (entry[0] == first_letter) and (entry[-1] == last_letter) and (5 <= len(entry) <= word_length):# Checks nesc. parameters
            for p in pattern_list:
                if is_word_in_target(entry, p) and entry not in iter_words:
                    iter_words.append(entry)# If the entry is in the modified patter and not already added in, it's added to the iter_list
    return iter_words


def main():
    dictionary_list, input_list = [], ['qwertyuytresdftyuioknn', 'gijakjthoijerjidsdfnokg']
    with open('enable1.txt') as f:
        dictionary_list = f.read().splitlines()
    for pattern in input_list:
        basic_outcomes = shadow_words(pattern, dictionary_list)
        print('Solutions for %s are:' % pattern, basic_outcomes)


def show_challenge():
    with open('challenge.txt') as c:
        print(c.read())
    raise SystemExit()


if __name__ == '__main__':
    main()
    print("EOL")
    raise SystemExit()
