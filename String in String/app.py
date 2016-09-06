from string_tools import is_word_in_target, condense_string, get_dictionary_list, cull_list
dictionary = get_dictionary_list('Dictionary/enableDict.txt')


def main():
    name_list = ("Ada Lovelace", "Haskell Curry", "Dennis Sauve")
    for name in name_list:
        name, length, winners = condense_string(name), 0, []
        for word in dictionary:
            if name.startswith(word[0]) and length <= len(word) <= len(name) and is_word_in_target(word, name):
                winners.append(word)
                length = len(word)
        print("For " + name + " the winners are: " + cull_list(winners))


def challenge():
    name_list = ("Donald Knuth", "Alan Turing", "Claude Shannon"," Ada Lovelace", "Haskell Curry", "Dennis Sauve")
    for name in name_list:
        name, max_index, all_words, max_length = condense_string(name), len(name) - 1, [], 0
        for word in dictionary:
            if name.startswith(word[0]) and len(word) <= len(name):
                it_is, word_index = is_word_in_target(word, name, True)
                if it_is:
                    all_words.append((word, word_index))
            


main()
# challenge()
raise SystemExit
