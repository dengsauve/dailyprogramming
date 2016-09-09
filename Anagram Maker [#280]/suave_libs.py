from random import shuffle


def condense_string(input_string):
    for nonchar in "`~1234567890-=!@#$%^&*()_+[]{}|\\;':\",/.<>?":
        input_string = input_string.replace(nonchar,'')
    return input_string.replace(' ', '').lower()


def list_from_text(file_path):
    with open(file_path, 'r') as f:
        rendered_list = f.read().splitlines()
    return rendered_list


def is_word_in_unordered_target(sub_string, super_string):
    x, y = list(sub_string), list(super_string)
    for i in x:
        try:
            y.remove(i)
        except ValueError:
            return False
    return True


def anagram_multi_word(full_word, original, dictionary, results, total_runs=0, banned_words=[]):
    if total_runs > 1000:
        print("Anagram improbable -",total_runs,"runs.")
        return [("No anagram found in",total_runs,"runs")]
    count = 0
    total_runs += 1
    shuffle(dictionary)
    for entry in dictionary:
        if is_word_in_unordered_target(entry, full_word) and entry not in banned_words:
            count += 1
            results.append(entry)
            banned_words.append(entry)
            for i in entry:
                full_word = full_word.replace(i, "", 1)
    if count == 0:
        return anagram_multi_word(original, original, dictionary, [], total_runs)
    else:
        if full_word:
            return anagram_multi_word(full_word, original, dictionary, results, total_runs, banned_words)
        else:
            print("Anagram Solved!!!")
            return results


def is_word_in_target(sub_string, super_string):
    counter, limit, end_index = 0, len(sub_string), 0
    for letter in super_string:
        if counter < limit and letter == sub_string[counter]:
            counter += 1
    return True if counter == limit else False
