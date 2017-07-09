class Integer
  def digits
    self.to_s.size
  end
  def is_palindrome
    return self.to_s == self.to_s.reverse
  end
end

num = gets.chomp.to_i

highest = ("9"*num).to_i ** 2
lowest = 10 ** (2*num - 2)
high = ("9"*num).to_i
low = 10 ** (num - 1)
palindrome = 0

(lowest..highest).reverse_each do |product|
  if palindrome == 0 and product.is_palindrome
    (low..high).reverse_each do |number|
      if product % number == 0 && (product / number).digits == num
        palindrome = product
      end
      break unless palindrome == 0
    end
  end
end

puts palindrome