#!/usr/bin/env python
from suave_libs import list_from_text, condense_string, is_word_in_unordered_target, anagram_multi_word

challenge_input = list_from_text('input.txt')
dictionary = list_from_text('Dictionary/enableDict.txt')
nth = int(challenge_input[0]) + 1
anagrams = []

for challenge in range(1, nth):
    print("Anagramming: ", challenge_input[challenge])
    full_word = condense_string(challenge_input[challenge])
    results = anagram_multi_word(full_word, full_word, dictionary, [])
    anagrams.append(results)

for i in range(1, nth):
    words = ", ".join(anagrams[i-1])
    print("The anagram for",challenge_input[i],"is:", words)
