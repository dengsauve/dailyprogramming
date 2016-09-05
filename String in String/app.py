from string_tools import is_word_in_target, condense_string, get_dictionary_list
dictionary = get_dictionary_list('Dictionary/enableDict.txt')


def main():
    name_list = ("Ada Lovelace", "Haskell Curry", "Dennis Sauve")
    for name in name_list:
        name = condense_string(name)
        length, winner = 0, ""
        for word in dictionary:
            if name[0] == word[0] and length < len(word) <= len(name) and is_word_in_target(word, name):
                winner, length = word, len(word)
        print("For " + name + " the winner is: " + winner)


def challenge():
    name_list = ("Donald Knuth", "Alan Turing", "Claude Shannon"," Ada Lovelace", "Haskell Curry", "Dennis Sauve")
    for name in name_list:
        name = condense_string(name)
        all_words = []
        max_length = 0
        for word in dictionary:
            if name[0] == word[0] and len(word) <= len(name) and is_word_in_target(word, name):
                all_words.append(word)
                if len(word) > max_length:
                    max_length = len(word)
        print(all_words, max_length)


main()
# challenge()
raise SystemExit
