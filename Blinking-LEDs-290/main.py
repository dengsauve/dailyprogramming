# Blinking LEDs from Daily Programmer, Challenge 290
# By: den510


def main(input_one, input_two, input_three, input_four):
    print("Challenge One:")
    output_binary, output_binary_two, output_binary_three, output_binary_four = generate_output(input_one), generate_output(input_two), generate_output(input_three), generate_output(input_four)
    emulate_lights(output_binary)
    print("\nChallenge Two:")
    emulate_lights(output_binary_two)
    print("\nChallenge Three:")
    emulate_lights(output_binary_three)
    print("\nChallenge Four:")
    emulate_lights(output_binary_four)


########################################################
# Takes input data and returns binary lines of output
# Requires raw input only
def generate_output(data):
    return_list, instructions, a, b = [], data.splitlines(), '', 0
    for line in instructions:
        if line and line[0] == line[1] == ' ':
            if 'ld a' in line:
                a = format(int(line.split(',')[1]), '08b')
            elif 'ld b' in line:
                b = int(line.split(',')[1])
            elif 'out' in line:
                return_list.append(a)
            elif 'djnz' in line:
                b -= 1
            elif 'rrca' in line:
                a = rca(a, 'r')
            elif 'rlca' in line:
                a = rca(a, 'l')
        if line and line[0] != ' ':
            trigger, triggered = line, False
            while b > 0:
                for second_line in instructions:
                    if second_line == trigger:
                        triggered = True
                    if triggered:
                        if 'ld a' in second_line:
                            a = format(int(second_line.split(',')[1]), '08b')
                        elif 'out' in second_line:
                            return_list.append(a)
                        elif 'djnz' in second_line:
                            b -= 1
                            triggered = False
                        elif 'rrca' in second_line:
                            a = rca(a, 'r')
                        elif 'rlca' in second_line:
                            a = rca(a, 'l')
            break
    return return_list
########################################################

########################################################
# Takes a list of binary values (without the leading 0b)
# Requires list of binary string values
def emulate_lights(data):
    for line in data:
        print(line.replace('0', '.').replace('1', '*'))
########################################################


########################################################
# Takes a binary string and a direction 'l' or 'r' and
# shifts them left or right one unit accordingly.
# Requires Binary string, direction string
def rca(binary, direction):
    return_string = ''
    for i in range(len(binary)):
        if direction == 'r':
            return_string += binary[i-1]
        if direction == 'l':
            return_string += binary[i-len(binary)+1]
    return return_string if direction == 'l' or direction == 'r' else binary
########################################################

if __name__ == "__main__":
    challenge_one = """  ld a,14\n  out (0),a\n  ld a,12\n  out (0),a\n  ld a,8\n  out (0),a\n
\n  out (0),a\n  ld a,12\n  out (0),a\n  ld a,14\n  out (0),a"""

    challenge_two = """  ld b,3\n
triple:\n  ld a,126\n  out (0),a\n  ld a,60\n  out (0),a\n  ld a,24\n  out (0),a\n  djnz triple"""

    challenge_three = """  ld a,1\n  ld b,9\n\nloop:\n  out (0),a\n  rlca\n  djnz loop"""

    challenge_four = """  ld a,2\n  ld b,9\n\nloop:\n  out (0),a\n  rrca\n  djnz loop"""

    main(challenge_one, challenge_two, challenge_three, challenge_four)
    raise SystemExit()
