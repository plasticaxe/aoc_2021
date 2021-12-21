# frozen_string_literal: true

RSpec.describe Aoc2021 do
  describe 'day_15' do
    context 'part_one_example' do
      it 'should have the right answer' do
        expect(Aoc2021::Day15.part_one(File.join(Aoc2021::INPUT_FILES, 'day_15_example.txt'))).to be(40)
      end
    end

    context 'part_one' do
      it 'should have the right answer' do
        expect(Aoc2021::Day15.part_one).to be(398)
      end
    end

    context 'part_two_example' do
      it 'should have the right answer' do
        expect(Aoc2021::Day15.part_two(File.join(Aoc2021::INPUT_FILES, 'day_15_example.txt'))).to be(315)
      end
    end

    context 'part_two' do
      it 'should have the right answer' do
        expect(Aoc2021::Day15.part_two).to be(2817)
      end
    end
  end
end
