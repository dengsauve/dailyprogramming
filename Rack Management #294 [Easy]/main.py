with open("enable.txt", "r") as f:
    dictionary = f.read().splitlines()
with open("scoring.txt", "r") as f:
    data, scoring = f.read().splitlines(), {}
    for block in data:
        scoring[block.split()[0]] = int(block.split()[1])


def scrabble(super_string, sub_string):
    x, y = list(sub_string), list(super_string)
    for i in x:
        try:
            y.remove(i)
        except ValueError:
            try:
                y.remove("?")
            except ValueError:
                return False
    return True


def longest(super_string):
    for word in sorted(dictionary, key=lambda s: len(s), reverse=True):
        if len(word) <= len(super_string):
            if scrabble(super_string, word):
                return word


def score(word, word_sum=0):
    for i in word:
        word_sum += scoring[i]
    return word_sum


def get_scored_letters(super_string, word):
    letters, x, y = "", list(word), list(super_string)
    for i in x:
        try:
            y.remove(i)
            letters += i
        except ValueError:
            pass
    return letters


def highest(super_string):
    return_word = ""
    for word in dictionary:
        if scrabble(super_string, word):
            scored_letters = get_scored_letters(super_string, word)
            if score(scored_letters) > score(return_word):
                return_word = word
    return return_word


print(scrabble("ladilmy", "daily"))  # True
print(scrabble("eerriin", "eerie"))  # False
print(scrabble("orrpgma", "program"))  # True
print(scrabble("orppgma", "program"))  # False

print(scrabble("pizza??", "pizzazz"))  # True
print(scrabble("piizza?", "pizzazz"))  # False
print(scrabble("a??????", "program"))  # True
print(scrabble("b??????", "program"))  # False

print(longest("dcthoyueorza"))  # "coauthored"
print(longest("uruqrnytrois"))  # "turquois"
print(longest("rryqeiaegicgeo??"))  # "greengrocery"
print(longest("udosjanyuiuebr??"))  # "subordinately"
print(longest("vaakojeaietg????????"))  # "ovolactovegetarian"

print(highest("dcthoyueorza"))  # "zydeco"
print(highest("uruqrnytrois"))  # "squinty"
print(highest("rryqeiaegicgeo??"))  # "reacquiring"
print(highest("udosjanyuiuebr??"))  # "jaybirds"
print(highest("vaakojeaietg????????"))  # "straightjacketed"