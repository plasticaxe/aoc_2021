# frozen_string_literal: true

RSpec.describe Aoc2021 do
  describe 'day_09' do
    context 'part_one_example' do
      it 'should have the right answer' do
        expect(Aoc2021::Day09.part_one(File.join(Aoc2021::INPUT_FILES, 'day_09_example.txt'))).to be(15)
      end
    end

    context 'part_one' do
      it 'should have the right answer' do
        expect(Aoc2021::Day09.part_one).to be(566)
      end
    end

    context 'part_two_example' do
      it 'should have the right answer' do
        expect(Aoc2021::Day09.part_two(File.join(Aoc2021::INPUT_FILES, 'day_09_example.txt'))).to be(1134)
      end
    end

    context 'part_two' do
      it 'should have the right answer' do
        expect(Aoc2021::Day09.part_two).to be(891_684)
      end
    end
  end
end
