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

def sort_stack(stack)
  
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
          stack << character
        when ')'
          until stack[0] == '('
            output << stack.shift
          end
          stack.shift
        when '/'
          output << stack.shift
          stack << character
        when ' '
        else
          puts 'failure'
      end
    end
  end
  output << stack.join('')
  return output
end

stack = get_stack("(2 * 5 + 1) / 10")
puts stack