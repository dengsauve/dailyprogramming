from string_tools import is_in_name

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


main()
