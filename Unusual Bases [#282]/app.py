#!/usr/bin/env python

def list_from_text(file_path):
    with open(file_path, 'r') as f:
        rendered_list = f.read().splitlines()
    return rendered_list


def base_ten_to_fib(number):
    fib_list = get_fib_list(number)
    fsum = 0
    fib = "Sequence: "
    for i in fib_list:
        print(i)
        if fsum + i <= number:
            fsum += i
            fib = fib + "1"
        else:
            fib = fib + "0"
    return fib


def get_fib_list(number):
    fib, fib0, fib1, fsum = 1, 0, 1, 1
    fib_list = []
    while number>fsum:
        fib_list.append(fib)
        fib = fib1 + fib0
        fib0 = fib1
        fib1 = fib
        fsum += fib
    fib_list.reverse()
    return fib_list


challenge_input = list_from_text('input.txt')
challenge_sets = []
for i in challenge_input:
    challenge_sets.append(i.split())

for challenge in challenge_sets:
    if challenge[0] == '10':
        print("Convert Base 10 to Base Fib")
        print(base_ten_to_fib(int(challenge[1])))
    elif challenge[0] == 'F':
        print("Convert Base Fib to Base Ten")
    else:
        print("Fatal Error, not valid numtype")
        raise SystemExit
