# by: den510
# about: based off shunting-yard algorithm
# reference: https://en.wikipedia.org/wiki/Shunting-yard_algorithm

# Remember PEMDAS OoO

=begin RULES
- Numbers: Add token to output

- left parenthesis ( :
  1. Push token to stack

- right parenthesis ) :
  1. Pop stack to output until '(' is found
  2. Discard '('

- Exponent ^ :
  1. Push token to stack

- Multiplication * :
  1. Push token to stack

- Division / :
  1. Pop stack to output
  2. Push token to stack

- Addition + :
  1. Push token to stack

- Subtraction - :
  1. Push token to stack

- end :
  1. Pop entire stack to output

=end

class String
  def is_integer?
    self.to_i.to_s == self
  end
end

def insert_operator(character, stack)
  precendence = {
      '(' => 1,
      '^' => 4,
      '*' => 3,
      '/' => 3,
      '+' => 2,
      '-' => 2
  }
  spot = 0

  if character == '('
    stack.insert(spot, character)
  else
    stack.each_with_index do |object, index|
      if precendence[character] <= precendence[object]
        spot = index - 1
        break
      end
    end
    stack.insert(spot, character)
  end

  return stack
end

def get_stack(input)
  output = ""
  stack = []
  input.split('').each do |character|
    puts character.inspect
    if character.is_integer?
      output << character
    else
      case character
        when '(', '^', '*', '+', '-'
          stack = insert_operator(character, stack)
        when ')'
          until stack[0] == '('
            output << stack.shift
          end
          stack.shift
        when '/'
          output << stack.shift.to_s
          stack = insert_operator(character, stack)
        when ' '
        else
          puts 'failure'
      end
    end
  end
  return output + stack.join('')
end

def parse_stack(stack)
  stack.each_with_index do |character, index|

  end
end

stack = get_stack("(2 * 5 + 1) / 10")
puts stack

result = parse_stack(stack)