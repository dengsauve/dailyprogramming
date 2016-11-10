import math
def reverse_polish(input_stack):
    #Requires input_stack to be a list.
    f = {
		'+': lambda t, b: b + t,
		'-': lambda t, b: b - t,
		'*': lambda t, b: b * t,
		'/': lambda t, b: b / t,
		'//':lambda t, b: b // t,
		'%': lambda t, b: b % t,
		'^': lambda t, b: b ** t}
    short_stack = []
    for i in input_stack:
        if i == '!':short_stack.append(math.factorial(short_stack.pop()))
        elif i in f:
            t, b = short_stack.pop(), short_stack.pop()
            short_stack.append(f[i](t, b))
        else:short_stack.append(float(i))
    return short_stack[0] if len(short_stack) == 1 else 'failed'

print(reverse_polish("0.5 1 2 ! * 2 1 ^ + 10 + *".split()))
print(reverse_polish("1 2 3 4 ! + - / 100 *".split()))
print(reverse_polish("100 807 3 331 * + 2 2 1 + 2 + * 5 ^ * 23 10 558 * 10 * + + *".split()))
