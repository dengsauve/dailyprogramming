def main():
    challenge_list = get_challenge_list()
    anagram_pair_list = []
    for i in challenge_list:
        anagram_pair_list.append(i.replace('\"', '').replace(",", "").replace("\'", "").split(" ? "))
    for i in anagram_pair_list:
        confirm = are_anagrams(i[0].lower().replace(" ", ""), i[1].lower().replace(" ", ""))
        if confirm == True:
            print(i[0], "is an anagram of", i[1])
        else:
            print(i[0], "is not an anagram of", i[1])


def are_anagrams(sub_string, super_string):
    x, y = list(sub_string), list(super_string)
    for i in x:
        try:
            y.remove(i)
        except ValueError:
            return False
    if len(y) > 0:
        return False
    return True


def get_challenge_list():
    return """\"wisdom" ? "mid sow"
"Seth Rogan" ? "Gathers No"
"Reddit" ? "Eat Dirt"
"Schoolmaster" ? "The classroom"
"Astronomers" ? "Moon starer"
"Vacation Times" ? "I'm Not as Active"
"Dormitory" ? "Dirty Rooms\"""".splitlines()


main()
raise SystemExit
