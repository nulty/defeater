class LetterCounter

  def initialize(matcher, string)
    @matcher = matcher
    @string = string
  end

  attr_reader :matcher, :string

  def accumulator
    @accumulator ||= matcher.upcase.chars.map { |char| Array.new([char, 0]) }
  end

  def count_letters
    @accumulator = accumulator.map do |pair|
      string.upcase.chars.each do |string_char|
        pair[1] += 1 if string_char == pair[0]
      end
      pair
    end
  end
end
