require 'rails_helper'

RSpec.describe LetterCounter do
  describe '#print_numbers' do
    let(:string) { 'The Raven & Fear Eaters' }
    let(:matcher) { 'TIBULA' }
    subject { LetterCounter.new(matcher, string) }
    it 'counts the letters in the names correctly' do
      expect(subject.accumulator).to eq(
        [
          ['T', 0],
          ['I', 0],
          ['B', 0],
          ['U', 0],
          ['L', 0],
          ['A', 0]
        ])
    end
  end
end
