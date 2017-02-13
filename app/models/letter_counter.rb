require 'pry'

class LetterCounter

  def initialize(matcher, string)
    @matcher = matcher
    @string = string
  end

  attr_reader :matcher, :string

  def accumulator
    @accumulator ||= matcher.upcase.chars.map! { |char| Array.new([char, 0]) }
  end

  def count_letters
    @accumulator = accumulator.map do |pair|
      string.upcase.chars.each do |string_char|
        pair[1] += 1 if string_char == pair[0]
      end
      pair
    end
  end

  def calculate
    digits = accumulator.map do |pair|
      pair[1]
    end

    while digits.length > 2
      original_digits = digits.dup

      digits = digits.each_cons(2).map do |digit|
        sum = digit.sum
        if sum > 9
          sum = sum.to_s.chars.map(&:to_i)
        end
        sum
      end
      digits.flatten!
    end
    digits
  end
end
