require 'rails_helper'

RSpec.describe LetterCounter do
  let(:string) { 'The Battlers & Fear Eaters' }
  let(:matcher) { 'TIBULA' }
  subject { LetterCounter.new(matcher, string) }

  describe '#accumulator' do
    it 'counts the letters in the names correctly' do
      expect(subject.accumulator).to eq(
        [
          ['T', 0],
          ['I', 0],
          ['B', 0],
          ['U', 0],
          ['L', 0],
          ['A', 0]
        ]
      )
    end
  end

  describe '#count_letters' do
    let(:accumulator) { [['T', 0], ['I', 0], ['B', 0], ['U', 0], ['L', 0], ['A', 0]] }

    it 'counts the letters correctly' do
      expect(subject.accumulator).to eq(accumulator)

      subject.calculate

      expect(subject.accumulator).to eq(
        [
          ['T', 4],
          ['I', 0],
          ['B', 1],
          ['U', 0],
          ['L', 1],
          ['A', 3]
        ]
      )
    end
  end
end
