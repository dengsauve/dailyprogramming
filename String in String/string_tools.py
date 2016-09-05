
# Passed a word and a name, method checks to see if the letters of the word
# appear, in order, in the name. If so, True is returned.
def is_in_name(word, name):
    counter, limit = 0, len(word)
    for letter in name:
        if counter < limit and letter == word[counter]:
            counter += 1
    return True if counter == limit else False


def condense_string(input_string):
    return input_string.lower().replace(' ','')


def get_dictionary(filepath):
    with open(filepath) as f:
        dictionary = f.read().splitlines()
    return dictionary
