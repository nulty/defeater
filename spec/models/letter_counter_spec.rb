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

      subject.count_letters

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

  describe '#calculate' do
    let(:accumulator) { [ ['T', 4], ['I', 0], ['B', 1], ['U', 0], ['L', 1], ['A', 3] ] }
    before { allow(subject).to receive(:accumulator) { accumulator } }
    # 4 0 1 0 1 3
    #  4 1 1 1 4
    #   5 2 2 5
    #    7 4 7
    #   1 1 1 1
    #    2 2 2
    #     4 4

    it 'adds the numbers together to get the right answer' do
      expect(subject.calculate).to eq([4, 4])
    end
  end
end
