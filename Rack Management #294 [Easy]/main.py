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
    print("Solving for:", super_string)
    dictionary = []
    with open("enable.txt", "r") as f:
        dictionary = f.read().splitlines()
    for word in sorted(dictionary, key=lambda s: len(s), reverse=True):
        print(word)
        if len(word) <= 20 and scrabble(super_string, dictionary):
            return word


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
