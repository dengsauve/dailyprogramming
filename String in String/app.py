def main():
    name_list = ("Donald Knuth", "Haskell Curry", "Dennis Sauve")
    for name in name_list:
        name = name.lower().replace(' ','')
        length = 0
        winner = ""
        with open('Dictionary\enableDict.txt') as f:
            dictionary = f.read().splitlines()
        for word in dictionary:
            if name[0] == word[0] and len(word) <= len(name) and len(word) > length and is_in_name(word, name):
                winner = word
                length = len(word)
        print("For " + name + " the winner is: " + winner)


def is_in_name(word, name):
    counter, limit = 0, len(word)
    for letter in name:
        if counter < limit and letter == word[counter]:
            counter += 1
    return True if counter == limit else False


main()
