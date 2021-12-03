# frozen_string_literal: true

RSpec.describe Aoc2021 do
  describe 'day_03' do
    context 'part_one_example' do
      it 'should have the right answer' do
        expect(Aoc2021::Day03.part_one(File.join(Aoc2021::INPUT_FILES, 'day_03_example.txt'))).to be(198)
      end
    end

    context 'part_one' do
      it 'should have the right answer' do
        expect(Aoc2021::Day03.part_one).to be(4_118_544)
      end
    end

    context 'part_two_example' do
      it 'should have the right answer' do
        expect(Aoc2021::Day03.part_two(File.join(Aoc2021::INPUT_FILES, 'day_03_example.txt'))).to be(230)
      end
    end

    context 'part_two' do
      it 'should have the right answer' do
        expect(Aoc2021::Day03.part_two).to be(3_832_770)
      end
    end
  end
end
