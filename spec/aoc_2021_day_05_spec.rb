# frozen_string_literal: true

RSpec.describe Aoc2021 do
  describe 'day_05' do
    context 'part_one_example' do
      it 'should have the right answer' do
        expect(Aoc2021::Day05.part_one(File.join(Aoc2021::INPUT_FILES, 'day_05_example.txt'))).to be(5)
      end
    end

    context 'part_one' do
      it 'should have the right answer' do
        expect(Aoc2021::Day05.part_one).to be(5_698)
      end
    end

    context 'part_two_example' do
      it 'should have the right answer' do
        expect(Aoc2021::Day05.part_two(File.join(Aoc2021::INPUT_FILES, 'day_05_example.txt'))).to be(12)
      end
    end

    context 'part_two' do
      it 'should have the right answer' do
        expect(Aoc2021::Day05.part_two).to be(15_463)
      end
    end
  end
end
