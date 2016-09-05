
# Passed a word and a name, method checks to see if the letters of the word
# appear, in order, in the name. If so, True is returned.
def is_word_in_target(word, target, return_index=False):
    counter, limit, end_index = 0, len(word), 0
    for letter in target:
        if counter < limit and letter == word[counter]:
            counter += 1
            end_index = target.index(letter)
    if return_index:
        return True, end_index if counter == limit else False, end_index
    else:
        return True if counter == limit else False

# Returns a string devoid of spaces and in all lowercase
def condense_string(input_string):
    return input_string.lower().replace(' ','')

# Returns
def get_dictionary_list(filepath):
    with open(filepath) as f:
        dictionary = f.read().splitlines()
    return dictionary
