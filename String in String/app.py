from string_tools import is_in_name, condense_string, get_dictionary

def main():
    name_list = ("Donald Knuth", "Haskell Curry", "Dennis Sauve")
    for name in name_list:
        name = condense_string(name)
        length, winner = 0, ""
        dictionary = get_dictionary('Dictionary/enableDict.txt')
        for word in dictionary:
            if name[0] == word[0] and length < len(word) <= len(name) and is_in_name(word, name):
                winner, length = word, len(word)
        print("For " + name + " the winner is: " + winner)


main()
