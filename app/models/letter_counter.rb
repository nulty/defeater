class LetterCounter

  def initialize(matcher, string)
    @matcher = matcher
    @string = string
  end

  attr_reader :matcher, :string

  def accumulator
    @accumulator ||= matcher.upcase.chars.map do |char|
      Array.new([char, 0])
    end
  end
end
