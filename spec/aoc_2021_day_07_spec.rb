# frozen_string_literal: true

RSpec.describe Aoc2021 do
  describe 'day_07' do
    context 'part_one_example' do
      it 'should have the right answer' do
        expect(Aoc2021::Day07.part_one(File.join(Aoc2021::INPUT_FILES, 'day_07_example.txt'))).to be(37)
      end
    end

    context 'part_one' do
      it 'should have the right answer' do
        expect(Aoc2021::Day07.part_one).to be(349_769)
      end
    end

    context 'part_two_example' do
      it 'should have the right answer' do
        expect(Aoc2021::Day07.part_two(File.join(Aoc2021::INPUT_FILES, 'day_07_example.txt'))).to be(168)
      end
    end

    context 'part_two' do
      it 'should have the right answer' do
        expect(Aoc2021::Day07.part_two).to be(99_540_554)
      end
    end
  end
end
